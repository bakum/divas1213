package ua.divas.bean;

import java.util.ArrayList;
import java.util.List;

import javax.faces.context.FacesContext;

import javax.faces.model.SelectItem;

import oracle.adf.model.BindingContext;
import oracle.adf.view.rich.event.DialogEvent;
import oracle.adf.view.rich.model.AutoSuggestUIHints;

import oracle.binding.BindingContainer;
import oracle.binding.OperationBinding;

import oracle.jbo.Row;
import oracle.jbo.uicli.binding.JUCtrlHierBinding;
import oracle.jbo.uicli.binding.JUCtrlValueBindingRef;

public class AutoSuggestonKontragents {
    public AutoSuggestonKontragents() {
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
        JUCtrlHierBinding hierBinding = (JUCtrlHierBinding) bindings.get("KontragentsItemsLookupVO1");
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
            selectItems.add(new SelectItem((String) rw.getAttribute("Fullname"), (String) rw.getAttribute("Fullname")));
        }
        return selectItems;
        }

    public void deleteDialogListener(DialogEvent dialogEvent) {
        if (dialogEvent.getOutcome().name().equals("ok")) {
                BindingContainer bindings = getBindings();
                OperationBinding operationBinding = bindings.getOperationBinding("Delete");
                operationBinding.execute();
                operationBinding = bindings.getOperationBinding("Commit");
                operationBinding.execute();
        }
    }
}
