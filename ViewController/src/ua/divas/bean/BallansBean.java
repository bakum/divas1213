package ua.divas.bean;

import java.math.BigDecimal;

import java.util.Date;
import java.util.Iterator;
import java.util.List;

import java.util.UUID;

import javax.el.ELContext;
import javax.el.ExpressionFactory;
import javax.el.MethodExpression;
import javax.el.ValueExpression;

import javax.faces.application.Application;
import javax.faces.application.FacesMessage;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.event.ActionEvent;

import javax.faces.validator.ValidatorException;

import oracle.adf.model.BindingContext;

import oracle.adf.model.binding.DCBindingContainer;
import oracle.adf.model.binding.DCIteratorBinding;
import oracle.adf.share.ADFContext;
import oracle.adf.share.security.SecurityContext;
import oracle.adf.view.rich.component.rich.RichPoll;
import oracle.adf.view.rich.component.rich.data.RichTreeTable;

import oracle.adf.view.rich.component.rich.input.RichInputNumberSpinbox;
import oracle.adf.view.rich.component.rich.nav.RichButton;
import oracle.adf.view.rich.context.AdfFacesContext;

import oracle.adf.view.rich.event.DialogEvent;
import oracle.adf.view.rich.event.PopupFetchEvent;

import oracle.adf.view.rich.render.ClientEvent;

import oracle.binding.BindingContainer;
import oracle.binding.OperationBinding;

import oracle.jbo.Key;
import oracle.jbo.Row;
import oracle.jbo.RowNotFoundException;
import oracle.jbo.RowSetIterator;
import oracle.jbo.uicli.binding.JUCtrlHierBinding;
import oracle.jbo.uicli.binding.JUCtrlHierNodeBinding;
import oracle.jbo.uicli.binding.JUIteratorBinding;

import org.apache.myfaces.trinidad.event.PollEvent;
import org.apache.myfaces.trinidad.event.SelectionEvent;
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

public class BallansBean {
    private RichTreeTable treeTable;
    private RichInputNumberSpinbox summ;
    private RichButton calcBtn;
    private RichPoll pollBinding;

    public BallansBean() {
    }

    public void setPollBinding(RichPoll pollBinding) {
        this.pollBinding = pollBinding;
    }

    public RichPoll getPollBinding() {
        return pollBinding;
    }

    public BindingContainer getBindings() {
        return BindingContext.getCurrent().getCurrentBindingsEntry();
    }

    public void setCalcBtn(RichButton calcBtn) {
        this.calcBtn = calcBtn;
    }

    public RichButton getCalcBtn() {
        return calcBtn;
    }

