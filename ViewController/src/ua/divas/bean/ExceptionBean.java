package ua.divas.bean;

import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;

import oracle.adf.controller.ControllerContext;

public class ExceptionBean {
    public ExceptionBean() {
    }

    public void onException() {
        ControllerContext cc = ControllerContext.getInstance();
        Exception ex = cc.getCurrentViewPort().getExceptionData();
        String message = ex.getMessage();

        FacesContext fc = FacesContext.getCurrentInstance();
        FacesMessage facesMessage = new FacesMessage(FacesMessage.SEVERITY_ERROR, "UTF: " + message, null);
        fc.addMessage(null, facesMessage);

        cc.getCurrentRootViewPort().clearException();
        fc.renderResponse();
    }
}

