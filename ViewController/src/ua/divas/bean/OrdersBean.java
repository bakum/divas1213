package ua.divas.bean;


import java.math.BigDecimal;

import java.util.Date;
import java.util.List;

import java.util.UUID;

import javax.el.ELContext;

import javax.el.ExpressionFactory;
import javax.el.ValueExpression;

import javax.faces.application.Application;
import javax.faces.application.FacesMessage;
import javax.faces.component.UIViewRoot;
import javax.faces.context.FacesContext;
import javax.faces.event.ActionEvent;
import javax.faces.event.ValueChangeEvent;

import oracle.adf.controller.ControllerContext;
import oracle.adf.model.AttributeBinding;
import oracle.adf.model.BindingContext;
import oracle.adf.model.binding.DCBindingContainer;
import oracle.adf.model.binding.DCDataControl;
import oracle.adf.model.binding.DCIteratorBinding;
import oracle.adf.share.ADFContext;
import oracle.adf.share.security.SecurityContext;
import oracle.adf.view.rich.component.rich.data.RichTable;
import oracle.adf.view.rich.component.rich.input.RichInputComboboxListOfValues;
import oracle.adf.view.rich.component.rich.input.RichInputDate;
import oracle.adf.view.rich.component.rich.input.RichInputListOfValues;
import oracle.adf.view.rich.component.rich.input.RichInputText;
import oracle.adf.view.rich.component.rich.input.RichSelectOneChoice;
import oracle.adf.view.rich.context.AdfFacesContext;
import oracle.adf.view.rich.event.DialogEvent;
import oracle.adf.view.rich.event.LaunchPopupEvent;
import oracle.adf.view.rich.event.PopupCanceledEvent;

import oracle.adf.view.rich.event.PopupFetchEvent;

import oracle.adf.view.rich.event.QueryEvent;
import oracle.adf.view.rich.event.ReturnPopupEvent;
import oracle.adf.view.rich.model.AttributeCriterion;
import oracle.adf.view.rich.model.ConjunctionCriterion;
import oracle.adf.view.rich.model.Criterion;
import oracle.adf.view.rich.model.FilterableQueryDescriptor;

import oracle.adf.view.rich.model.ListOfValuesModel;

import oracle.adfinternal.view.faces.model.binding.FacesCtrlLOVBinding;

import oracle.binding.BindingContainer;
import oracle.binding.OperationBinding;

import oracle.jbo.ApplicationModule;
import oracle.jbo.Key;
import oracle.jbo.Row;

import oracle.jbo.ViewCriteria;
import oracle.jbo.ViewCriteriaManager;
import oracle.jbo.ViewObject;
import oracle.jbo.uicli.binding.JUCtrlHierBinding;

import org.apache.myfaces.trinidad.event.AttributeChangeEvent;
import org.apache.myfaces.trinidad.event.PollEvent;
import org.apache.myfaces.trinidad.event.ReturnEvent;
import org.apache.myfaces.trinidad.model.CollectionModel;
import org.apache.myfaces.trinidad.model.RowKeySet;

import org.apache.myfaces.trinidad.render.ExtendedRenderKitService;
import org.apache.myfaces.trinidad.util.Service;

import org.quartz.JobBuilder;
import org.quartz.JobDetail;
import org.quartz.SchedulerException;
import org.quartz.Trigger;
import org.quartz.TriggerBuilder;

import ua.divas.classes.StartSchedulerQuartz;
import ua.divas.module.AppModuleImpl;

public class OrdersBean {


    private RichInputDate dat;
    private RichInputText desc;
    private String del_title;
    private String del_style;
    private String del_label;

    public OrdersBean() {
    }

    private RichSelectOneChoice division;
    private RichSelectOneChoice currency;
    private RichInputListOfValues kontrag;
    private RichInputText price;
    private RichInputText qtt;
    private RichTable mainTable;
    public Boolean refreshNeeded;

    public void setRefreshNeeded(Boolean refreshNeeded) {
        this.refreshNeeded = refreshNeeded;
    }

    public Boolean getRefreshNeeded() {
        return refreshNeeded;
    }

    public void setPrice(RichInputText price) {
        this.price = price;
    }

    public RichInputText getPrice() {
        return price;
    }

    public void setQtt(RichInputText qtt) {
        this.qtt = qtt;
    }

