package ua.divas.bean;

import javax.faces.context.FacesContext;

import javax.faces.event.PhaseId;

import oracle.adf.view.rich.context.ExceptionHandler;

public class MyCustomExceptionHandler extends ExceptionHandler {

    public MyCustomExceptionHandler() {
        super();
    }

    public void handleException(FacesContext facesContext, Throwable throwable, PhaseId phaseId) throws Throwable {
        String error_message;
        error_message = throwable.getMessage();
        throw throwable;
        /* if (error_message != null && error_message.indexOf("ADF_FACES-60003") > -1) {
            System.out.println("entering in exception if condition ");
            FacesContext fac = FacesContext.getCurrentInstance();
            fac.renderResponse();
        } else {
            try {
                throw throwable;
            } catch (Throwable t) {
            }
        } */
        //check error message and handle it if you can
        /* if( … ){
       //handle exception
       …
   }
   else{
      //delegate to the default ADFc exception handler
       throw throwable;}
   } */
    }
}
