package ua.divas.bean;

import java.math.BigDecimal;

import java.util.ArrayList;
import java.util.List;

import java.util.UUID;

import javax.el.ELContext;
import javax.el.ExpressionFactory;
import javax.el.ValueExpression;

import javax.faces.application.Application;
import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.faces.event.ActionEvent;
import javax.faces.event.ValueChangeEvent;
import javax.faces.model.SelectItem;

import oracle.adf.model.BindingContext;
import oracle.adf.model.binding.DCBindingContainer;
import oracle.adf.model.binding.DCDataControl;
import oracle.adf.model.binding.DCIteratorBinding;

import oracle.adf.view.rich.component.rich.RichPopup;
import oracle.adf.view.rich.component.rich.data.RichTable;
import oracle.adf.view.rich.component.rich.input.RichInputListOfValues;
import oracle.adf.view.rich.component.rich.input.RichInputText;
import oracle.adf.view.rich.component.rich.input.RichSelectOneChoice;
import oracle.adf.view.rich.context.AdfFacesContext;
import oracle.adf.view.rich.event.DialogEvent;

import oracle.adf.view.rich.event.PopupCanceledEvent;
import oracle.adf.view.rich.event.PopupFetchEvent;

import oracle.adf.view.rich.event.QueryEvent;
import oracle.adf.view.rich.model.AttributeCriterion;
import oracle.adf.view.rich.model.ConjunctionCriterion;
import oracle.adf.view.rich.model.Criterion;
import oracle.adf.view.rich.model.FilterableQueryDescriptor;

import oracle.adfinternal.view.faces.taglib.listener.ResetActionListener;

import oracle.binding.BindingContainer;

import oracle.binding.OperationBinding;

import oracle.jbo.Key;
import oracle.jbo.NameValuePairs;
import oracle.jbo.Row;

import oracle.jbo.RowIterator;

import org.apache.myfaces.trinidad.render.ExtendedRenderKitService;

import org.apache.myfaces.trinidad.util.Service;

import ua.divas.ejb.entity.DataQuery;
import ua.divas.module.AppModuleImpl;

public class ShuttleGroup {
    List selectedValues = new ArrayList();
    List allValues = new ArrayList();
    private RichTable userTable;
    private RichSelectOneChoice division;
    private RichSelectOneChoice currency;
    private RichInputText konName;
    private RichInputListOfValues zamerId;
    private RichInputListOfValues zamerName;
    private RichInputText login;
    private RichInputText passwd;
    private RichInputText desc;
    private RichInputText newPasswd;
    private RichInputText kontragName;
    private RichPopup newKontragPopup;
    private RichPopup newZamerPopup;

    public ShuttleGroup() {
    }
    
    public void setUserTable(RichTable userTable) {
        this.userTable = userTable;
    }

    public RichTable getUserTable() {
        return userTable;
    }
    