    public RichInputText getQtt() {
        return qtt;
    }

    public void setMainTable(RichTable mainTable) {
        this.mainTable = mainTable;
    }

    public RichTable getMainTable() {
        return mainTable;
    }

    private String upperCase(String s) {
        StringBuffer buf = new StringBuffer(s.toUpperCase());
        char ch;
        for (int k = 0, n = buf.length(); k < n; k++) {
            ch = buf.charAt(k);
            buf.setCharAt(k, ch >= 'а' && ch <= 'я' ? (char) (ch - 'а' + 'А') : (ch == 'ё' ? 'Ё' : ch));
        }
        return buf.toString();
    }

    private String firstUpperCase(String word) {
        if (word == null || word.isEmpty())
            return ""; //или return word;
        return word.substring(0, 1).toUpperCase() + word.substring(1);
    }

    public void setDivision(RichSelectOneChoice division) {
        this.division = division;
    }

    public RichSelectOneChoice getDivision() {
        return division;
    }

    public void setCurrency(RichSelectOneChoice currency) {
        this.currency = currency;
    }

    public RichSelectOneChoice getCurrency() {
        return currency;
    }

    public void setKontrag(RichInputListOfValues kontrag) {
        this.kontrag = kontrag;
    }

    public RichInputListOfValues getKontrag() {
        return kontrag;
    }

    public void refresh() {
        DCBindingContainer binding = (DCBindingContainer) BindingContext.getCurrent().getCurrentBindingsEntry();
        DCIteratorBinding it = binding.findIteratorBinding("OrdersView1Iterator");
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

        AdfFacesContext.getCurrentInstance().addPartialTarget(getMainTable());
        refreshZamer();
    }

    public String commitChange() {
        BindingContainer binding = BindingContext.getCurrent().getCurrentBindingsEntry();
        OperationBinding ob = binding.getOperationBinding("Commit");
        ob.execute();
        refresh();
        ADFContext.getCurrent().getRequestScope().put("refreshNeeded", Boolean.TRUE);
        return null;
    }

    public String rollbackChange() {
        BindingContainer binding = BindingContext.getCurrent().getCurrentBindingsEntry();
        OperationBinding ob = binding.getOperationBinding("Rollback");
        ob.execute();
        refresh();
        return null;
    }

    public void onNewKontragCancel(PopupCanceledEvent popupCanceledEvent) {
        BindingContainer binding = BindingContext.getCurrent().getCurrentBindingsEntry();
        binding.getOperationBinding("Rollback").execute();
    }

    public void onOrderCancel(PopupCanceledEvent popupCanceledEvent) {
        rollbackChange();
        BindingContainer binding = BindingContext.getCurrent().getCurrentBindingsEntry();
        OperationBinding ob = binding.getOperationBinding("removeAllViewCriteria");
        if (ob != null) {
            ob.execute();
        }
    }

    public void dialogListener(DialogEvent dialogEvent) {
        if (dialogEvent.getOutcome().name().equals("ok")) {
            commitChange();
        } else if (dialogEvent.getOutcome().name().equals("cancel")) {
            rollbackChange();
        }
        BindingContainer binding = BindingContext.getCurrent().getCurrentBindingsEntry();
        OperationBinding ob = binding.getOperationBinding("removeAllViewCriteria");
        if (ob != null) {
            ob.execute();
        }
    }

    public void onPopupFetch(PopupFetchEvent popupFetchEvent) {
        if (popupFetchEvent.getLaunchSourceClientId().contains("b5")) {
            BindingContainer bindings = BindingContext.getCurrent().getCurrentBindingsEntry();
            OperationBinding operationBinding = bindings.getOperationBinding("CreateInsert");
            operationBinding.execute();
        }
        BindingContainer binding = BindingContext.getCurrent().getCurrentBindingsEntry();
        OperationBinding ob = binding.getOperationBinding("ExecuteWithParams");
        if (ob != null) {
            /* System.out.println((String) this.getCurrency().getValue());
            System.out.println((String) this.getDivision().getValue());
            ob.getParamsMap().put("currency", (String) this.getCurrency().getValue());
            ob.getParamsMap().put("division", (String) this.getDivision().getValue()); */
            ob.execute();

            DCBindingContainer bd = (DCBindingContainer) BindingContext.getCurrent().getCurrentBindingsEntry();
            DCIteratorBinding it = bd.findIteratorBinding("KassaVO1Iterator");
            if (it != null) {
                it.executeQuery();
            }
        }
        ob = binding.getOperationBinding("findKontragentById");
        ob.execute();

    }

