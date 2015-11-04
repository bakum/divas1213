package ua.divas.bean;

import java.io.BufferedReader;
import java.io.IOException;

import java.io.InputStreamReader;

import java.math.BigDecimal;

import java.net.InetAddress;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.net.UnknownHostException;

import java.security.MessageDigest;

import java.security.NoSuchAlgorithmException;

import java.util.Map;

import javax.faces.application.FacesMessage;
import javax.faces.context.ExternalContext;
import javax.faces.context.FacesContext;

import javax.faces.event.ActionEvent;

import javax.security.auth.Subject;
import javax.security.auth.callback.CallbackHandler;
import javax.security.auth.login.FailedLoginException;
import javax.security.auth.login.LoginException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import oracle.adf.model.BindingContext;
import oracle.adf.share.ADFContext;
import oracle.adf.share.security.SecurityContext;
import oracle.adf.view.rich.component.rich.RichPopup;
import oracle.adf.view.rich.event.DialogEvent;

import oracle.binding.BindingContainer;
import oracle.binding.OperationBinding;

import ua.divas.bean.control.OnlineUserData;
import ua.divas.classes.IllegalUserException;

import weblogic.security.URLCallbackHandler;

import weblogic.servlet.security.ServletAuthentication;


public class LoginBean {
    String _username = null;
    String _password = null;

    public static String USERNAMETOKEN = "_____demoOnlyUsernameAttrString___________";
    public static String PASSWORDTOKEN = "_____demoOnlyPasswordAttrString___________";
    public static String ENABLEDTOKEN = "UserEnabled";
    public static final String VERSION = "Copyright by BMExpert 2015 v0.1.10";

    private String versionStr;
    private RichPopup popup;

    public LoginBean() {
    }

    public void setPopup(RichPopup popup) {
        this.popup = popup;
    }

    public RichPopup getPopup() {
        return popup;
    }

    public void setUsername(String _username) {
        this._username = _username;
    }

    public String getUsername() {
        return _username;
    }

    public void setPassword(String _password) {
        this._password = _password;
    }

    public String getPassword() {
        return _password;
    }

    public void OnLoginAction(DialogEvent dialogEvent) throws IllegalUserException, NoSuchAlgorithmException {
        if (dialogEvent.getOutcome() == DialogEvent.Outcome.ok) {
            doLogin();
        } else {
            //cancel, do nothing
        }
    }

    private String doLogin() throws IllegalUserException, NoSuchAlgorithmException {
        String un = _username;
        byte[] pw = _password.getBytes();

        BindingContainer binding = BindingContext.getCurrent().getCurrentBindingsEntry();
        OperationBinding ob = binding.getOperationBinding("userExistsAndActive");
        ob.getParamsMap().put("u_login", un);
        Boolean exists = (Boolean) ob.execute();
        System.out.println("Exists: " + exists.toString());
        Boolean enabled = null;

        if (exists) {
            ob = binding.getOperationBinding("accessEnabled");
            ob.getParamsMap().put("u_login", un);
            enabled = (Boolean) ob.execute();
        }

        FacesContext ctx = FacesContext.getCurrentInstance();
        HttpServletRequest request = (HttpServletRequest) ctx.getExternalContext().getRequest();
        try {
            if (!exists) {
                throw new IllegalUserException("");
            }
            CallbackHandler handler = new URLCallbackHandler(un, pw);
            Subject mySubject = weblogic.security.services.Authentication.login(handler);
            weblogic.servlet.security.ServletAuthentication.runAs(mySubject, request);
            ServletAuthentication.generateNewSessionID(request);
            String loginUrl = null;

            //save username and password. Note that in a real application this is
            //*NOT* what you should do unencrypted. Note that this is a demo
            MessageDigest messageDigest = MessageDigest.getInstance("SHA-1");
            messageDigest.update(this.ENABLEDTOKEN.getBytes());
            String encryptedEnabledToken = new String(messageDigest.digest());

            messageDigest.update(enabled.toString().getBytes());
            String encryptedEnabled = new String(messageDigest.digest());
            //Store username , password in session for later use
            //when connecting to Twitter
            ADFContext adfctx = ADFContext.getCurrent();
            Map sessionScope = adfctx.getSessionScope();
            sessionScope.put(encryptedEnabledToken, encryptedEnabled);
            //sessionScope.put(this.USERNAMETOKEN, un);
            //sessionScope.put(this.PASSWORDTOKEN, new String(pw));
            if (!enabled) {
                loginUrl = "/adfAuthentication?success_url=/faces/reg_code";
            } else {
                loginUrl = "/adfAuthentication?success_url=/faces/index";
                OnlineUserData.addOnlineUser(un);
            }

            //String loginUrl = "/adfAuthentication?success_url=/faces/index";
            //String loginUrl = "/adfAuthentication?success_url=/faces" + ctx.getViewRoot().getViewId();
            //String loginUrl = "faces" + ctx.getViewRoot().getViewId();
            HttpServletResponse response = (HttpServletResponse) ctx.getExternalContext().getResponse();
            sendForward(request, response, loginUrl);
        } catch (FailedLoginException fle) {
            FacesMessage msg =
                new FacesMessage(FacesMessage.SEVERITY_ERROR, "Incorrect Username or Password",
                                 "Определено неверное имя пользователя" + " или пароль");
            ctx.addMessage(null, msg);
        } catch (LoginException le) {
            reportUnexpectedLoginError("LoginException", le);
        } catch (IllegalUserException iue) {
            reportUnexpectedLoginError("IllegalUser", iue);
        }
        return null;
    }

