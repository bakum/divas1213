package ua.divas.bean;

import javax.faces.event.ActionEvent;

import oracle.adf.model.BindingContext;
import oracle.adf.model.binding.DCBindingContainer;
import oracle.adf.model.binding.DCIteratorBinding;
import oracle.adf.view.rich.component.rich.data.RichTable;
import oracle.adf.view.rich.context.AdfFacesContext;

import oracle.adf.view.rich.event.DialogEvent;

import oracle.binding.BindingContainer;
import oracle.binding.OperationBinding;

import oracle.jbo.Row;

import org.apache.myfaces.trinidad.event.ReturnEvent;

public class PkoBean {
    private RichTable table;
    private String del_title;
    private String del_style;
    private String del_label;

    public PkoBean() {
    }

    public void setTable(RichTable table) {
        this.table = table;
    }

    public RichTable getTable() {
        return table;
    }
    
    public String refresh() {

        DCBindingContainer binding = (DCBindingContainer) BindingContext.getCurrent().getCurrentBindingsEntry();
        DCIteratorBinding it = binding.findIteratorBinding("PkoView1Iterator");
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
        AdfFacesContext.getCurrentInstance().addPartialTarget(getTable());
        return null;
    }
    
    public String commitChange() {
        BindingContainer binding = BindingContext.getCurrent().getCurrentBindingsEntry();
        OperationBinding ob = binding.getOperationBinding("Commit");
        ob.execute();
        refresh();
        //ADFContext.getCurrent().getRequestScope().put("refreshNeeded", Boolean.TRUE);
        return null;
    }

    public void onReturn(ReturnEvent re) {
        System.out.println(re.getReturnParameters().get("PkoId")+" Return listener called ");
        //AdfFacesContext.getCurrentInstance().addPartialTarget(getTable());
        refresh();
    }
    
    public void onAddEntry(ActionEvent actionEvent) {
        DCBindingContainer bd = (DCBindingContainer) BindingContext.getCurrent().getCurrentBindingsEntry();
        DCIteratorBinding it = bd.findIteratorBinding("PkoView1Iterator");
        Row currRow = it.getCurrentRow();
        String Id = (String) currRow.getAttribute("Id");
        
        BindingContainer binding = BindingContext.getCurrent().getCurrentBindingsEntry();
        OperationBinding ob = binding.getOperationBinding("addEntry");
        if (ob != null) {
            
            ob.getParamsMap().put("_id", Id);
            ob.execute();
            refresh();
        }
    }

    public void onRemoveEntry(ActionEvent actionEvent) {
        DCBindingContainer bd = (DCBindingContainer) BindingContext.getCurrent().getCurrentBindingsEntry();
        DCIteratorBinding it = bd.findIteratorBinding("PkoView1Iterator");
        Row currRow = it.getCurrentRow();
        String Id = (String) currRow.getAttribute("Id");
        
        BindingContainer binding = BindingContext.getCurrent().getCurrentBindingsEntry();
        OperationBinding ob = binding.getOperationBinding("removeEntry");
        if (ob != null) {
            
            ob.getParamsMap().put("_id", Id);
            ob.execute();
            refresh();
        }
    }
    
    public void setDel_title(String del_title) {
        this.del_title = del_title;
    }

    public String getDel_title() {
        DCBindingContainer bd = (DCBindingContainer) BindingContext.getCurrent().getCurrentBindingsEntry();
        DCIteratorBinding it = bd.findIteratorBinding("PkoView1Iterator");
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

    public void setDel_style(String del_style) {
        this.del_style = del_style;
    }

    public String getDel_style() {
        DCBindingContainer bd = (DCBindingContainer) BindingContext.getCurrent().getCurrentBindingsEntry();
        DCIteratorBinding it = bd.findIteratorBinding("PkoView1Iterator");
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
    
    public void setDel_label(String del_label) {
        this.del_label = del_label;
    }

    public String getDel_label() {
        DCBindingContainer bd = (DCBindingContainer) BindingContext.getCurrent().getCurrentBindingsEntry();
        DCIteratorBinding it = bd.findIteratorBinding("PkoView1Iterator");
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

    public void onDeleteDialog(DialogEvent dialogEvent) {
        if (dialogEvent.getOutcome().name().equals("ok")) {
            DCBindingContainer bd = (DCBindingContainer) BindingContext.getCurrent().getCurrentBindingsEntry();
            DCIteratorBinding it = bd.findIteratorBinding("PkoView1Iterator");
            Row currRow = it.getCurrentRow();
            Integer Del = (Integer) currRow.getAttribute("Deleted");
            if (Del == 0) {
                BindingContainer binding = BindingContext.getCurrent().getCurrentBindingsEntry();
                OperationBinding ob = binding.getOperationBinding("Delete");
                ob.execute();
            } else {
                currRow.setAttribute("Deleted", 0);
            }
            commitChange();
        }
    }
}