    public void onDepChange(ValueChangeEvent valueChangeEvent) {
        BindingContainer binding = BindingContext.getCurrent().getCurrentBindingsEntry();
        OperationBinding ob = binding.getOperationBinding("ExecuteWithParams");
        if (ob != null) {
            System.out.println((String) this.getCurrency().getValue());
            System.out.println((String) this.getDivision().getValue());
            ob.getParamsMap().put("currency", (String) this.getCurrency().getValue());
            ob.getParamsMap().put("division", (String) this.getDivision().getValue());
            ob.execute();

            DCBindingContainer bd = (DCBindingContainer) BindingContext.getCurrent().getCurrentBindingsEntry();
            DCIteratorBinding it = bd.findIteratorBinding("KassaVO1Iterator");
            if (it != null) {
                it.executeQuery();
            }
        }
    }

    public void onKonChange(ValueChangeEvent valueChangeEvent) {
        AdfFacesContext fc = AdfFacesContext.getCurrentInstance();
        fc.addPartialTarget(this.getKontrag());

        DCBindingContainer bd = (DCBindingContainer) BindingContext.getCurrent().getCurrentBindingsEntry();
        DCIteratorBinding it = bd.findIteratorBinding("OrdersView1Iterator");
        Row currRow = it.getCurrentRow();
        String IdKon = (String) currRow.getAttribute("KontragId");
        System.out.println(IdKon);

        BindingContainer binding = BindingContext.getCurrent().getCurrentBindingsEntry();
        OperationBinding ob = binding.getOperationBinding("findKontragentById");
        if (ob != null) {
            System.out.println(valueChangeEvent.getNewValue().toString());
            System.out.println((String) this.getKontrag().getValue());
            ob.getParamsMap().put("Id", (String) this.getKontrag().getValue());
            ob.execute();
        }
    }

    private void applyBuyerCriteria() {
        BindingContainer bindings = BindingContext.getCurrent().getCurrentBindingsEntry();
        DCIteratorBinding dciter = (DCIteratorBinding) bindings.get("KontragentsView1Iterator");
        ViewObject vo = dciter.getViewObject();
        ViewCriteriaManager vcm = vo.getViewCriteriaManager();
        ViewCriteria vc = vcm.getViewCriteria("KontragentsFilterItemsByName");
        vo.applyViewCriteria(vc);
        vo.executeQuery();
    }

    private void applyZamerCriteria() {
        BindingContainer bindings = BindingContext.getCurrent().getCurrentBindingsEntry();
        DCIteratorBinding dciter = (DCIteratorBinding) bindings.get("KontragentsView1Iterator");
        ViewObject vo = dciter.getViewObject();
        ViewCriteriaManager vcm = vo.getViewCriteriaManager();
        ViewCriteria vc = vcm.getViewCriteria("KontragentsZamerCriteria");
        vo.applyViewCriteria(vc);
        vo.executeQuery();
    }

    public void onLaunchLov(LaunchPopupEvent launchPopupEvent) {
        String submittedValue = (String) launchPopupEvent.getSubmittedValue();
        //only perform query if value is submitted
        if (submittedValue != null && submittedValue.length() > 0) {
            RichInputListOfValues lovComp = (RichInputListOfValues) launchPopupEvent.getComponent();
            FacesCtrlLOVBinding.ListOfValuesModelImpl lovModel = null;
            lovModel = (FacesCtrlLOVBinding.ListOfValuesModelImpl) lovComp.getModel();
            submittedValue = this.firstUpperCase(submittedValue);
            if (submittedValue != null) {
                try {
                    lovModel.getCriteria().getCurrentRow().setAttribute("Fullname", submittedValue);
                    lovModel.applyCriteria();
                    lovModel.performQuery(lovModel.getQueryDescriptor());
                } catch (Exception e) {
                    applyBuyerCriteria();
                    e.printStackTrace();
                }
            }
        }
        applyBuyerCriteria();
    }

