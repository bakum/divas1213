package ua.divas.bean.control;

import java.io.IOException;

import java.util.Iterator;
import java.util.List;

import javax.faces.component.UIComponent;
import javax.faces.context.ExternalContext;
import javax.faces.context.FacesContext;
import javax.faces.event.ActionEvent;

import javax.faces.event.ValueChangeEvent;

import javax.servlet.http.HttpServletRequest;

import oracle.adf.model.BindingContext;
import oracle.adf.model.binding.DCBindingContainer;
import oracle.adf.model.binding.DCIteratorBinding;
import oracle.adf.share.ADFContext;
import oracle.adf.share.security.SecurityContext;
import oracle.adf.view.rich.component.rich.data.RichTree;
import oracle.adf.view.rich.component.rich.fragment.RichRegion;
import oracle.adf.view.rich.context.AdfFacesContext;
import oracle.adf.view.rich.event.DialogEvent;
import oracle.adf.view.rich.render.ClientEvent;

import oracle.binding.BindingContainer;
import oracle.binding.OperationBinding;

import org.apache.myfaces.trinidad.render.ExtendedRenderKitService;
import org.apache.myfaces.trinidad.util.Service;

public class NotificationBean {
    private String summAll;
    private boolean walletVisible;

    public NotificationBean() {
    }

    private String getSessionUser() {
        ADFContext adfCtx = ADFContext.getCurrent();
        SecurityContext secCntx = adfCtx.getSecurityContext();
        String user = secCntx.getUserPrincipal().getName();
        return user;
    }

    public void refresh() {
        DCBindingContainer binding = (DCBindingContainer) BindingContext.getCurrent().getCurrentBindingsEntry();
        DCIteratorBinding it = binding.findIteratorBinding("NotificationView1Iterator");
        it.executeQuery();
    }

    public String commitChange() {
        BindingContainer binding = BindingContext.getCurrent().getCurrentBindingsEntry();
        OperationBinding ob = binding.getOperationBinding("Commit");
        ob.execute();
        refresh();
        //ADFContext.getCurrent().getRequestScope().put("refreshNeeded", Boolean.TRUE);
        return null;
    }

    public String rollbackChange() {
        BindingContainer binding = BindingContext.getCurrent().getCurrentBindingsEntry();
        OperationBinding ob = binding.getOperationBinding("Rollback");
        ob.execute();
        refresh();
        return null;
    }

    public void onCustomEvent(ClientEvent clientEvent) {
        //System.out.println("---"+clientEvent.getParameters().get("payload"));
        if (clientEvent.getParameters().get("payload").equals("logoff")) {
            logout();
            return;
        }
        if (getSessionUser().matches((String) clientEvent.getParameters().get("payload"))) {
            refresh();
            FacesContext context = FacesContext.getCurrentInstance();
            ExtendedRenderKitService erks = Service.getService(context.getRenderKit(), ExtendedRenderKitService.class);
            erks.addScript(context,
                           "Growl('Напоминаю!'," +
                           "'У Вас новое уведомление! Перейдите в панель уведомлений.','notice')");
        }
    }

    public void onDialogListener(DialogEvent dialogEvent) {
        if (dialogEvent.getOutcome().name().equals("ok")) {
            commitChange();
        } else if (dialogEvent.getOutcome().name().equals("cancel")) {
            rollbackChange();
        }
    }

    public void onRefresh(ActionEvent actionEvent) {
        refresh();
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

    public void onHandleUnload(ClientEvent clientEvent) {
        if (clientEvent.getParameters().get("args").equals("logoff")) {
            logout();
        }
    }

    /* public void setSummAll(String summAll) {
        this.summAll = summAll;
    } */

    public String getSummAll() {
        return "В корзине платежей на сумму: " + SupplierWallet.getSummAll().toString()+" грн.";
    }

    /* public void setWalletVisible(boolean walletVisible) {
        this.walletVisible = walletVisible;
    } */

    public boolean getWalletVisible() {
        if (SupplierWallet.hasSupplier()) {
            return false;
        } else {
            return true;
        }
    }

    // find a jsf component inside the JSF page
    private UIComponent getUIComponent(String name) {
        FacesContext facesCtx = FacesContext.getCurrentInstance();
        return facesCtx.getViewRoot().findComponent(name);
    }

    // find a UIComponent inside a UIComponent
    private UIComponent getUIComponent(UIComponent component, String name) {
        if (component != null)
            System.out.println(component.getId());

        List<UIComponent> items = component.getChildren();
        Iterator<UIComponent> facets = component.getFacetsAndChildren();

        if (items.size() > 0) {
            System.out.println("got childern");
            for (UIComponent item : items) {
                UIComponent found = getUIComponent(item, name);
                if (found != null) {
                    return found;
                }
                if (item.getId().equalsIgnoreCase(name)) {
                    return item;
                }
            }
        } else if (facets.hasNext()) {
            System.out.println("got facets");
            while (facets.hasNext()) {
                UIComponent facet = facets.next();
                UIComponent found = getUIComponent(facet, name);
                if (found != null) {
                    return found;
                }
                if (facet.getId().equalsIgnoreCase(name)) {
                    return facet;
                }
            }
        }
        return null;
    }

    public void refreshTree(String region, String ttable) {
        // get the dymamic region of the main page
        RichRegion reg = (RichRegion) getUIComponent(region);
        if (reg != null) {
            // find tree 2
            RichTree rt = (RichTree) getUIComponent(reg, ttable);
            if (rt != null) {
                AdfFacesContext.getCurrentInstance().addPartialTarget(rt);
            }
        }
    }
}
