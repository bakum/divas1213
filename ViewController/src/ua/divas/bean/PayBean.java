package ua.divas.bean;

import javax.faces.event.ActionEvent;

import oracle.adf.model.BindingContext;

import oracle.adf.model.binding.DCBindingContainer;
import oracle.adf.model.binding.DCIteratorBinding;
import oracle.adf.view.rich.component.rich.data.RichTable;
import oracle.adf.view.rich.context.AdfFacesContext;

import oracle.binding.BindingContainer;
import oracle.binding.OperationBinding;

public class PayBean {
    private RichTable table;

    public PayBean() {
    }
    
    public void setTable(RichTable table) {
        this.table = table;
    }

    public RichTable getTable() {
        return table;
    }
    
    public void refresh() {
        DCBindingContainer binding = (DCBindingContainer) BindingContext.getCurrent().getCurrentBindingsEntry();
        DCIteratorBinding it = binding.findIteratorBinding("PaySettingsView1Iterator");
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
    }

    public String commitWork() {
        //this.setSupplierParentId();
        //this.setIsSupplier();
        BindingContainer binding = BindingContext.getCurrent().getCurrentBindingsEntry();
        OperationBinding ob = binding.getOperationBinding("Commit");
        ob.execute();
        refresh();
        return null;
    }
    
    public void onRefresh(ActionEvent actionEvent) {
        refresh();
    }
}