    public void onLaunchComboLov(LaunchPopupEvent launchPopupEvent) {
        String submittedValue = (String) launchPopupEvent.getSubmittedValue();
        //only perform query if value is submitted
        if (submittedValue != null && submittedValue.length() > 0) {
            RichInputComboboxListOfValues lovComp = (RichInputComboboxListOfValues) launchPopupEvent.getComponent();
            FacesCtrlLOVBinding.ListOfValuesModelImpl lovModel = null;
            lovModel = (FacesCtrlLOVBinding.ListOfValuesModelImpl) lovComp.getModel();
            submittedValue = this.firstUpperCase(submittedValue);
            if (submittedValue != null) {
                try {
                    lovModel.getCriteria().getCurrentRow().setAttribute("Fullname", submittedValue);
                    lovModel.applyCriteria();
                    lovModel.performQuery(lovModel.getQueryDescriptor());
                } catch (Exception e) {
                    applyZamerCriteria();
                    e.printStackTrace();
                }
            }
        }
        applyZamerCriteria();
    }


    public void onPopupCreateKontrag(PopupFetchEvent popupFetchEvent) {
        BindingContainer binding = BindingContext.getCurrent().getCurrentBindingsEntry();
        OperationBinding ob = binding.getOperationBinding("CreateInsert1");
        ob.execute();
    }

    public void onPopupCreateZatraty(PopupFetchEvent popupFetchEvent) {
        BindingContainer binding = BindingContext.getCurrent().getCurrentBindingsEntry();
        OperationBinding ob = binding.getOperationBinding("CreateInsert6");
        ob.execute();
    }

    private void setIsBuyer() {
        DCBindingContainer bd = (DCBindingContainer) BindingContext.getCurrent().getCurrentBindingsEntry();
        DCIteratorBinding it = bd.findIteratorBinding("KontragentsView1Iterator");
        Row currRow = it.getCurrentRow();

        currRow.setAttribute("IsBuyer", new Integer(1));


    }

    private void setIsSupplier() {
        DCBindingContainer bd = (DCBindingContainer) BindingContext.getCurrent().getCurrentBindingsEntry();
        DCIteratorBinding it = bd.findIteratorBinding("KontragentsView1Iterator");
        Row currRow = it.getCurrentRow();

        currRow.setAttribute("IsSupplier", new Integer(1));


    }

    private void setIsMeasurer() {
        DCBindingContainer bd = (DCBindingContainer) BindingContext.getCurrent().getCurrentBindingsEntry();
        DCIteratorBinding it = bd.findIteratorBinding("KontragentsView1Iterator");
        Row currRow = it.getCurrentRow();

        currRow.setAttribute("IsMeasurer", new Integer(1));


    }

    private void setParentId() {

        DCBindingContainer bd = (DCBindingContainer) BindingContext.getCurrent().getCurrentBindingsEntry();
        DCIteratorBinding it = bd.findIteratorBinding("KontragentsView1Iterator");
        Row currRow = it.getCurrentRow();
        BindingContainer binding = BindingContext.getCurrent().getCurrentBindingsEntry();
        OperationBinding oper = (OperationBinding) binding.getOperationBinding("retrieveCustomersFirstParentId");
        String res = (String) oper.execute();
        currRow.setAttribute("ParentId", res);

    }

    private void setZamerParentId() {

        DCBindingContainer bd = (DCBindingContainer) BindingContext.getCurrent().getCurrentBindingsEntry();
        DCIteratorBinding it = bd.findIteratorBinding("KontragentsView1Iterator");
        Row currRow = it.getCurrentRow();
        BindingContainer binding = BindingContext.getCurrent().getCurrentBindingsEntry();
        OperationBinding oper = (OperationBinding) binding.getOperationBinding("retrieveZamerFirstParentId");
        String res = (String) oper.execute();
        currRow.setAttribute("ParentId", res);

    }

    private void setSupplierParentId() {

        DCBindingContainer bd = (DCBindingContainer) BindingContext.getCurrent().getCurrentBindingsEntry();
        DCIteratorBinding it = bd.findIteratorBinding("KontragentsView1Iterator");
        Row currRow = it.getCurrentRow();
        BindingContainer binding = BindingContext.getCurrent().getCurrentBindingsEntry();
        OperationBinding oper = (OperationBinding) binding.getOperationBinding("retrieveSupplierFirstParentId");
        String res = (String) oper.execute();
        currRow.setAttribute("ParentId", res);

    }

