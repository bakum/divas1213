package ua.divas.bean;

import java.util.Date;
import java.util.UUID;

import javax.el.ELContext;
import javax.el.ExpressionFactory;
import javax.el.ValueExpression;

import javax.faces.application.Application;
import javax.faces.context.FacesContext;
import javax.faces.event.ActionEvent;

import oracle.adf.model.BindingContext;
import oracle.adf.model.binding.DCBindingContainer;
import oracle.adf.model.binding.DCIteratorBinding;
import oracle.adf.share.ADFContext;
import oracle.adf.share.security.SecurityContext;
import oracle.adf.view.rich.component.rich.data.RichTable;
import oracle.adf.view.rich.component.rich.input.RichInputDate;
import oracle.adf.view.rich.component.rich.nav.RichButton;
import oracle.adf.view.rich.context.AdfFacesContext;
import oracle.adf.view.rich.event.DialogEvent;
import oracle.adf.view.rich.event.PopupCanceledEvent;

import oracle.adf.view.rich.event.PopupFetchEvent;

import oracle.binding.BindingContainer;
import oracle.binding.OperationBinding;

import oracle.jbo.Key;
import oracle.jbo.Row;

import oracle.jbo.RowSetIterator;

import org.apache.myfaces.trinidad.event.ReturnEvent;
import org.apache.myfaces.trinidad.render.ExtendedRenderKitService;
import org.apache.myfaces.trinidad.util.Service;

import org.quartz.JobBuilder;
import org.quartz.JobDetail;
import org.quartz.SchedulerException;
import org.quartz.Trigger;
import org.quartz.TriggerBuilder;

import ua.divas.classes.StartSchedulerQuartz;

public class CcenterNewBean {
    private RichTable table;
    private String del_title;
    private String del_style;
    private String del_label;
    private RichInputDate dat;

    public CcenterNewBean() {
    }

    public void setTable(RichTable table) {
        this.table = table;
    }

    public RichTable getTable() {
        return table;
    }

    public void setDat(RichInputDate dat) {
        this.dat = dat;
    }

    public RichInputDate getDat() {
        return dat;
    }

    public BindingContainer getBindings() {
        return BindingContext.getCurrent().getCurrentBindingsEntry();
    }

    public void refresh() {
        DCBindingContainer binding = (DCBindingContainer) BindingContext.getCurrent().getCurrentBindingsEntry();
        DCIteratorBinding it = binding.findIteratorBinding("CallCenterVO1Iterator");
        String rks;
        if (it != null) {
            try {
                rks = it.getCurrentRow().getKey().toStringFormat(true);
            } catch (Exception e) {
                rks = null;
            } finally {
                it.executeQuery();
            }
            if (rks != null) {
                try {
                    it.setCurrentRowWithKey(rks);
                } catch (Exception e) {
                    e.getMessage();
                }
            }
        }

        AdfFacesContext.getCurrentInstance().addPartialTarget(getTable());
    }

    public void onRefresh(ActionEvent actionEvent) {
        refresh();
    }

    public void onPopupContactCancel(PopupCanceledEvent popupCanceledEvent) {
        BindingContainer binding = getBindings();
        DCBindingContainer dcbind = (DCBindingContainer) getBindings();
        OperationBinding ob = binding.getOperationBinding("Rollback");
        if (ob != null) {
            if (dcbind.getDataControl().isTransactionModified()) {
                ob.execute();
                AdfFacesContext.getCurrentInstance().addPartialTarget(getTable());
            }
        }
    }

    public void onContactDialog(DialogEvent dialogEvent) {
        BindingContainer binding = getBindings();
        DCBindingContainer dcbind = (DCBindingContainer) getBindings();
        OperationBinding ob = null;
        if (dialogEvent.getOutcome().name().equals("ok")) {
            ob = binding.getOperationBinding("Commit");
            if (ob != null) {
                if (dcbind.getDataControl().isTransactionModified()) {
                    ob.execute();
                    AdfFacesContext.getCurrentInstance().addPartialTarget(getTable());
                }
            }
        } else {
            ob = binding.getOperationBinding("Rollback");
            if (ob != null) {
                if (dcbind.getDataControl().isTransactionModified()) {
                    ob.execute();
                    AdfFacesContext.getCurrentInstance().addPartialTarget(getTable());
                }
            }
        }
    }

