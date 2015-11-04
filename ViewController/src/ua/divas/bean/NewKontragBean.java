package ua.divas.bean;

import java.util.Map;

import javax.faces.event.ActionEvent;
import javax.faces.event.ValueChangeEvent;

import oracle.adf.model.BindingContext;
import oracle.adf.model.binding.DCBindingContainer;
import oracle.adf.model.binding.DCIteratorBinding;

import oracle.adf.share.ADFContext;
import oracle.adf.view.rich.component.rich.input.RichInputText;

import oracle.binding.BindingContainer;
import oracle.binding.OperationBinding;

import oracle.jbo.Row;

public class NewKontragBean {
    private RichInputText kontragId;

    public NewKontragBean() {
    }
    
    private void setParentId() {

        DCBindingContainer bd = (DCBindingContainer) BindingContext.getCurrent().getCurrentBindingsEntry();
        DCIteratorBinding it = bd.findIteratorBinding("KontragentsView1Iterator");
        Row currRow = it.getCurrentRow();
        BindingContainer binding = BindingContext.getCurrent().getCurrentBindingsEntry();
        OperationBinding oper = (OperationBinding) binding.getOperationBinding("retrieveCustomersFirstParentId");
        String res = (String) oper.execute();
        currRow.setAttribute("ParentId", res);

    }
    
    private void setIsBuyer() {
        DCBindingContainer bd = (DCBindingContainer) BindingContext.getCurrent().getCurrentBindingsEntry();
        DCIteratorBinding it = bd.findIteratorBinding("KontragentsView1Iterator");
        Row currRow = it.getCurrentRow();

        currRow.setAttribute("IsBuyer", new Integer(1));

    }

    public void onKonNameChange(ValueChangeEvent valueChangeEvent) {
        setParentId();
        setIsBuyer();
        BindingContainer binding = BindingContext.getCurrent().getCurrentBindingsEntry();
        OperationBinding oper = (OperationBinding) binding.getOperationBinding("initializeDataObject");
        oper.execute();
        
        ADFContext adfCtx = ADFContext.getCurrent();
        Map pageFlowScope = adfCtx.getPageFlowScope();
        pageFlowScope.put("KontragId", getKontragId().getValue());
    }

    public void setKontragId(RichInputText kontragId) {
        this.kontragId = kontragId;
    }

    public RichInputText getKontragId() {
        return kontragId;
    }

}