    public void refreshIterator() {
        DCBindingContainer binding = (DCBindingContainer) BindingContext.getCurrent().getCurrentBindingsEntry();
        DCIteratorBinding it = binding.findIteratorBinding("VwBallansAp1Iterator");
        String rks;
        if (it != null) {
            /* try {
                rks = it.getCurrentRow().getKey().toStringFormat(true);
            } catch (Exception e) {
                rks = null;
            } */
            it.executeQuery();
            /* if (rks != null) {
                try {
                    it.setCurrentRowWithKey(rks);
                } catch (Exception e) {
                    e.getMessage();
                }
            } */
        }

        it = binding.findIteratorBinding("VwBallansApDetail2Iterator");
        it.executeQuery();
        //AdfFacesContext.getCurrentInstance().addPartialTarget(getOtherTable());
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

    private String getSessionUser() {
        ADFContext adfCtx = ADFContext.getCurrent();
        SecurityContext secCntx = adfCtx.getSecurityContext();
        String user = secCntx.getUserPrincipal().getName();
        return user;
    }

    public void onExecute(ActionEvent actionEvent) throws SchedulerException {
        BindingContext bctx = BindingContext.getCurrent();
        BindingContainer bindings = bctx.getCurrentBindingsEntry();
        OperationBinding executeWithParams = bindings.getOperationBinding("refreshBallans");
        if (executeWithParams != null) {
            String cutid = UUID.randomUUID().toString().substring(0, 7);
            JobDetail job =
                JobBuilder.newJob(BallansJob.class).withDescription("trigger" + cutid).withIdentity("job" + cutid,
                                                                                                    "group").build();
            Date runDate = new Date();
            Trigger trigger =
                TriggerBuilder.newTrigger().startAt(runDate).withDescription(getSessionUser()).withIdentity("trigger" +
                                                                                                            cutid,
                                                                                                            "group").build();
            job.getJobDataMap().put("UserName", getSessionUser());
            job.getJobDataMap().put("f_date",
                                    (oracle.jbo.domain.Date) JSFUtils.resolveExpression("#{bindings.f_dat.inputValue}"));
            job.getJobDataMap().put("l_date",
                                    (oracle.jbo.domain.Date) JSFUtils.resolveExpression("#{bindings.l_dat.inputValue}"));
            if (StartSchedulerQuartz.sched != null) {
                StartSchedulerQuartz.sched.scheduleJob(job, trigger);
                System.out.println("------- New notification! ----------------");
                //ob.execute();
                FacesContext context = FacesContext.getCurrentInstance();
                ExtendedRenderKitService erks =
                    Service.getService(context.getRenderKit(), ExtendedRenderKitService.class);
                erks.addScript(context, "Growl('Внимание'," + "'Баланс запущен в расчет!','warning')");
                pollBinding.setInterval(1000);
                AdfFacesContext.getCurrentInstance().addPartialTarget(pollBinding);
            }
        }
        //executeWithParams.execute();
        //refreshIterator();

        //AdfFacesContext.getCurrentInstance().addPartialTarget(getTreeTable());
    }

    public void refresh() {
        AdfFacesContext.getCurrentInstance().addPartialTarget(getTreeTable());
    }

    public void setTreeTable(RichTreeTable treeTable) {
        this.treeTable = treeTable;
    }

    public RichTreeTable getTreeTable() {
        return treeTable;
    }

    private String getCurrentDivision() {
        DCIteratorBinding di = (DCIteratorBinding) getBindings().get("DivisionsView1Iterator");
        Row cr = di.getCurrentRow();
        return cr.getAttribute("Id").toString();
    }


    public void onProfitPopup(PopupFetchEvent popupFetchEvent) {
        /* popupFetchEvent.getComponent().processUpdates(FacesContext.getCurrentInstance());
        //System.out.println(vce.getNewValue());
        String NomId = getValueFrmExpression("#{row.bindings.NomId.attributeValue}"); */

        BindingContainer binding = BindingContext.getCurrent().getCurrentBindingsEntry();
        OperationBinding ob = binding.getOperationBinding("getProfitByDivision");
        if (ob != null) {
            //ob.getParamsMap().put("p_div", getCurrentDivision());
            BigDecimal profit = (BigDecimal) ob.execute();
            resetBindingValue("#{bindings.Summa.inputValue}", profit);
            /* try {
                getSumm().resetValue();
            } catch (Exception e) {
                // TODO: Add catch code
                e.printStackTrace();
            } */
        }
    }

    public void setSumm(RichInputNumberSpinbox summ) {
        this.summ = summ;
    }

    public RichInputNumberSpinbox getSumm() {
        return summ;
    }

    public void onDialogProfit(DialogEvent dialogEvent) {
        if (dialogEvent.getOutcome().name().equals("ok")) {
            BindingContainer binding = BindingContext.getCurrent().getCurrentBindingsEntry();
            OperationBinding oper = (OperationBinding) binding.getOperationBinding("addProfitDistrib");
            //oper.getParamsMap().put("p_div", getCurrentDivision());
            oper.execute();

            /* try {
                this.onExecute(null);
            } catch (SchedulerException e) {
            } */
        }
    }

    private boolean isDigit(String st) {
        char[] utu = st.toCharArray();
        boolean isDigit = true;
        for (int i = 0; i < st.length(); i++) {
            if (!Character.isDigit(utu[i])) {
                isDigit = false;
                break;
            }
        }
        return isDigit;
    }

    public void onValidateSumm(FacesContext facesContext, UIComponent uIComponent, Object object) {
        boolean fatal = false;

        if ((object == null) || (object.toString().isEmpty())) {
            fatal = true;
            /* } else if (!isDigit(object.toString())) {
            fatal = true; */
        //} else if (Float.parseFloat(object.toString()) <= 0) {
        //    fatal = true;
        }

        if (fatal) {
            /*  facesContext.addMessage(clientId,
                                    new FacesMessage(FacesMessage.SEVERITY_FATAL, "Ошибка",
                                                     "Заработная плата должна быть > 0")); */
            throw new ValidatorException(new FacesMessage(FacesMessage.SEVERITY_ERROR, "Ошибка валидации",
                                                          "Проверьте значение суммы"));
        }


    }

    public void onRefresh(ActionEvent actionEvent) {
        refreshIterator();
        refresh();
    }

    public void onTreeSelect(SelectionEvent selectionEvent) {
        String adfSelectionListener = "#{bindings.VwBallansAp1.treeModel.makeCurrent}";
        FacesContext fctx = FacesContext.getCurrentInstance();
        Application application = fctx.getApplication();
        ELContext elCtx = fctx.getELContext();
        ExpressionFactory exprFactory = application.getExpressionFactory();

        MethodExpression me = null;
        me = exprFactory.createMethodExpression(elCtx, adfSelectionListener, Object.class, new Class[] {
                                                SelectionEvent.class });
        me.invoke(elCtx, new Object[] { selectionEvent });

        RichTreeTable tree1 = this.getTreeTable();
        RowKeySet rks2 = tree1.getSelectedRowKeys();
        Iterator rksIterator = rks2.iterator();
        if (rksIterator.hasNext()) {
            List key = (List) rksIterator.next();
            JUCtrlHierBinding treeBinding = null;
            treeBinding = (JUCtrlHierBinding) ((CollectionModel) tree1.getValue()).getWrappedData();
            JUCtrlHierNodeBinding nodeBinding = treeBinding.findNodeByKeyPath(key);

            Row rw = nodeBinding.getRow();
            //print first row attribute. Note that in a tree you have to
            //determine the node type if you want to select node attributes
            //by name and not index
            String rowType = rw.getStructureDef().getDefName();
            System.out.println(rowType);

            DCIteratorBinding _treeIteratorBinding = null;
            _treeIteratorBinding = treeBinding.getDCIteratorBinding();
            JUIteratorBinding iterator = nodeBinding.getIteratorBinding();
            String keyStr = nodeBinding.getRowKey().toStringFormat(true);
            if (keyStr != null && rowType.matches("VwBallansApParent")) {
                DCIteratorBinding iter = (DCIteratorBinding) getBindings().get("VwBallansApParent2Iterator");
                try {
                    iter.setCurrentRowWithKey(keyStr);
                    String divId = (String) rw.getAttribute("ParentId");
                    Key k = new Key(new Object[] { divId });
                    DCIteratorBinding di = (DCIteratorBinding) getBindings().get("DivisionsView1Iterator");
                    RowSetIterator rsi = di.getRowSetIterator();
                    Row row = rsi.findByKey(k, 1)[0];
                    rsi.setCurrentRow(row);
                } catch (RowNotFoundException e) {
                    try {
                        iterator.setCurrentRowWithKey(keyStr);
                    } catch (RowNotFoundException er) {
                        System.out.println(er.getMessage());

                    }
                }
            } else if (keyStr != null && rowType.matches("VwBallansApDetail")) {
                DCIteratorBinding iter = (DCIteratorBinding) getBindings().get("VwBallansApDetail2Iterator");
                try {
                    iter.setCurrentRowWithKey(keyStr);
                    String divId = (String) rw.getAttribute("DivisionId");
                    Key k = new Key(new Object[] { divId });
                    DCIteratorBinding di = (DCIteratorBinding) getBindings().get("DivisionsView1Iterator");
                    RowSetIterator rsi = di.getRowSetIterator();
                    Row row = rsi.findByKey(k, 1)[0];
                    rsi.setCurrentRow(row);
                } catch (RowNotFoundException e) {
                    try {
                        iterator.setCurrentRowWithKey(keyStr);
                    } catch (RowNotFoundException er) {
                        System.out.println(er.getMessage());

                    }
                }
            }
        }
    }

    public void onRefreshActive(ClientEvent clientEvent) {
        onRefresh(null);
        FacesContext context = FacesContext.getCurrentInstance();
        ExtendedRenderKitService erks = Service.getService(context.getRenderKit(), ExtendedRenderKitService.class);
        erks.addScript(context, "Growl('Внимание'," + "'Баланс рассчитан!','notice')");
    }

    public void onPoll(PollEvent pollEvent) {
        DCBindingContainer binding = (DCBindingContainer) BindingContext.getCurrent().getCurrentBindingsEntry();
        DCIteratorBinding it = binding.findIteratorBinding("MonitorBallansJobVO1Iterator");
        it.executeQuery();
        Integer cnt = (Integer) ADFUtil.evaluateEL("#{bindings.Cnt.inputValue}");
        if (cnt == null) {
            pollBinding.setInterval(-1);
            AdfFacesContext.getCurrentInstance().addPartialTarget(pollBinding);
        }
    }
}
