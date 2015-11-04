package ua.divas.bean.listener;

import javax.servlet.http.HttpSessionEvent;

import oracle.adf.share.ADFContext;
import oracle.adf.share.security.SecurityContext;

import ua.divas.bean.control.OnlineUserData;

public class DivasHttpSessionListener implements javax.servlet.http.HttpSessionListener {
    public DivasHttpSessionListener() {
       // super();
    }

    @Override
    public void sessionCreated(HttpSessionEvent httpSessionEvent) {
        System.out.println("ID Session Created: " + httpSessionEvent.getSession().getId());
    }

    @Override
    public void sessionDestroyed(HttpSessionEvent httpSessionEvent) {
        System.out.println("ID Session Destroyed: " + httpSessionEvent.getSession().getId());
        ADFContext adfCtx = ADFContext.getCurrent();
        SecurityContext secCntx = adfCtx.getSecurityContext();
        String user = secCntx.getUserPrincipal().getName();
        System.out.println("User Destroyed: " + user);
        OnlineUserData.removeOnlineUser(user);
    }
}
