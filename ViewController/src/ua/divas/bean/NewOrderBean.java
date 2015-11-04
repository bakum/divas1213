package ua.divas.bean;

import java.util.Map;

import javax.faces.event.ValueChangeEvent;

import oracle.adf.model.BindingContext;
import oracle.adf.share.ADFContext;

import oracle.adf.view.rich.component.rich.input.RichInputListOfValues;

import oracle.adf.view.rich.context.AdfFacesContext;

import oracle.binding.BindingContainer;
import oracle.binding.OperationBinding;

import org.apache.myfaces.trinidad.event.ReturnEvent;

public class NewOrderBean {
    private RichInputListOfValues kontrag;

    public NewOrderBean() {
    }
    
    public void setKontrag(RichInputListOfValues kontrag) {
        this.kontrag = kontrag;
    }

    public RichInputListOfValues getKontrag() {
        return kontrag;
    }

    public void onDialogReturn(ReturnEvent returnEvent) {
        ADFContext adfCtx = ADFContext.getCurrent();
        Map pageFlowScope = adfCtx.getPageFlowScope();
        //only update the field if the LOV  select option was used,
        //ignore for cancel
        //Object cancelFlag = pageFlowScope.get("submitOrCancelFlag");
        //if (cancelFlag != null) {
            Object KontragId = returnEvent.getReturnValue();
            System.out.println(KontragId);
            kontrag.resetValue();
       // }
    }

    public void onChange(ValueChangeEvent valueChangeEvent) {
        String KontragId = (String)valueChangeEvent.getNewValue();
        kontrag.resetValue();
        kontrag.setValue(KontragId);
        AdfFacesContext adfFacesContext = AdfFacesContext.getCurrentInstance();
        adfFacesContext.addPartialTarget(kontrag);
    }

    public String onNewOrder() {
        BindingContainer binding = BindingContext.getCurrent().getCurrentBindingsEntry();
        OperationBinding ob = binding.getOperationBinding("CreateWithParams");
        ob.execute();
        AdfFacesContext adfFacesContext = AdfFacesContext.getCurrentInstance();
        adfFacesContext.addPartialTarget(kontrag);
        return null;
    }
}
