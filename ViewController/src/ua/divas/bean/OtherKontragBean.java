package ua.divas.bean;

import java.math.BigDecimal;

import javax.el.ELContext;
import javax.el.ExpressionFactory;
import javax.el.ValueExpression;

import javax.faces.application.Application;
import javax.faces.context.FacesContext;
import javax.faces.event.ActionEvent;

import javax.faces.event.ValueChangeEvent;

import oracle.adf.model.BindingContext;
import oracle.adf.model.binding.DCBindingContainer;
import oracle.adf.model.binding.DCIteratorBinding;
import oracle.adf.view.rich.component.rich.data.RichTable;

import oracle.adf.view.rich.context.AdfFacesContext;

import oracle.adf.view.rich.event.DialogEvent;
import oracle.adf.view.rich.event.PopupCanceledEvent;

import oracle.binding.BindingContainer;
import oracle.binding.OperationBinding;

import oracle.jbo.Row;

public class OtherKontragBean {
    private RichTable mainTable;
    private String del_title;
    private String del_label;
    private String del_style;

    public OtherKontragBean() {
    }

    public void setMainTable(RichTable mainTable) {
        this.mainTable = mainTable;
    }

    public RichTable getMainTable() {
        return mainTable;
    }

    public void refresh() {
        DCBindingContainer binding = (DCBindingContainer) BindingContext.getCurrent().getCurrentBindingsEntry();
        DCIteratorBinding it = binding.findIteratorBinding("KontragOtherView1Iterator");
        String rks;
        if (it != null) {
            try {
                rks = it.getCurrentRow().getKey().toStringFormat(true);
            } catch (Exception e) {
                rks = null;
            }
            it.executeQuery();
            if (rks != null) {
                try {
                    it.setCurrentRowWithKey(rks);
                } catch (Exception e) {
                    e.getMessage();
                }
            }
        }

        AdfFacesContext.getCurrentInstance().addPartialTarget(getMainTable());
    }

    public String commitChange() {
        BindingContainer binding = BindingContext.getCurrent().getCurrentBindingsEntry();
        OperationBinding ob = binding.getOperationBinding("Commit");
        ob.execute();
        refresh();
        return null;
    }

    public void onRefresh(ActionEvent actionEvent) {
        refresh();
    }

    public String getValueFrmExpression(String data) {
        FacesContext fc = FacesContext.getCurrentInstance();
        Application app = fc.getApplication();
        ExpressionFactory elFactory = app.getExpressionFactory();
        ELContext elContext = fc.getELContext();
        ValueExpression valueExp = elFactory.createValueExpression(elContext, data, Object.class);
        String Message = null;
        Object obj = valueExp.getValue(elContext);
        if (obj != null) {
            Message = obj.toString();
        }
        return Message;
    }

    public void onPaySettChange(ValueChangeEvent valueChangeEvent) {
        valueChangeEvent.getComponent().processUpdates(FacesContext.getCurrentInstance());
        //System.out.println(vce.getNewValue());
        String pId = getValueFrmExpression("#{row.bindings.PayId.attributeValue}");
        System.out.println(pId);
        DCBindingContainer bd = (DCBindingContainer) BindingContext.getCurrent().getCurrentBindingsEntry();
        DCIteratorBinding it = bd.findIteratorBinding("KontragSettingsView1Iterator");
        Row currRow = it.getCurrentRow();
        currRow.setAttribute("Summa", null);

        BindingContainer binding = BindingContext.getCurrent().getCurrentBindingsEntry();
        OperationBinding ob = binding.getOperationBinding("retrieveSumm");

        if (ob != null) {
            ob.getParamsMap().put("pId", pId);
            BigDecimal summa = (BigDecimal) ob.execute();
            System.out.println(summa);
            currRow.setAttribute("Summa", summa);
        }
    }

    public void onCancel(PopupCanceledEvent popupCanceledEvent) {
        BindingContainer binding = BindingContext.getCurrent().getCurrentBindingsEntry();
        OperationBinding ob = binding.getOperationBinding("Rollback");
        if (ob != null) {
            if (ob.isOperationEnabled()) {
                ob.execute();
                refresh();
            }
        }
    }

    public void onDialog(DialogEvent dialogEvent) {
        if (dialogEvent.getOutcome().name().equals("ok")) {
            BindingContainer binding = BindingContext.getCurrent().getCurrentBindingsEntry();
            OperationBinding ob = binding.getOperationBinding("Commit");
            if (ob != null) {
                if (ob.isOperationEnabled()) {
                    ob.execute();
                    refresh();
                }
            }
        } else {
            BindingContainer binding = BindingContext.getCurrent().getCurrentBindingsEntry();
            OperationBinding ob = binding.getOperationBinding("Rollback");
            if (ob != null) {
                if (ob.isOperationEnabled()) {
                    ob.execute();
                    refresh();
                }
            }
        }
    }
    
    public void setDel_title(String del_title) {
        this.del_title = del_title;
    }

    public String getDel_title() {
        DCBindingContainer bd = (DCBindingContainer) BindingContext.getCurrent().getCurrentBindingsEntry();
        DCIteratorBinding it = bd.findIteratorBinding("KontragOtherView1Iterator");
        Row currRow = it.getCurrentRow();
        Integer Del = (Integer) currRow.getAttribute("Deleted");
        String RetStr = null;
        if (Del == 0) {
            RetStr = "Вы хотите пометить объект на удаление?";
        } else {
            RetStr = "Вы хотите снять пометку на удаление?";
        }
        return RetStr;
    }
    
    public void setDel_label(String del_label) {
        this.del_label = del_label;
    }

    public String getDel_label() {
        DCBindingContainer bd = (DCBindingContainer) BindingContext.getCurrent().getCurrentBindingsEntry();
        DCIteratorBinding it = bd.findIteratorBinding("KontragOtherView1Iterator");
        Row currRow = it.getCurrentRow();
        Integer Del = (Integer) currRow.getAttribute("Deleted");
        String RetStr = null;
        if (Del == 0) {
            RetStr = "Пометить на удаление";
        } else {
            RetStr = "Снять пометку на удаление";
        }
        return RetStr;
    }

    public void setDel_style(String del_style) {
        this.del_style = del_style;
    }

    public String getDel_style() {
        DCBindingContainer bd = (DCBindingContainer) BindingContext.getCurrent().getCurrentBindingsEntry();
        DCIteratorBinding it = bd.findIteratorBinding("KontragOtherView1Iterator");
        Row currRow = it.getCurrentRow();
        Integer Del = (Integer) currRow.getAttribute("Deleted");
        String RetStr = null;
        if (Del == 0) {
            RetStr = "font-size:large; Color : Red;";
        } else {
            RetStr = "font-size:large;";
        }
        return RetStr;
    }

    public void onDeleteDialog(DialogEvent dialogEvent) {
        if (dialogEvent.getOutcome().name().equals("ok")) {
            DCBindingContainer bd = (DCBindingContainer) BindingContext.getCurrent().getCurrentBindingsEntry();
            DCIteratorBinding it = bd.findIteratorBinding("KontragOtherView1Iterator");
            Row currRow = it.getCurrentRow();
            Integer Del = (Integer) currRow.getAttribute("Deleted");
            if (Del == 0) {
                BindingContainer binding = BindingContext.getCurrent().getCurrentBindingsEntry();
                OperationBinding ob = binding.getOperationBinding("Delete1");
                ob.execute();
            } else {
                currRow.setAttribute("Deleted", 0);
            }
            commitChange();
        }
    }
}