    public void onCreateOrder(ActionEvent actionEvent) {
        BindingContainer binding = getBindings();
        //DCBindingContainer dcbind = (DCBindingContainer) getBindings();
        OperationBinding ob = binding.getOperationBinding("addOrder");
        if (ob != null) {
            ob.execute();
        }
    }

    public void onReturn(ReturnEvent returnEvent) {
        BindingContainer binding = getBindings();
        //DCBindingContainer dcbind = (DCBindingContainer) getBindings();
        OperationBinding ob = null;
        ob = binding.getOperationBinding("Commit");
        if (ob != null) {
            //if (dcbind.getDataControl().isTransactionModified()) {
            ob.execute();
            AdfFacesContext.getCurrentInstance().addPartialTarget(getTable());
            // }
        }
    }

    public void onMenuPopup(PopupFetchEvent popupFetchEvent) {
        DCBindingContainer binding = (DCBindingContainer) BindingContext.getCurrent().getCurrentBindingsEntry();
        DCIteratorBinding it = binding.findIteratorBinding("CallCenterVO1Iterator");
        Row rw = it.getCurrentRow();
        String orId = (String) rw.getAttribute("LastOrderId");
        Key k = new Key(new Object[] { orId });
        DCIteratorBinding iter = (DCIteratorBinding) getBindings().get("OrdersView1Iterator");
        RowSetIterator rsi = iter.getRowSetIterator();
        Row row = rsi.findByKey(k, 1)[0];
        rsi.setCurrentRow(row);
    }

    public void setDel_title(String del_title) {
        this.del_title = del_title;
    }

    public String getDel_title() {
        DCBindingContainer bd = (DCBindingContainer) BindingContext.getCurrent().getCurrentBindingsEntry();
        DCIteratorBinding it = bd.findIteratorBinding("CallCenterVO1Iterator");
        Row currRow = it.getCurrentRow();
        Integer Del = (Integer) currRow.getAttribute("Deleted");
        String RetStr = null;
        if (Del == 0) {
            RetStr = "Вы хотите пометить объект на удаление?";
        } else {
            RetStr = "Вы хотите снять пометку на удаление?";
        }
        return RetStr;
    }

    public void setDel_style(String del_style) {
        this.del_style = del_style;
    }

    public String getDel_style() {
        DCBindingContainer bd = (DCBindingContainer) BindingContext.getCurrent().getCurrentBindingsEntry();
        DCIteratorBinding it = bd.findIteratorBinding("CallCenterVO1Iterator");
        Row currRow = it.getCurrentRow();
        Integer Del = (Integer) currRow.getAttribute("Deleted");
        String RetStr = null;
        if (Del == 0) {
            RetStr = "font-size:large; Color : Red;";
        } else {
            RetStr = "font-size:large;";
        }
        return RetStr;
    }

    public void setDel_label(String del_label) {
        this.del_label = del_label;
    }

    public String getDel_label() {
        DCBindingContainer bd = (DCBindingContainer) BindingContext.getCurrent().getCurrentBindingsEntry();
        DCIteratorBinding it = bd.findIteratorBinding("CallCenterVO1Iterator");
        Row currRow = it.getCurrentRow();
        Integer Del = (Integer) currRow.getAttribute("Deleted");
        String RetStr = null;
        if (Del == 0) {
            RetStr = "Пометить на удаление";
        } else {
            RetStr = "Снять пометку на удаление";
        }
        return RetStr;
    }