    public void onNewKontragentDialogListener(DialogEvent dialogEvent) {
        if (dialogEvent.getOutcome().name().equals("ok")) {
            this.setIsBuyer();
            this.setParentId();
            BindingContainer binding = BindingContext.getCurrent().getCurrentBindingsEntry();
            OperationBinding ob = binding.getOperationBinding("Commit");
            ob.execute();
            DCBindingContainer bd = (DCBindingContainer) BindingContext.getCurrent().getCurrentBindingsEntry();
            DCIteratorBinding it = bd.findIteratorBinding("KontragentsView1Iterator");
            if (it != null) {
                it.executeQuery();
            }
        }
    }

    public void onRefreshOrders(ActionEvent actionEvent) {
        this.refresh();
    }

    public void onNewZamerDialogListener(DialogEvent dialogEvent) {
        if (dialogEvent.getOutcome().name().equals("ok")) {
            this.setIsMeasurer();
            this.setZamerParentId();
            BindingContainer binding = BindingContext.getCurrent().getCurrentBindingsEntry();
            OperationBinding ob = binding.getOperationBinding("Commit");
            ob.execute();
            DCBindingContainer bd = (DCBindingContainer) BindingContext.getCurrent().getCurrentBindingsEntry();
            DCIteratorBinding it = bd.findIteratorBinding("KontragentsView1Iterator");
            if (it != null) {
                it.executeQuery();
            }
        }
    }

    public void onNewSupplierDialogListener(DialogEvent dialogEvent) {
        if (dialogEvent.getOutcome().name().equals("ok")) {
            this.setIsSupplier();
            this.setSupplierParentId();
            BindingContainer binding = BindingContext.getCurrent().getCurrentBindingsEntry();
            OperationBinding ob = binding.getOperationBinding("Commit");
            ob.execute();
            DCBindingContainer bd = (DCBindingContainer) BindingContext.getCurrent().getCurrentBindingsEntry();
            DCIteratorBinding it = bd.findIteratorBinding("KontragentsView1Iterator");
            if (it != null) {
                it.executeQuery();
            }
        }
    }

    public void onNewZatratyDialogListener(DialogEvent dialogEvent) {
        if (dialogEvent.getOutcome().name().equals("ok")) {
            //this.setIsSupplier();
            //this.setSupplierParentId();
            BindingContainer binding = BindingContext.getCurrent().getCurrentBindingsEntry();
            OperationBinding ob = binding.getOperationBinding("Commit");
            ob.execute();
            DCBindingContainer bd = (DCBindingContainer) BindingContext.getCurrent().getCurrentBindingsEntry();
            DCIteratorBinding it = bd.findIteratorBinding("ZatratyView1Iterator");
            if (it != null) {
                it.executeQuery();
            }
        }
    }

    public String getValueFrmExpression(String data) {
        FacesContext fc = FacesContext.getCurrentInstance();
        Application app = fc.getApplication();
        ExpressionFactory elFactory = app.getExpressionFactory();
        ELContext elContext = fc.getELContext();
        ValueExpression valueExp = elFactory.createValueExpression(elContext, data, Object.class);
        String Message = null;
        Object obj = valueExp.getValue(elContext);
        if (obj != null) {
            Message = obj.toString();
        }
        return Message;
    }

    public void onNomChanged(ValueChangeEvent vce) {
        vce.getComponent().processUpdates(FacesContext.getCurrentInstance());
        //System.out.println(vce.getNewValue());
        String NomId = getValueFrmExpression("#{row.bindings.NomId.attributeValue}");
        System.out.println(NomId);
        DCBindingContainer bd = (DCBindingContainer) BindingContext.getCurrent().getCurrentBindingsEntry();
        DCIteratorBinding it = bd.findIteratorBinding("OrdersTpUslugiView2Iterator");
        Row currRow = it.getCurrentRow();
        currRow.setAttribute("MeasureId", null);
        currRow.setAttribute("Price", null);
        currRow.setAttribute("Summ", null);
        currRow.setAttribute("Quantity", null);

        BindingContainer binding = BindingContext.getCurrent().getCurrentBindingsEntry();
        OperationBinding ob = binding.getOperationBinding("retrieveMeasure");
        if (ob != null) {
            ob.getParamsMap().put("NomId", NomId);
            String measure = (String) ob.execute();
            System.out.println(measure);
            currRow.setAttribute("MeasureId", measure);
        }

        ob = binding.getOperationBinding("retrievePrice");
        if (ob != null) {
            ob.getParamsMap().put("NomId", NomId);
            BigDecimal price = (BigDecimal) ob.execute();
            System.out.println(price);
            currRow.setAttribute("Price", price);
        }
    }

