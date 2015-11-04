package ua.divas.bean;

import oracle.adf.share.ADFContext;
import oracle.adf.share.security.SecurityContext;
import oracle.adf.view.rich.render.ClientEvent;

public class OnLoadBean {
    
    private String getSessionUser() {
        ADFContext adfCtx = ADFContext.getCurrent();
        SecurityContext secCntx = adfCtx.getSecurityContext();
        String user = secCntx.getUserPrincipal().getName();
        return user;
    }

    public void onLoadMethod(ClientEvent clientEvent) {
        System.out.println("Trigger fired!!!!!!!!!!!!!");
    }
}