    public void onDeleteDialog(DialogEvent dialogEvent) {
        if (dialogEvent.getOutcome().name().equals("ok")) {
            DCBindingContainer bd = (DCBindingContainer) BindingContext.getCurrent().getCurrentBindingsEntry();
            DCIteratorBinding it = bd.findIteratorBinding("CallCenterVO1Iterator");
            Row currRow = it.getCurrentRow();
            Integer Del = (Integer) currRow.getAttribute("Deleted");
            if (Del == 0) {
                BindingContainer binding = BindingContext.getCurrent().getCurrentBindingsEntry();
                OperationBinding ob = binding.getOperationBinding("Delete");
                ob.execute();
            } else {
                currRow.setAttribute("Deleted", 0);
            }
            //commitChange();
            onReturn(null);
            refresh();
        }
    }

    private String getSessionUser() {
        ADFContext adfCtx = ADFContext.getCurrent();
        SecurityContext secCntx = adfCtx.getSecurityContext();
        String user = secCntx.getUserPrincipal().getName();
        return user;
    }

    public void resetBindingValue(String expression, Object newValue) {
        FacesContext ctx = FacesContext.getCurrentInstance();
        Application app = ctx.getApplication();
        ExpressionFactory elFactory = app.getExpressionFactory();
        ELContext elContext = ctx.getELContext();
        ValueExpression valueExp = elFactory.createValueExpression(elContext, expression, Object.class);
        //Class bindClass = valueExp.getType(elContext);
        //if (bindClass.isPrimitive() || bindClass.isInstance(newValue)) {
        valueExp.setValue(elContext, newValue);
        //}
    }

    public void onNotifiDialog(DialogEvent dialogEvent) throws SchedulerException {
        if (dialogEvent.getOutcome().name().equals("ok")) {
            BindingContainer binding = BindingContext.getCurrent().getCurrentBindingsEntry();
            OperationBinding ob = binding.getOperationBinding("addNotification");
            if (ob != null) {
                String cutid = UUID.randomUUID().toString().substring(0, 7);
                JobDetail job =
                    JobBuilder.newJob(Notice.class).withDescription("trigger" + cutid).withIdentity("job" + cutid,
                                                                                                    "group").build();
                Date runDate = (Date) getDat().getValue();
                Trigger trigger =
                    TriggerBuilder.newTrigger().startAt(runDate).withDescription(getSessionUser()).withIdentity("trigger" +
                                                                                                                cutid,
                                                                                                                "group").build();
                job.getJobDataMap().put("UserName", getSessionUser());
                //job.getJobDataMap().put("FacesContext", FacesContext.getCurrentInstance());
                /* String Id;
                try {
                    Id = (String) ADFUtil.evaluateEL("#{row.Id}");
                } catch (Exception e) {
                    // TODO: Add catch code
                    Id = null;
                } */
                ob.getParamsMap().put("cutid", cutid);
                //ob.getParamsMap().put("dat", runDate);
                //ob.getParamsMap().put("desc", (String) getDesc().getValue());
                String ContId = (String) ADFUtil.evaluateEL("#{bindings.ContactId.inputValue}");
                ob.getParamsMap().put("ContId", ContId);
                if (StartSchedulerQuartz.sched != null) {
                    StartSchedulerQuartz.sched.scheduleJob(job, trigger);
                    System.out.println("------- New notification! ----------------");
                    ob.execute();
                    FacesContext context = FacesContext.getCurrentInstance();
                    ExtendedRenderKitService erks =
                        Service.getService(context.getRenderKit(), ExtendedRenderKitService.class);
                    erks.addScript(context, "Growl('Внимание'," + "'Сообщение поставлено в расписание!','warning')");
                }

            }
        }
    }

    public void onNotifPopup(PopupFetchEvent popupFetchEvent) {
        resetBindingValue("#{bindings.dat.inputValue}", null);
        resetBindingValue("#{bindings.desc.inputValue}", null);
    }

    public void onReload(ActionEvent actionEvent) {
        refresh();
    }
}
