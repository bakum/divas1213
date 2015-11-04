package ua.divas.bean;

import javax.el.ELContext;
import javax.el.ExpressionFactory;
import javax.el.ValueExpression;

import javax.faces.application.Application;
import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;

import javax.faces.event.ActionEvent;

import oracle.adf.model.BindingContext;
import oracle.adf.model.binding.DCBindingContainer;
import oracle.adf.model.binding.DCDataControl;
import oracle.adf.model.binding.DCIteratorBinding;
import oracle.adf.view.rich.component.rich.RichPopup;
import oracle.adf.view.rich.component.rich.input.RichInputListOfValues;
import oracle.adf.view.rich.component.rich.input.RichInputText;
import oracle.adf.view.rich.event.DialogEvent;
import oracle.adf.view.rich.event.LaunchPopupEvent;
import oracle.adf.view.rich.event.PopupFetchEvent;

import oracle.adfinternal.view.faces.model.binding.FacesCtrlLOVBinding;

import oracle.binding.BindingContainer;
import oracle.binding.OperationBinding;

import oracle.jbo.Row;

import org.apache.myfaces.trinidad.render.ExtendedRenderKitService;
import org.apache.myfaces.trinidad.util.Service;

import ua.divas.module.AppModuleImpl;

public class OtherJsfBean {
    private RichInputText zatrName;
    private RichPopup zatrPopup;

    public OtherJsfBean() {
    }
    
    public void resetBindingValue(String expression, Object newValue) {
        FacesContext ctx = FacesContext.getCurrentInstance();
        Application app = ctx.getApplication();
        ExpressionFactory elFactory = app.getExpressionFactory();
        ELContext elContext = ctx.getELContext();
        ValueExpression valueExp = elFactory.createValueExpression(elContext, expression, Object.class);
        Class bindClass = valueExp.getType(elContext);
        valueExp.setValue(elContext, newValue);
    }

    public void setZatrName(RichInputText zatrName) {
        this.zatrName = zatrName;
    }

    public RichInputText getZatrName() {
        return zatrName;
    }
    
    private void setFullName() {
        DCBindingContainer bd = (DCBindingContainer) BindingContext.getCurrent().getCurrentBindingsEntry();
        DCIteratorBinding it = bd.findIteratorBinding("ZatratyView1Iterator");
        Row currRow = it.getCurrentRow();

        currRow.setAttribute("Fullname", getZatrName().getValue().toString());
    }
    
    protected void refreshZatr() {
        BindingContext bindingContext = BindingContext.getCurrent();
        DCDataControl dc =
            bindingContext.findDataControl("AppModuleDataControl"); // Name of application module in datacontrolBinding.cpx
        AppModuleImpl am = (AppModuleImpl) dc.getDataProvider();
        am.getZatratyView1().executeQuery();
    }
    
    public void onPopupCreateZatraty(PopupFetchEvent popupFetchEvent) {
        resetBindingValue("#{bindings.ZatrName1.inputValue}",null);
        try {
            getZatrName().resetValue();
        } catch (Exception e) {
            // TODO: Add catch code
            e.printStackTrace();
        }
    }
    
    public void onLaunchLov(LaunchPopupEvent launchPopupEvent) {
        String submittedValue = (String) launchPopupEvent.getSubmittedValue();
        //only perform query if value is submitted
        if (submittedValue != null && submittedValue.length() > 0) {
            RichInputListOfValues lovComp = (RichInputListOfValues) launchPopupEvent.getComponent();
            FacesCtrlLOVBinding.ListOfValuesModelImpl lovModel = null;
            lovModel = (FacesCtrlLOVBinding.ListOfValuesModelImpl) lovComp.getModel();
            //submittedValue = this.firstUpperCase(submittedValue);
            if (submittedValue != null) {
                try {
                    lovModel.getCriteria().getCurrentRow().setAttribute("Fullname", submittedValue);
                    lovModel.applyCriteria();
                    lovModel.performQuery(lovModel.getQueryDescriptor());
                } catch (Exception e) {
                    //applyBuyerCriteria();
                    e.printStackTrace();
                }
            }
        }
        //applyBuyerCriteria();
    }
    
    public void onNewZatratyDialogListener(DialogEvent dialogEvent) {
        if (dialogEvent.getOutcome().name().equals("ok")) {
            BindingContainer binding = BindingContext.getCurrent().getCurrentBindingsEntry();
            OperationBinding ob = binding.getOperationBinding("createZatraty");
            if (ob != null) {
                ob.getParamsMap().put("p_name", getZatrName().getValue().toString());
                ob.execute();
            }
        }
    }
    
    public void hidePopup(RichPopup popup) {
        FacesContext facesContext = FacesContext.getCurrentInstance();
        ExtendedRenderKitService service = Service.getRenderKitService(facesContext, ExtendedRenderKitService.class);
        service.addScript(facesContext,
                          "AdfPage.PAGE.findComponent('" + popup.getClientId(facesContext) + "').hide();");
    }

    public void setZatrPopup(RichPopup zatrPopup) {
        this.zatrPopup = zatrPopup;
    }

    public RichPopup getZatrPopup() {
        return zatrPopup;
    }
    
    public void onSaveZatraty(ActionEvent actionEvent) {
        if (actionEvent.getComponent().getId().equals("bNewZatraty")) {
            try {
                getZatrName().getValue().toString();
                BindingContainer binding = BindingContext.getCurrent().getCurrentBindingsEntry();
                OperationBinding ob = binding.getOperationBinding("createZatraty");
                if (ob != null) {
                    ob.getParamsMap().put("p_name", getZatrName().getValue().toString());
                    ob.execute();
                }
                hidePopup(getZatrPopup());
            } catch (Exception e) {
                FacesMessage msg =
                    new FacesMessage(FacesMessage.SEVERITY_ERROR, "Ошибка валидации",
                                     "Статья затрат не может быть пустой!");
                FacesContext ctx = FacesContext.getCurrentInstance();
                ctx.addMessage(null, msg);
            }
        }
    }
    
    public void onCancelZatrat(ActionEvent actionEvent) {
        hidePopup(getZatrPopup());
    }
}