    private void sendForward(HttpServletRequest request, HttpServletResponse response, String forwardUrl) {
        FacesContext ctx = FacesContext.getCurrentInstance();
        RequestDispatcher dispatcher = request.getRequestDispatcher(forwardUrl);
        try {
            dispatcher.forward(request, response);
        } catch (ServletException se) {
            reportUnexpectedLoginError("ServletException", se);
        } catch (IOException ie) {
            reportUnexpectedLoginError("IOException", ie);
        }
        ctx.responseComplete();
    }

    private void reportUnexpectedLoginError(String errType, Exception e) {
        FacesMessage msg =
            new FacesMessage(FacesMessage.SEVERITY_ERROR, "Unexpected error during login",
                             "Ошибка валидации пользователя (" + errType + "), обратитесь к администратору");
        FacesContext.getCurrentInstance().addMessage(null, msg);
        //e.printStackTrace();
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

    public String getRoleUser() {
        ADFContext adfC = ADFContext.getCurrent();

        SecurityContext sec = adfC.getSecurityContext();
        boolean userAuth = sec.isAuthenticated();
        if (userAuth) {
            //perform some logic
        }
        String userName = sec.getUserName();
        String[] roles = sec.getUserRoles();
        for (String r : roles) {
            System.out.println("Roles: " + r);
        }
        return roles[0];
    }

    public void onLogin(ActionEvent actionEvent) throws IllegalUserException, NoSuchAlgorithmException {
        doLogin();
    }

    public void setVersionStr(String versionStr) {
        this.versionStr = versionStr;
    }

    public String getVersionStr() {
        return this.VERSION;
    }

    public void onCodeComplete(DialogEvent dialogEvent) {
        if (dialogEvent.getOutcome().name().equals("ok")) {
            logout();
        }
    }

    public void onComplete(ActionEvent actionEvent) {
        BindingContainer binding = BindingContext.getCurrent().getCurrentBindingsEntry();
        OperationBinding ob = binding.getOperationBinding("acceptCode");
        try {
            ob.execute();
            if (ob.getErrors().isEmpty()) {
                getPopup().show(new RichPopup.PopupHints());
            }
        } catch (Exception e) {
            FacesMessage msg =
                new FacesMessage(FacesMessage.SEVERITY_ERROR, "Unexpected error",
                                 "Ошибка валидации кода (" + e.getLocalizedMessage() +
                                 "), обратитесь к администратору");
            FacesContext.getCurrentInstance().addMessage(null, msg);
            //e.printStackTrace();
        }
    }
}