    public void resetTableFilter(ActionEvent actionEvent) {
        FilterableQueryDescriptor queryDescriptor = (FilterableQueryDescriptor) getUserTable().getFilterModel();
        if (queryDescriptor != null && queryDescriptor.getFilterConjunctionCriterion() != null) {
            ConjunctionCriterion cc = queryDescriptor.getFilterConjunctionCriterion();
            List<Criterion> lc = cc.getCriterionList();
            for (Criterion c : lc) {
                if (c instanceof AttributeCriterion) {
                    AttributeCriterion ac = (AttributeCriterion) c;
                    ac.setValue(null);
                }
            }
            getUserTable().queueEvent(new QueryEvent(getUserTable(), queryDescriptor));
        }
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

    public void setZamerId(RichInputListOfValues zamerId) {
        this.zamerId = zamerId;
    }

    public RichInputListOfValues getZamerId() {
        return zamerId;
    }

    public void setKonName(RichInputText konName) {
        this.konName = konName;
    }

    public RichInputText getKonName() {
        return konName;
    }

    public void setZamerName(RichInputListOfValues zamerName) {
        this.zamerName = zamerName;
    }

    public RichInputListOfValues getZamerName() {
        return zamerName;
    }

    private List union(List set1, List set2) {
        set1.addAll(set2);
        return set1;

    }

    private List intersect(List set1, List set2) {
        set1.retainAll(set2);
        return set1;

    }

    private List diff(List set1, List set2) {
        List diff = new ArrayList(set1);
        diff.removeAll(set2);
        return diff;

    }

    public void setSelectedValues(List selectedValues) {
        this.selectedValues = selectedValues;
    }

    public List getSelectedValues() {
        DCBindingContainer bindings = (DCBindingContainer) BindingContext.getCurrent().getCurrentBindingsEntry();
        DCIteratorBinding dcIteratorBindings = bindings.findIteratorBinding("GroupmembersView5Iterator");

        // Get all the rows of a iterator
        Row[] rows = dcIteratorBindings.getAllRowsInRange();
        for (Row rw : rows) {
            String indx = (String) rw.getAttribute("GName");
            selectedValues.add(indx);
        }
        return selectedValues;
    }

    public void setAllValues(List allValues) {
        this.allValues = allValues;
    }

    public List getAllValues() {
        DCBindingContainer bindings = (DCBindingContainer) BindingContext.getCurrent().getCurrentBindingsEntry();
        DCIteratorBinding dcIteratorBindings = bindings.findIteratorBinding("GroupsView1Iterator");

        // Get all the rows of a iterator
        Row[] rows = dcIteratorBindings.getAllRowsInRange();
        for (Row rw : rows) {
            String indx = (String) rw.getAttribute("Fullname");
            allValues.add(new SelectItem(indx));
        }
        return allValues;
    }

    public void onGroupChange(ValueChangeEvent valueChangeEvent) {
        List stored = new ArrayList();
        List toAdd = new ArrayList();
        List toRemove = new ArrayList();
        ArrayList<String> groupsInUser = (ArrayList<String>) valueChangeEvent.getNewValue();
        if (groupsInUser == null) {
            groupsInUser = new ArrayList();
        }
        DCBindingContainer bindings = (DCBindingContainer) BindingContext.getCurrent().getCurrentBindingsEntry();
        DCIteratorBinding dcIteratorBindings = bindings.findIteratorBinding("GroupmembersView5Iterator");
        Row[] rows = dcIteratorBindings.getAllRowsInRange();
        for (Row rw : rows) {
            String indx = (String) rw.getAttribute("GName");
            stored.add(indx);
        }
        toAdd = diff(groupsInUser, stored);
        toRemove = diff(stored, groupsInUser);

        String[] aToAdd = (String[]) toAdd.toArray(new String[toAdd.size()]);
        String[] atoRemove = (String[]) toRemove.toArray(new String[toRemove.size()]);


        DCIteratorBinding allUserIterator = (DCIteratorBinding) bindings.get("UsersView1Iterator");
        //get current row
        Row currentRow = allUserIterator.getCurrentRow();
        String userLogin = (String) currentRow.getAttribute("Login");

        //System.out.println(userLogin);
        if (aToAdd.length > 0) {
            for (String index : aToAdd) {
                /* Row r = dcIteratorBindings.getViewObject().createAndInitRow(new NameValuePairs(new String[] { "GMember" }, new Object[] {
                                                                                 new String(userLogin) }));
                r.setAttribute("Id", UUID.randomUUID().toString());
                r.setAttribute("GName", index); */
                BindingContainer binding = BindingContext.getCurrent().getCurrentBindingsEntry();
                OperationBinding oper = (OperationBinding) binding.getOperationBinding("addUserToGroup");
                oper.getParamsMap().put("userName", userLogin);
                oper.getParamsMap().put("groupName", index);
                oper.execute();
                System.out.println(index);
            }
        }

        if (atoRemove.length > 0) {
            for (String index : atoRemove) {
                Row rw = dcIteratorBindings.findRowsByAttributeValue("GName", true, index).first();
                rw.remove();
                System.out.println(index);
            }
        }

    }
    
    public void refresh() {
        DCBindingContainer binding = (DCBindingContainer) BindingContext.getCurrent().getCurrentBindingsEntry();
        DCIteratorBinding it = binding.findIteratorBinding("UsersView1Iterator");
        String rks;
        DCIteratorBinding it_detail = binding.findIteratorBinding("KassaSettingsView2Iterator");
        if (it != null) {
            try {
                rks = it.getCurrentRow().getKey().toStringFormat(true);
            } catch (Exception e) {
                rks = null;
            }
            it.executeQuery();
            if (rks != null) {
                it.setCurrentRowWithKey(rks);
                Row masterRow = it.getCurrentRow();
                String masterId = (String) masterRow.getAttribute("Id");
                it_detail.executeQuery();
                RowIterator rIter = it_detail.findRowsByAttributeValue("UserId", true, masterId);
                if (rIter != null && rIter.first() != null) {
                    try {
                        String contId = rIter.first().getAttribute("Id").toString();
                        Key k = new Key(new Object[] { contId });
                        it_detail.setCurrentRowWithKey(k.toStringFormat(true));
                    } catch (Exception e) {
                        // TODO: Add catch code
                        e.printStackTrace();
                    }
                }
            }
        }
        AdfFacesContext.getCurrentInstance().addPartialTarget(getUserTable());
    }

    public void refresh1() {
        DCBindingContainer binding = (DCBindingContainer) BindingContext.getCurrent().getCurrentBindingsEntry();
        DCIteratorBinding it = binding.findIteratorBinding("UsersView1Iterator");
        if (it != null) {
            String rks = it.getCurrentRow().getKey().toStringFormat(true);
            //BindingContainer bindings = BindingContext.getCurrent().getCurrentBindingsEntry(); 
            //bindings.refresh();
            it.executeQuery();
            //it.refresh(DCIteratorBinding.RANGESIZE_UNLIMITED);
            if (rks != null) {
                it.setCurrentRowWithKey(rks);
            }
        }
        AdfFacesContext.getCurrentInstance().addPartialTarget(getUserTable());
    }

    public String commitChange() {
        BindingContainer binding = BindingContext.getCurrent().getCurrentBindingsEntry();
        OperationBinding ob = binding.getOperationBinding("Commit");
        ob.execute();
        refresh();
        return null;
    }

    public String rollbackChange() {
        BindingContainer binding = BindingContext.getCurrent().getCurrentBindingsEntry();
        OperationBinding ob = binding.getOperationBinding("Rollback");
        ob.execute();
        refresh();
        return null;
    }


    public void dialogListener(DialogEvent dialogEvent) {
        if (dialogEvent.getOutcome().name().equals("ok")) {
            commitChange();
        } else if (dialogEvent.getOutcome().name().equals("cancel")) {
            rollbackChange();
        }
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

    public void onPopupFetch(PopupFetchEvent popupFetchEvent) {
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
    }

    public void onCancelPopup(PopupCanceledEvent popupCanceledEvent) {
        rollbackChange();
    }

    public void onActivitiesDialogListener(DialogEvent dialogEvent) {
        if (dialogEvent.getOutcome().name().equals("ok")) {
            BindingContainer binding = BindingContext.getCurrent().getCurrentBindingsEntry();
            OperationBinding ob = binding.getOperationBinding("Commit");
            ob.execute();
            DCBindingContainer bd = (DCBindingContainer) BindingContext.getCurrent().getCurrentBindingsEntry();
            DCIteratorBinding it = bd.findIteratorBinding("TypeOfActivitiesView1Iterator");
            if (it != null) {
                it.executeQuery();
            }
        }
    }

    public void onNomenklaturaDialogListener(DialogEvent dialogEvent) {
        if (dialogEvent.getOutcome().name().equals("ok")) {
            BindingContainer binding = BindingContext.getCurrent().getCurrentBindingsEntry();
            OperationBinding ob = binding.getOperationBinding("Commit");
            ob.execute();
            DCBindingContainer bd = (DCBindingContainer) BindingContext.getCurrent().getCurrentBindingsEntry();
            DCIteratorBinding it = bd.findIteratorBinding("NomenklaturaView1Iterator");
            if (it != null) {
                it.executeQuery();
            }
        }
    }

    public void onCreateActivities(ActionEvent actionEvent) {
        BindingContainer binding = BindingContext.getCurrent().getCurrentBindingsEntry();
        OperationBinding ob = binding.getOperationBinding("CreateInsert2");
        ob.execute();
    }

    public void onPopupActivities(PopupFetchEvent popupFetchEvent) {
        BindingContainer binding = BindingContext.getCurrent().getCurrentBindingsEntry();
        OperationBinding ob = binding.getOperationBinding("CreateInsert2");
        ob.execute();

    }

    public void onPopupNomenklatura(PopupFetchEvent popupFetchEvent) {
        BindingContainer binding = BindingContext.getCurrent().getCurrentBindingsEntry();
        OperationBinding ob = binding.getOperationBinding("CreateInsert3");
        ob.execute();
    }

    public void onCancelActivities(PopupCanceledEvent popupCanceledEvent) {
        BindingContainer binding = BindingContext.getCurrent().getCurrentBindingsEntry();
        OperationBinding ob = binding.getOperationBinding("Rollback");
        ob.execute();
    }

    public void onSetPwdDlgListener(DialogEvent dialogEvent) {
        if (dialogEvent.getOutcome().name().equals("ok")) {
            BindingContainer binding = BindingContext.getCurrent().getCurrentBindingsEntry();
            OperationBinding oper = (OperationBinding) binding.getOperationBinding("resetUserPwdToWls");
            oper.execute();
        } else if (dialogEvent.getOutcome().name().equals("cancel")) {

        }
    }

    public void onNewUserDialogListener(DialogEvent dialogEvent) {
        if (dialogEvent.getOutcome().name().equals("ok")) {
            BindingContainer binding = BindingContext.getCurrent().getCurrentBindingsEntry();
            OperationBinding oper = (OperationBinding) binding.getOperationBinding("addUserToWls");
            oper.execute();
            this.refresh();
        } else if (dialogEvent.getOutcome().name().equals("cancel")) {

        }
    }

    private void setIsMeasurer() {
        DCBindingContainer bd = (DCBindingContainer) BindingContext.getCurrent().getCurrentBindingsEntry();
        DCIteratorBinding it = bd.findIteratorBinding("KontragentsView1Iterator");
        Row currRow = it.getCurrentRow();

        currRow.setAttribute("IsMeasurer", new Integer(1));
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

    private void setOtherParentId() {

        DCBindingContainer bd = (DCBindingContainer) BindingContext.getCurrent().getCurrentBindingsEntry();
        DCIteratorBinding it = bd.findIteratorBinding("KontragentsView1Iterator");
        Row currRow = it.getCurrentRow();
        BindingContainer binding = BindingContext.getCurrent().getCurrentBindingsEntry();
        OperationBinding oper = (OperationBinding) binding.getOperationBinding("retrieveOtherParentId");
        String res = (String) oper.execute();
        currRow.setAttribute("ParentId", res);

    }

    protected void refreshKontrag() {
        BindingContext bindingContext = BindingContext.getCurrent();
        DCDataControl dc =
            bindingContext.findDataControl("AppModuleDataControl"); // Name of application module in datacontrolBinding.cpx
        AppModuleImpl am = (AppModuleImpl) dc.getDataProvider();
        am.getKontragentsView1().executeQuery();
    }

    private void setFullName() {
        DCBindingContainer bd = (DCBindingContainer) BindingContext.getCurrent().getCurrentBindingsEntry();
        DCIteratorBinding it = bd.findIteratorBinding("KontragentsView1Iterator");
        Row currRow = it.getCurrentRow();

        currRow.setAttribute("Fullname", getKonName().getValue().toString());
    }

    private void setKontragFullName() {
        DCBindingContainer bd = (DCBindingContainer) BindingContext.getCurrent().getCurrentBindingsEntry();
        DCIteratorBinding it = bd.findIteratorBinding("KontragentsView1Iterator");
        Row currRow = it.getCurrentRow();

        currRow.setAttribute("Fullname", getKontragName().getValue().toString());
    }

    public void onPopupCreateZamer(PopupFetchEvent popupFetchEvent) {
        resetBindingValue("#{bindings.KonName1.inputValue}",null);
         try {
            getKonName().resetValue();
        } catch (Exception e) {
            // TODO: Add catch code
            e.printStackTrace();
        } 
    }

    public void onPopupCreateKontrag(PopupFetchEvent popupFetchEvent) {
        resetBindingValue("#{bindings.KontragName1.inputValue}",null);
         try {
            getKontragName().resetValue();
        } catch (Exception e) {
            // TODO: Add catch code
            e.printStackTrace();
        } 
    }

    public void onNewKontragDialogListener(DialogEvent dialogEvent) {
        if (dialogEvent.getOutcome().name().equals("ok")) {
            BindingContainer binding = BindingContext.getCurrent().getCurrentBindingsEntry();
            OperationBinding ob = binding.getOperationBinding("createKontrag");
            if (ob != null) {
                ob.getParamsMap().put("p_name", getKontragName().getValue().toString());
                ob.getParamsMap().put("isSupp", 0);
                ob.getParamsMap().put("isMeasr", 0);
                ob.getParamsMap().put("isByer", 0);
                ob.execute();
            }
            //setKontragFullName();
            //setOtherParentId();
            //BindingContainer binding = BindingContext.getCurrent().getCurrentBindingsEntry();
            //ob = binding.getOperationBinding("Commit");
            //ob.execute();
            refreshKontrag();
        }
    }

    public void onNewZamerDialogListener(DialogEvent dialogEvent) {
        if (dialogEvent.getOutcome().name().equals("ok")) {
            BindingContainer binding = BindingContext.getCurrent().getCurrentBindingsEntry();
            OperationBinding ob = binding.getOperationBinding("createKontrag");
            if (ob != null) {
                ob.getParamsMap().put("p_name", getKonName().getValue().toString());
                ob.getParamsMap().put("isSupp", 0);
                ob.getParamsMap().put("isMeasr", 1);
                ob.getParamsMap().put("isByer", 0);
                ob.execute();
            }
            //setKontragFullName();
            //setOtherParentId();
            //BindingContainer binding = BindingContext.getCurrent().getCurrentBindingsEntry();
            //ob = binding.getOperationBinding("Commit");
            //ob.execute();
            refreshKontrag();
        }
    }

    public boolean getZamerInUse() {
        String zid;
        try {
            zid = getZamerId().getValue().toString();
        } catch (Exception e) {
            zid = "";
            //e.printStackTrace();
        }
        if (zid == null || zid == "") {
            return false;
        }
        return DataQuery.zamerInUse(zid);
    }

    public void onZamerChange(ValueChangeEvent vce) {
        vce.getComponent().processUpdates(FacesContext.getCurrentInstance());
        if (vce.getNewValue() != vce.getOldValue()) {
            if (DataQuery.zamernameInUse((String) vce.getNewValue())) {
                getZamerId().setValue("");
                getZamerName().setValue("");
                FacesContext ctx = FacesContext.getCurrentInstance();
                FacesMessage msg =
                    new FacesMessage(FacesMessage.SEVERITY_ERROR, "Ошибка",
                                     "Контрагент уже используется. Выбор невозможен!");
                ctx.addMessage(null, msg);
            }
        }
    }

    public void onRefresh(ActionEvent actionEvent) {
        refresh();
    }

    public void setLogin(RichInputText login) {
        this.login = login;
    }

    public RichInputText getLogin() {
        return login;
    }

    public void setPasswd(RichInputText passwd) {
        this.passwd = passwd;
    }

    public RichInputText getPasswd() {
        return passwd;
    }

    public void setDesc(RichInputText desc) {
        this.desc = desc;
    }

    public RichInputText getDesc() {
        return desc;
    }

    public void onNewUserPopup(PopupFetchEvent popupFetchEvent) {
        resetBindingValue("#{bindings.username1.inputValue}",null);
        resetBindingValue("#{bindings.psw.inputValue}",null);
        resetBindingValue("#{bindings.desc.inputValue}",null);
        try {
            getLogin().resetValue();
            getPasswd().resetValue();
            getDesc().resetValue();
        } catch (Exception e) {
            // TODO: Add catch code
            e.printStackTrace();
        }
    }

    public void setNewPasswd(RichInputText newPasswd) {
        this.newPasswd = newPasswd;
    }

    public RichInputText getNewPasswd() {
        return newPasswd;
    }

    public void onResetPasswdPopup(PopupFetchEvent popupFetchEvent) {
        resetBindingValue("#{bindings.newPassword.inputValue}",null);
        try {
            getNewPasswd().resetValue();
        } catch (Exception e) {
            // TODO: Add catch code
            e.printStackTrace();
        }
    }

    public void setKontragName(RichInputText kontragName) {
        this.kontragName = kontragName;
    }

    public RichInputText getKontragName() {
        return kontragName;
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

    public void onPaySettChange(ValueChangeEvent valueChangeEvent) {
        valueChangeEvent.getComponent().processUpdates(FacesContext.getCurrentInstance());
        //System.out.println(vce.getNewValue());
        String pId = getValueFrmExpression("#{row.bindings.PayId.attributeValue}");
        System.out.println(pId);
        DCBindingContainer bd = (DCBindingContainer) BindingContext.getCurrent().getCurrentBindingsEntry();
        DCIteratorBinding it = bd.findIteratorBinding("NachislSettingsView2Iterator");
        Row currRow = it.getCurrentRow();
        currRow.setAttribute("Summa", null);

        BindingContainer binding = BindingContext.getCurrent().getCurrentBindingsEntry();
        OperationBinding ob = binding.getOperationBinding("retrieveSumm");

        if (ob != null) {
            ob.getParamsMap().put("pId", pId);
            BigDecimal summa = (BigDecimal) ob.execute();
            System.out.println(summa);
            currRow.setAttribute("Summa", summa);
        }
    }

    public void setNewKontragPopup(RichPopup newKontragPopup) {
        this.newKontragPopup = newKontragPopup;
    }

    public RichPopup getNewKontragPopup() {
        return newKontragPopup;
    }

    public void hidePopup(RichPopup popup) {
        FacesContext facesContext = FacesContext.getCurrentInstance();
        ExtendedRenderKitService service = Service.getRenderKitService(facesContext, ExtendedRenderKitService.class);
        service.addScript(facesContext,
                          "AdfPage.PAGE.findComponent('" + popup.getClientId(facesContext) + "').hide();");
    }

    public void onSaveKontrag(ActionEvent actionEvent) {
        if (actionEvent.getComponent().getId().equals("bNewKontrag")) {
            try {
                getKontragName().getValue().toString();
                BindingContainer binding = BindingContext.getCurrent().getCurrentBindingsEntry();
                OperationBinding ob = binding.getOperationBinding("createKontrag");
                if (ob != null) {
                    ob.getParamsMap().put("p_name", getKontragName().getValue().toString());
                    ob.getParamsMap().put("isSupp", 0);
                    ob.getParamsMap().put("isMeasr", 0);
                    ob.getParamsMap().put("isByer", 0);
                    ob.execute();
                }
                //setKontragFullName();
                //setOtherParentId();
                //BindingContainer binding = BindingContext.getCurrent().getCurrentBindingsEntry();
                //ob = binding.getOperationBinding("Commit");
                //ob.execute();
                refreshKontrag();
                //resetBindingValue("#{bindings.KontragName1.inputValue}",null);
                hidePopup(getNewKontragPopup());
            } catch (Exception e) {
                FacesMessage msg =
                    new FacesMessage(FacesMessage.SEVERITY_ERROR, "Ошибка валидации",
                                     "Контрагент не может быть пустым");
                FacesContext ctx = FacesContext.getCurrentInstance();
                ctx.addMessage(null, msg);
                //e.printStackTrace();
            }
            /* DCBindingContainer bd = (DCBindingContainer) BindingContext.getCurrent().getCurrentBindingsEntry();
            DCIteratorBinding it = bd.findIteratorBinding("KontragentsView1Iterator");
            if (it != null) {
                it.executeQuery();
            } */
        }
    }

    public void onCancelKontrag(ActionEvent actionEvent) {
        hidePopup(getNewKontragPopup());
    }

    public void onSaveZamer(ActionEvent actionEvent) {
        if (actionEvent.getComponent().getId().equals("bNewZamer")) {
            try {
                getKonName().getValue().toString();
                BindingContainer binding = BindingContext.getCurrent().getCurrentBindingsEntry();
                OperationBinding ob = binding.getOperationBinding("createKontrag");
                if (ob != null) {
                    ob.getParamsMap().put("p_name", getKonName().getValue().toString());
                    ob.getParamsMap().put("isSupp", 0);
                    ob.getParamsMap().put("isMeasr", 1);
                    ob.getParamsMap().put("isByer", 0);
                    ob.execute();
                }
                //setKontragFullName();
                //setOtherParentId();
                //BindingContainer binding = BindingContext.getCurrent().getCurrentBindingsEntry();
                //ob = binding.getOperationBinding("Commit");
                //ob.execute();
                refreshKontrag();
                hidePopup(getNewZamerPopup());
            } catch (Exception e) {
                FacesMessage msg =
                    new FacesMessage(FacesMessage.SEVERITY_ERROR, "Ошибка валидации", "Замерщик не может быть пустым");
                FacesContext ctx = FacesContext.getCurrentInstance();
                ctx.addMessage(null, msg);
                //e.printStackTrace();
            }
            /* DCBindingContainer bd = (DCBindingContainer) BindingContext.getCurrent().getCurrentBindingsEntry();
            DCIteratorBinding it = bd.findIteratorBinding("KontragentsView1Iterator");
            if (it != null) {
                it.executeQuery();
            } */
        }
    }

    public void setNewZamerPopup(RichPopup newZamerPopup) {
        this.newZamerPopup = newZamerPopup;
    }

    public RichPopup getNewZamerPopup() {
        return newZamerPopup;
    }

    public void onCancelZamer(ActionEvent actionEvent) {
        hidePopup(getNewZamerPopup());
    }
}
