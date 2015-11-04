package ua.divas.bean;

import java.util.Map;

import javax.el.ELContext;
import javax.el.ExpressionFactory;
import javax.el.ValueExpression;

import javax.faces.application.Application;
import javax.faces.context.FacesContext;

import oracle.adf.model.BindingContext;
import oracle.adf.model.binding.DCBindingContainer;
import oracle.adf.model.binding.DCDataControl;
import oracle.adf.share.ADFContext;
import oracle.adf.view.rich.component.rich.input.RichInputListOfValues;
import oracle.adf.view.rich.context.AdfFacesContext;
import oracle.adf.view.rich.event.LaunchPopupEvent;

import oracle.adf.view.rich.render.ClientEvent;

import oracle.adfinternal.view.faces.model.binding.FacesCtrlLOVBinding;

import oracle.binding.AttributeBinding;
import oracle.binding.BindingContainer;

import org.apache.myfaces.trinidad.event.ReturnEvent;

import org.apache.myfaces.trinidad.render.ExtendedRenderKitService;
import org.apache.myfaces.trinidad.util.Service;

import ua.divas.module.AppModuleImpl;

public class NewOrder {
    private RichInputListOfValues kontragId;
    private RichInputListOfValues kontragName;
    
    public void setKontragId(RichInputListOfValues kontragId) {
        this.kontragId = kontragId;
    }

    public RichInputListOfValues getKontragId() {
        return kontragId;
    }

    public void setKontragName(RichInputListOfValues kontragName) {
        this.kontragName = kontragName;
    }

    public RichInputListOfValues getKontragName() {
        return kontragName;
    }

    public NewOrder() {
        super();
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
    
    public void afterKontrListener() {
        System.out.println("After listener called ");
        BindingContext bindingContext = BindingContext.getCurrent();
        DCDataControl dc =
            bindingContext.findDataControl("AppModuleDataControl"); // Name of application module in datacontrolBinding.cpx
        AppModuleImpl am = (AppModuleImpl) dc.getDataProvider();
        am.getKontragentsView1().executeQuery();
        
        /* FacesContext context = FacesContext.getCurrentInstance();
        ExtendedRenderKitService erks = Service.getService(context.getRenderKit(), ExtendedRenderKitService.class);
        erks.addScript(context,"clientMethodCall()");
        
        ADFContext adfCtx = ADFContext.getCurrent();
        Map pageFlowScope = adfCtx.getPageFlowScope();
        Object val = pageFlowScope.get("KontragId"); //Name = PageFlowScope value name

        if (val != null) { //Avoid null pointer exception
            System.out.println("KontragId: "+val.toString());
            //getKontragId().setValue(val.toString());
            //AdfFacesContext.getCurrentInstance().addPartialTarget(getKontragName());
        } */
    }

     public void onStKontragId(ClientEvent clientEvent) {
        ADFContext adfCtx = ADFContext.getCurrent();
        Map pageFlowScope = adfCtx.getPageFlowScope();
        Object val = pageFlowScope.get("KontragId"); //Name = PageFlowScope value name

        if (val != null) { //Avoid null pointer exception
            System.out.println("KontragId from server: "+val.toString());
            //getKontragId().setValue(val.toString());
            //AdfFacesContext.getCurrentInstance().addPartialTarget(getKontragName());
        }
    }
    public void onReturn(ReturnEvent re) {
        //System.out.println("From return listener: "+re.getReturnValue());
        ADFContext adfCtx = ADFContext.getCurrent();
        Map pageFlowScope = adfCtx.getPageFlowScope();
        Object val = pageFlowScope.get("KontragId"); //Name = PageFlowScope value name

        if (val != null) { //Avoid null pointer exception
            System.out.println("KontragId from server: "+val.toString());
            
            DCBindingContainer bindings = 
            ((DCBindingContainer)BindingContext.getCurrent().getCurrentBindingsEntry());
                AttributeBinding attrBinding = 
                    (AttributeBinding) bindings.getControlBinding("KontragId1");
            attrBinding.setInputValue(val);
            //resetBindingValue("#{bindings.KontragId.inputValue}",val.toString());
            //getKontragId().setValue(val.toString());
            AdfFacesContext.getCurrentInstance().addPartialTarget(getKontragId());
            AdfFacesContext.getCurrentInstance().addPartialTarget(getKontragName());
        }
    }
}
