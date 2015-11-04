package ua.divas.bean;

import javax.faces.event.ActionEvent;

import oracle.adf.model.BindingContext;

import oracle.adf.view.rich.context.AdfFacesContext;

import oracle.binding.BindingContainer;
import oracle.binding.OperationBinding;

public class CreKontragBean {
    public CreKontragBean() {
    }

    public void onExecute(ActionEvent actionEvent) {
        BindingContainer binding = BindingContext.getCurrent().getCurrentBindingsEntry();
        OperationBinding ob = binding.getOperationBinding("createByer");
        String uuid = (String)ob.execute();
        System.out.println("UUID: "+uuid);
        AdfFacesContext.getCurrentInstance().getPageFlowScope().put("KontragId", uuid);
    }
}
