package ua.divas.bean;

import javax.faces.event.ActionEvent;

import oracle.adf.model.BindingContext;
import oracle.adf.model.binding.DCBindingContainer;
import oracle.adf.model.binding.DCIteratorBinding;
import oracle.adf.share.ADFContext;
import oracle.adf.view.rich.component.rich.input.RichInputListOfValues;
import oracle.adf.view.rich.event.LaunchPopupEvent;

import oracle.adfinternal.view.faces.model.binding.FacesCtrlLOVBinding;

import oracle.binding.BindingContainer;
import oracle.binding.OperationBinding;

public class ProvodkiBean {
    public ProvodkiBean() {
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
                    lovModel.getCriteria().getCurrentRow().setAttribute("Code", submittedValue);
                    lovModel.applyCriteria();
                    lovModel.performQuery(lovModel.getQueryDescriptor());
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
    }
    
    public void refresh() {
        DCBindingContainer binding = (DCBindingContainer) BindingContext.getCurrent().getCurrentBindingsEntry();
        DCIteratorBinding it = binding.findIteratorBinding("TypeDefView1Iterator");
        String rks;
        if (it != null) {
            try {
                rks = it.getCurrentRow().getKey().toStringFormat(true);
            } catch (Exception e) {
                rks = null;
            }
            it.executeQuery();
            if (rks != null) {
                try {
                    it.setCurrentRowWithKey(rks);
                } catch (Exception e) {
                    e.getMessage();
                }
            }
        }
    }
    
    public String commitChange() {
        BindingContainer binding = BindingContext.getCurrent().getCurrentBindingsEntry();
        OperationBinding ob = binding.getOperationBinding("Commit");
        ob.execute();
        refresh();
        return null;
    }

    public void onRefresh(ActionEvent actionEvent) {
        refresh();
    }
}