    public void onPriceChange(ValueChangeEvent vce) {
        DCBindingContainer bd = (DCBindingContainer) BindingContext.getCurrent().getCurrentBindingsEntry();
        DCIteratorBinding it = bd.findIteratorBinding("OrdersTpUslugiView2Iterator");
        Row currRow = it.getCurrentRow();
        BigDecimal p = (BigDecimal) getPrice().getValue();
        BigDecimal q = (BigDecimal) getQtt().getValue();
        System.out.println(p);
        System.out.println(q);
        BindingContainer binding = BindingContext.getCurrent().getCurrentBindingsEntry();
        OperationBinding ob = binding.getOperationBinding("retrieveSumm");
        if (ob != null) {
            ob.getParamsMap().put("p", p);
            ob.getParamsMap().put("q", q);
            BigDecimal s = (BigDecimal) ob.execute();
            System.out.println(s);
            currRow.setAttribute("Summ", s);
        }
    }

    public void onFilterClear(ActionEvent actionEvent) {
        FilterableQueryDescriptor queryDescriptor = (FilterableQueryDescriptor) getMainTable().getFilterModel();
        if (queryDescriptor != null && queryDescriptor.getFilterConjunctionCriterion() != null) {
            ConjunctionCriterion cc = queryDescriptor.getFilterConjunctionCriterion();
            List<Criterion> lc = cc.getCriterionList();
            for (Criterion c : lc) {
                if (c instanceof AttributeCriterion) {
                    AttributeCriterion ac = (AttributeCriterion) c;
                    ac.setValue(null);
                }
            }
            getMainTable().queueEvent(new QueryEvent(getMainTable(), queryDescriptor));
        }
    }

    public void onAttrKonChange(AttributeChangeEvent attributeChangeEvent) {
        System.out.println(attributeChangeEvent.getNewValue().toString());
    }

    public void onRefreshKon(ActionEvent actionEvent) {
        BindingContainer binding = BindingContext.getCurrent().getCurrentBindingsEntry();
        OperationBinding ob = binding.getOperationBinding("findKontragentById");
        if (ob != null) {
            System.out.println((String) this.getKontrag().getValue());
            ob.getParamsMap().put("Id", (String) this.getKontrag().getValue());
            ob.execute();
        }
    }

    public void onKonReturnListener(ReturnPopupEvent returnPopupEvent) {

        //the selected rows are defined in a RowKeySet.As the LOV table only
        //supports single selections, there is only one entry in the rks
        RowKeySet rks = (RowKeySet) returnPopupEvent.getReturnValue();

        //the ADF Faces table row key is a list. The list contains the
        //oracle.jbo.Key
        List tableRowKey = (List) rks.iterator().next();


        //get the selected row by its JBO key
        Key key = (Key) tableRowKey.get(0);
        System.out.println(key.getKeyValues()[0]);

        BindingContainer binding = BindingContext.getCurrent().getCurrentBindingsEntry();
        OperationBinding ob = binding.getOperationBinding("findKontragentById");
        if (ob != null) {

            ob.getParamsMap().put("Id", (String) key.getKeyValues()[0]);
            ob.execute();
        }
    }

    public void onAddEntry(ActionEvent actionEvent) {
        DCBindingContainer bd = (DCBindingContainer) BindingContext.getCurrent().getCurrentBindingsEntry();
        DCIteratorBinding it = bd.findIteratorBinding("OrdersView1Iterator");
        Row currRow = it.getCurrentRow();
        String Id = (String) currRow.getAttribute("Id");

        BindingContainer binding = BindingContext.getCurrent().getCurrentBindingsEntry();
        OperationBinding ob = binding.getOperationBinding("addEntry");
        if (ob != null) {

            ob.getParamsMap().put("_id", Id);
            ob.execute();
            refresh();
        }
    }

