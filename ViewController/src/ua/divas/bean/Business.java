package ua.divas.bean;

import javax.faces.context.FacesContext;
import javax.faces.event.ActionEvent;

import javax.faces.event.ValueChangeEvent;

import oracle.adf.model.BindingContext;
import oracle.adf.model.binding.DCBindingContainer;
import oracle.adf.model.binding.DCIteratorBinding;
import oracle.adf.view.rich.component.rich.RichPopup;
import oracle.adf.view.rich.component.rich.data.RichCalendar;
import oracle.adf.view.rich.context.AdfFacesContext;
import oracle.adf.view.rich.event.CalendarActivityEvent;
import oracle.adf.view.rich.event.DialogEvent;
import oracle.adf.view.rich.model.CalendarActivity;

import oracle.binding.BindingContainer;

import oracle.binding.OperationBinding;

import oracle.jbo.Key;
import oracle.jbo.Row;
import oracle.jbo.RowSetIterator;

import org.apache.myfaces.trinidad.component.UIXGroup;
import org.apache.myfaces.trinidad.render.ExtendedRenderKitService;
import org.apache.myfaces.trinidad.util.Service;

public class Business {
    private RichPopup updatePopup;
    private RichPopup deletePopup;
    private RichCalendar calendar;

    public Business() {
        super();
    }

    public void refresh() {
        DCBindingContainer binding = (DCBindingContainer) BindingContext.getCurrent().getCurrentBindingsEntry();
        DCIteratorBinding it = binding.findIteratorBinding("VwNotificationCalendarView1Iterator");
        String rks;
        if (it != null) {
            try {
                rks = it.getCurrentRow().getKey().toStringFormat(true);
            } catch (Exception e) {
                rks = null;
            }
            //it.executeQuery();
            BindingContainer bd = BindingContext.getCurrent().getCurrentBindingsEntry();
            OperationBinding ob = bd.getOperationBinding("ExecuteWithParams");
            if (ob != null) {
                ob.execute();
            }
            if (rks != null) {
                try {
                    it.setCurrentRowWithKey(rks);
                } catch (Exception e) {
                    e.getMessage();
                }
            }
        }
        AdfFacesContext.getCurrentInstance().addPartialTarget(getCalendar());
    }

    public void activityListener(CalendarActivityEvent calendarActivityEvent) {
        CalendarActivity activity = calendarActivityEvent.getCalendarActivity();

        if (activity != null) {
            DCBindingContainer dcbindings = (DCBindingContainer) BindingContext.getCurrent().getCurrentBindingsEntry();
            DCIteratorBinding iterator = dcbindings.findIteratorBinding("VwNotificationCalendarView1Iterator");
            Key key = new Key(new Object[] { activity.getId() });
            RowSetIterator rsi = iterator.getRowSetIterator();
            Row row = rsi.findByKey(key, 1)[0];
            rsi.setCurrentRow(row);
        }
    }

    public BindingContainer getBindings() {
        return BindingContext.getCurrent().getCurrentBindingsEntry();
    }

    public void setUpdatePopup(RichPopup updatePopup) {
        this.updatePopup = updatePopup;
    }

    public RichPopup getUpdatePopup() {
        return updatePopup;
    }

    public void onDialogDelete(DialogEvent dialogEvent) {
        if (dialogEvent.getOutcome().name().equals("ok")) {
            BindingContainer bindings = getBindings();
            OperationBinding operationBinding = bindings.getOperationBinding("Delete");
            operationBinding.execute();
            if (operationBinding.getErrors().isEmpty()) {
                operationBinding = bindings.getOperationBinding("Commit");
                operationBinding.execute();
                AdfFacesContext.getCurrentInstance().addPartialTarget(getCalendar());
            }
            //refresh();
        }
    }

    public void onDelete(ActionEvent actionEvent) {
        BindingContainer bindings = getBindings();
        OperationBinding operationBinding = bindings.getOperationBinding("Delete");
        operationBinding.execute();
        if (operationBinding.getErrors().isEmpty()) {
            operationBinding = bindings.getOperationBinding("Commit");
            operationBinding.execute();
            //refresh();
        }
        //hidePopup(getDeletePopup());
    }

    public void hidePopup(RichPopup popup) {
        FacesContext facesContext = FacesContext.getCurrentInstance();
        ExtendedRenderKitService service = Service.getRenderKitService(facesContext, ExtendedRenderKitService.class);
        service.addScript(facesContext,
                          "AdfPage.PAGE.findComponent('" + popup.getClientId(facesContext) + "').hide();");
    }

    public void setDeletePopup(RichPopup deletePopup) {
        this.deletePopup = deletePopup;
    }

    public RichPopup getDeletePopup() {
        return deletePopup;
    }

    public void onCancel(ActionEvent actionEvent) {
        hidePopup(getDeletePopup());
    }

    public void setCalendar(RichCalendar calendar) {
        this.calendar = calendar;
    }

    public RichCalendar getCalendar() {
        return calendar;
    }

    public void onCangeRegular(ValueChangeEvent vce) {
        System.out.println("Value changed " + vce.getNewValue().toString());
        //Boolean newVal = (Boolean) vce.getNewValue();
    }

    public void onCreateDialogListener(DialogEvent dialogEvent) {
        if (dialogEvent.getOutcome().name().equals("ok")) {
            //commitChange();
        } else if (dialogEvent.getOutcome().name().equals("cancel")) {
            //rollbackChange();
        }
        refresh();
    }
}
