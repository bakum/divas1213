package ua.divas.bean.listener;

import java.io.IOException;

import java.security.MessageDigest;

import java.security.NoSuchAlgorithmException;

import java.util.List;

import java.util.Map;

import javax.faces.context.ExternalContext;
import javax.faces.context.FacesContext;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import oracle.adf.controller.v2.context.LifecycleContext;
import oracle.adf.controller.v2.lifecycle.PagePhaseEvent;
import oracle.adf.controller.v2.lifecycle.PagePhaseListener;
import oracle.adf.controller.v2.lifecycle.Lifecycle;
import oracle.adf.model.binding.DCBindingContainer;

import oracle.adf.share.ADFContext;

import oracle.jbo.JboException;

public class DivasListener implements PagePhaseListener {
    public DivasListener() {
        super();
    }

    @Override
    public void afterPhase(PagePhaseEvent pagePhaseEvent) {
        if (pagePhaseEvent.getPhaseId() == Lifecycle.PREPARE_RENDER_ID) {
        }
    }

    private String getSessionUserEnabledToken() throws NoSuchAlgorithmException {
        MessageDigest messageDigest = MessageDigest.getInstance("SHA-1");
        messageDigest.update("UserEnabled".getBytes());
        return new String(messageDigest.digest());
    }

    private String getSessionUserEnabled(String enbl) throws NoSuchAlgorithmException {
        MessageDigest messageDigest = MessageDigest.getInstance("SHA-1");
        messageDigest.update("true".getBytes());
        String retTrue = new String(messageDigest.digest());

        messageDigest.update("false".getBytes());
        String retFalse = new String(messageDigest.digest());
        if (enbl != null) {
            if (enbl.equalsIgnoreCase(retTrue)) {
                return "true";
            } else if (enbl.equalsIgnoreCase(retFalse)) {
                return "false";
            } else {
                return null;
            }
        } else {
            return null;
        }
    }

    @Override
    public void beforePhase(PagePhaseEvent pagePhaseEvent) {
        if (pagePhaseEvent.getPhaseId() == Lifecycle.PREPARE_RENDER_ID) {
            processErrors(pagePhaseEvent.getLifecycleContext());

            FacesContext ctx = FacesContext.getCurrentInstance();
            HttpServletRequest request = (HttpServletRequest) ctx.getExternalContext().getRequest();
            String requestUrl = request.getRequestURL().toString();
            int ind = requestUrl.lastIndexOf("index");

            ADFContext adfctx = ADFContext.getCurrent();
            Map sessionScope = adfctx.getSessionScope();
            String enblEncrypt;
            try {
                enblEncrypt = (String) sessionScope.get(getSessionUserEnabledToken());
            } catch (NoSuchAlgorithmException e) {
                enblEncrypt = "null";
            }
            String enbl;
            try {
                enbl = getSessionUserEnabled(enblEncrypt);
            } catch (NoSuchAlgorithmException e) {
                enbl = null;
            }
            System.out.println("PhaseListener Enbl user = " + enbl);
            System.out.println("PhaseListener ind = " + ind);
            if (enbl != null) {
                if (enbl.contains("false")) {
                    if (ind > 0) {
                        logout();
                    }
                }
            }
        }
    }

    private void processErrors(LifecycleContext ctx) {
        DCBindingContainer bc = (DCBindingContainer) ctx.getBindingContainer();
        if (bc != null) {
            List<Exception> exceptions = bc.getExceptionsList();
            if (exceptions != null) {
                for (Exception exception : exceptions) {
                    System.out.println("DivasPagePhaseListener processErrors exception " + exception.getMessage());
                    if (exception instanceof JboException) {
                        bc.ignoreExceptionForDisplay((JboException) exception);
                    }
                }
            }
        }

    }

    public String logout() {
        FacesContext ctx = FacesContext.getCurrentInstance();
        ExternalContext ectx = ctx.getExternalContext();
        //String logoutUrl = "faces" + ctx.getViewRoot().getViewId();
        String logoutUrl = "adfAuthentication?logout=true&end_url=/faces/home.jsf";
        //String logoutUrl = "faces/home.jsf";
        ((HttpServletRequest) ectx.getRequest()).getSession().invalidate();
        try {
            ectx.redirect(logoutUrl);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }

    private void sendForward(HttpServletRequest request, HttpServletResponse response, String forwardUrl) {
        FacesContext ctx = FacesContext.getCurrentInstance();
        RequestDispatcher dispatcher = request.getRequestDispatcher(forwardUrl);
        try {
            dispatcher.forward(request, response);
        } catch (ServletException se) {
            //reportUnexpectedLoginError("ServletException", se);
        } catch (IOException ie) {
            //reportUnexpectedLoginError("IOException", ie);
        }
        ctx.responseComplete();
    }
}