    public void onRemoveEntry(ActionEvent actionEvent) {
        DCBindingContainer bd = (DCBindingContainer) BindingContext.getCurrent().getCurrentBindingsEntry();
        DCIteratorBinding it = bd.findIteratorBinding("OrdersView1Iterator");
        Row currRow = it.getCurrentRow();
        String Id = (String) currRow.getAttribute("Id");

        BindingContainer binding = BindingContext.getCurrent().getCurrentBindingsEntry();
        OperationBinding ob = binding.getOperationBinding("removeEntry");
        if (ob != null) {

            ob.getParamsMap().put("_id", Id);
            ob.execute();
            refresh();
        }
    }

    public void onPollListener(PollEvent pollEvent) {
        DCBindingContainer binding = (DCBindingContainer) BindingContext.getCurrent().getCurrentBindingsEntry();
        DCIteratorBinding it = binding.findIteratorBinding("OrdersView1Iterator");
        it.executeQuery();
    }

    private String getSessionUser() {
        ADFContext adfCtx = ADFContext.getCurrent();
        SecurityContext secCntx = adfCtx.getSecurityContext();
        String user = secCntx.getUserPrincipal().getName();
        return user;
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

                ob.getParamsMap().put("cutid", cutid);
                ob.getParamsMap().put("dat", runDate);
                ob.getParamsMap().put("desc", (String) getDesc().getValue());
                ob.getParamsMap().put("ContId", null);
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

    public void afterListener() {
        System.out.println("After listener called ");
        BindingContext bindingContext = BindingContext.getCurrent();
        DCDataControl dc =
            bindingContext.findDataControl("AppModuleDataControl"); // Name of application module in datacontrolBinding.cpx
        AppModuleImpl am = (AppModuleImpl) dc.getDataProvider();
        am.getKontragentsView1().executeQuery();
        am.getOrdersView1().executeQuery();
    }

    public void refreshZamer() {
        BindingContext bindingContext = BindingContext.getCurrent();
        DCDataControl dc =
            bindingContext.findDataControl("AppModuleDataControl"); // Name of application module in datacontrolBinding.cpx
        AppModuleImpl am = (AppModuleImpl) dc.getDataProvider();
        am.getKontragentsView1().executeQuery();
        am.getOrderZamerView1().executeQuery();
    }


    public void setDat(RichInputDate dat) {
        this.dat = dat;
    }

    public RichInputDate getDat() {
        return dat;
    }

    public void setDesc(RichInputText desc) {
        this.desc = desc;
    }

    public RichInputText getDesc() {
        return desc;
    }

    public void onReturnValue(ReturnEvent returnEvent) {
        refresh();
    }

    public void handleExceptionShowMessageInPopupDialog() {
        ControllerContext cc = ControllerContext.getInstance();
        Exception ex = cc.getCurrentViewPort().getExceptionData();
        String message = ex.getMessage();

        FacesContext fc = FacesContext.getCurrentInstance();
        FacesMessage facesMessage = new FacesMessage(FacesMessage.SEVERITY_ERROR, "UTF: " + message, null);
        fc.addMessage(null, facesMessage);

        cc.getCurrentRootViewPort().clearException();
        fc.renderResponse();
    }

    public void setDel_title(String del_title) {
        this.del_title = del_title;
    }

    public String getDel_title() {
        DCBindingContainer bd = (DCBindingContainer) BindingContext.getCurrent().getCurrentBindingsEntry();
        DCIteratorBinding it = bd.findIteratorBinding("OrdersView1Iterator");
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
        DCIteratorBinding it = bd.findIteratorBinding("OrdersView1Iterator");
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
        DCIteratorBinding it = bd.findIteratorBinding("OrdersView1Iterator");
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
            DCIteratorBinding it = bd.findIteratorBinding("OrdersView1Iterator");
            Row currRow = it.getCurrentRow();
            Integer Del = (Integer) currRow.getAttribute("Deleted");
            if (Del == 0) {
                BindingContainer binding = BindingContext.getCurrent().getCurrentBindingsEntry();
                OperationBinding ob = binding.getOperationBinding("Delete");
                ob.execute();
            } else {
                currRow.setAttribute("Deleted", 0);
            }
            commitChange();
        }
    }
}
