package ua.divas.bean;

import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;

import oracle.adf.controller.ControllerContext;
import oracle.adf.controller.ViewPortContext;

public class TaskFlowTemplateBean {
    public TaskFlowTemplateBean() {
    }

    public void handleException() {
        ControllerContext cntx = ControllerContext.getInstance();
        ViewPortContext vpc = cntx.getCurrentRootViewPort();
        if (vpc.isExceptionPresent()){
            Exception ed = vpc.getExceptionData();
            FacesContext fc = FacesContext.getCurrentInstance();
            fc.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR,
                                                 ed.getMessage(),
                                                 null));
            }
    }
}
