package ua.divas.bean;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.faces.event.ActionEvent;
import javax.faces.event.ValueChangeEvent;
import javax.faces.model.SelectItem;

import oracle.adf.controller.ControllerContext;
import oracle.adf.model.BindingContext;

import oracle.adf.model.binding.DCBindingContainer;
import oracle.adf.model.binding.DCIteratorBinding;
import oracle.adf.view.rich.component.rich.data.RichTable;

import oracle.adf.view.rich.component.rich.output.RichOutputFormatted;
import oracle.adf.view.rich.context.AdfFacesContext;
import oracle.adf.view.rich.event.QueryEvent;
import oracle.adf.view.rich.model.AttributeCriterion;
import oracle.adf.view.rich.model.ConjunctionCriterion;
import oracle.adf.view.rich.model.Criterion;
import oracle.adf.view.rich.model.FilterableQueryDescriptor;

import oracle.binding.BindingContainer;
import oracle.binding.OperationBinding;

import oracle.jbo.Row;
import oracle.jbo.uicli.binding.JUCtrlHierBinding;
import oracle.jbo.uicli.binding.JUCtrlValueBindingRef;

public class UsersBean {
    private String codeLabel;
    private RichOutputFormatted code;

    public UsersBean() {
    }


    public BindingContainer getBindings() {
        return BindingContext.getCurrent().getCurrentBindingsEntry();
    }

    public List<SelectItem> onSuggest(String string) {
        //get access to the binding context and binding container at runtime
        BindingContext bctx = BindingContext.getCurrent();
        BindingContainer bindings = bctx.getCurrentBindingsEntry();
        //set the bind variable value that is used to filter the View Object
        //query of the suggest list. The View Object instance has a View
        //Criteria assigned
        OperationBinding setVariable = (OperationBinding) bindings.get("setStartCriteria");
        setVariable.getParamsMap().put("value", string);
        setVariable.execute();
        //the data in the suggest list  is queried by a tree binding.
        JUCtrlHierBinding hierBinding = (JUCtrlHierBinding) bindings.get("UsersItemsLookupVO1");
        //re-query the list based on the new bind variable values
        hierBinding.executeQuery();
        //The rangeSet,  the list  of queries entries, is of type
        //
        ////JUCtrlValueBndingRef.
        List<JUCtrlValueBindingRef> displayDataList = hierBinding.getRangeSet();
        ArrayList<SelectItem> selectItems = new ArrayList<SelectItem>();
        for (JUCtrlValueBindingRef displayData : displayDataList) {
            Row rw = displayData.getRow();
            //populate the SelectItem list
            selectItems.add(new SelectItem((String) rw.getAttribute("Login"), (String) rw.getAttribute("Login")));
        }
        return selectItems;
    }

    public void handleExceptionShowMessageInPopupDialog() {
        ControllerContext cc = ControllerContext.getInstance();
        Exception ex = cc.getCurrentViewPort().getExceptionData();
        String message = ex.getMessage();

        FacesContext fc = FacesContext.getCurrentInstance();
        FacesMessage facesMessage = new FacesMessage(FacesMessage.SEVERITY_ERROR, "UTF: " + message, null);
        fc.addMessage(null, facesMessage);

        cc.getCurrentRootViewPort().clearException();
        fc.renderResponse();
    }


    public void setCodeLabel(String codeLabel) {
        this.codeLabel = codeLabel;
    }

    public String getCodeLabel() {
        String rez = null;
        DCBindingContainer binding = (DCBindingContainer) BindingContext.getCurrent().getCurrentBindingsEntry();
        DCIteratorBinding it = binding.findIteratorBinding("UsersView1Iterator");
        if (it != null) {
            Row curRow = it.getCurrentRow();
            oracle.jbo.domain.Date dt = (oracle.jbo.domain.Date) curRow.getAttribute("DateBefore");
            if (null == dt) {
                return "Код не может быть рассчитан";
            }

        }

        BindingContainer bd = BindingContext.getCurrent().getCurrentBindingsEntry();
        OperationBinding oper = (OperationBinding) bd.getOperationBinding("generateCode");
        rez = (String) oper.execute();
        return rez;
    }

    public void setCode(RichOutputFormatted code) {
        this.code = code;
    }

    public RichOutputFormatted getCode() {
        return code;
    }

    public void onDateChange(ValueChangeEvent valueChangeEvent) {
        AdfFacesContext.getCurrentInstance().addPartialTarget(getCode());
        /* DCBindingContainer binding = (DCBindingContainer) BindingContext.getCurrent().getCurrentBindingsEntry();
        DCIteratorBinding it = binding.findIteratorBinding("UsersView1Iterator");
        if (it != null) {
            Row curRow = it.getCurrentRow();
            curRow.setAttribute("DateBeforeAccept", 0);
        } */
    }
}
