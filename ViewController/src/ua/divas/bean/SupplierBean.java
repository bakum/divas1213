package ua.divas.bean;

import com.sun.faces.component.visit.FullVisitContext;

import java.math.BigDecimal;

import java.util.Iterator;
import java.util.List;

import javax.el.ELContext;
import javax.el.ExpressionFactory;
import javax.el.MethodExpression;

import javax.el.ValueExpression;

import javax.faces.application.Application;
import javax.faces.application.FacesMessage;
import javax.faces.component.UIComponent;
import javax.faces.component.UIViewRoot;
import javax.faces.component.visit.VisitCallback;
import javax.faces.component.visit.VisitContext;
import javax.faces.component.visit.VisitResult;
import javax.faces.context.FacesContext;

import javax.faces.event.ActionEvent;
import javax.faces.event.ValueChangeEvent;
import javax.faces.validator.ValidatorException;

import oracle.adf.model.BindingContext;
import oracle.adf.model.binding.DCBindingContainer;
import oracle.adf.model.binding.DCIteratorBinding;
import oracle.adf.view.rich.component.rich.data.RichTreeTable;

import oracle.adf.view.rich.component.rich.input.RichSelectOneChoice;
import oracle.adf.view.rich.component.rich.nav.RichButton;
import oracle.adf.view.rich.context.AdfFacesContext;
import oracle.adf.view.rich.event.DialogEvent;
import oracle.adf.view.rich.event.PopupFetchEvent;

import oracle.binding.AttributeBinding;
import oracle.binding.BindingContainer;

import oracle.binding.OperationBinding;

import oracle.jbo.Row;
import oracle.jbo.RowIterator;
import oracle.jbo.RowNotFoundException;
import oracle.jbo.uicli.binding.JUCtrlHierBinding;
import oracle.jbo.uicli.binding.JUCtrlHierNodeBinding;
import oracle.jbo.uicli.binding.JUIteratorBinding;

import org.apache.myfaces.trinidad.event.SelectionEvent;
import org.apache.myfaces.trinidad.model.CollectionModel;
import org.apache.myfaces.trinidad.model.RowKeySet;

public class SupplierBean {
    private RichTreeTable treeTable;

    public void setTreeTable(RichTreeTable treeTable) {
        this.treeTable = treeTable;
    }

    public RichTreeTable getTreeTable() {
        return treeTable;
    }

    public SupplierBean() {
    }

    public BindingContainer getBindings() {
        return BindingContext.getCurrent().getCurrentBindingsEntry();
    }

    public void onTreeSelect(SelectionEvent selectionEvent) {
        String adfSelectionListener = "#{bindings.VwKontragAllItems1.treeModel.makeCurrent}";

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
            if (keyStr != null && rowType.matches("VwSupplierMoves")) {
                DCIteratorBinding iter = (DCIteratorBinding) getBindings().get("VwSupplierMoves1Iterator");
                DCIteratorBinding itr = (DCIteratorBinding) getBindings().get("VwSupplierMoves2Iterator");
                try {
                    iter.setCurrentRowWithKey(keyStr);
                    itr.setCurrentRowWithKey(keyStr);
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

    private Boolean isKontragentDeleted(String konId) {
        DCBindingContainer bd = (DCBindingContainer) BindingContext.getCurrent().getCurrentBindingsEntry();
        DCIteratorBinding it = bd.findIteratorBinding("VwKontragAllItems1Iterator");
        Boolean result = null;
        if (it != null) {
            RowIterator rIter = it.findRowsByAttributeValue("Id", true, konId);
            if (rIter != null) {
                Integer del = (Integer) rIter.first().getAttribute("Deleted");
                if (del.intValue() == 1) {
                    return new Boolean(true);
                } else {
                    return new Boolean(false);
                }
            }
        }

        return result;
    }

    private String getAttrValueFromSelected(String attrName) {
        RichTreeTable tree1 = this.getTreeTable();
        RowKeySet rks2 = tree1.getSelectedRowKeys();
        Iterator rksIterator = rks2.iterator();
        String result = null;
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
            result = (String) rw.getAttribute(attrName);
        }
        return result;
    }

    public void refresh() {
        DCBindingContainer binding = (DCBindingContainer) BindingContext.getCurrent().getCurrentBindingsEntry();
        DCIteratorBinding it = binding.findIteratorBinding("VwKontragAllItems1Iterator");
        //String rks;
        if (it != null) {
            it.executeQuery();
        }
        AdfFacesContext.getCurrentInstance().addPartialTarget(getTreeTable());
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

    public void onPopupPko(PopupFetchEvent popupFetchEvent) {
        DCBindingContainer bd = (DCBindingContainer) BindingContext.getCurrent().getCurrentBindingsEntry();
        oracle.jbo.domain.Number lbn = null;
        if (popupFetchEvent.getLaunchSourceClientId().contains("b7")) {
            DCIteratorBinding it = bd.findIteratorBinding("VwSupplierMoves1Iterator");
            Row currRow = it.getCurrentRow();
            lbn = (oracle.jbo.domain.Number) currRow.getAttribute("BallForOrder");
        } else {
            DCIteratorBinding it = bd.findIteratorBinding("VwKontragAllItems1Iterator");
            Row currRow = it.getCurrentRow();
            lbn = (oracle.jbo.domain.Number) currRow.getAttribute("DebtSupplier");
        }
        // resetBindingValue("#{bindings.addPkoFromZamer_kassaId1.inputValue}", null);
        resetBindingValue("#{bindings.Summa.inputValue}", lbn.bigDecimalValue().abs());
    }

    public void onDialogPko(DialogEvent dialogEvent) {
        if (dialogEvent.getOutcome().name().equals("ok")) {
            DCBindingContainer bd = (DCBindingContainer) BindingContext.getCurrent().getCurrentBindingsEntry();
            DCIteratorBinding it = bd.findIteratorBinding("VwKontragAllItems1Iterator");
            Row currRow = it.getCurrentRow();

            BindingContainer binding = BindingContext.getCurrent().getCurrentBindingsEntry();
            OperationBinding oper = (OperationBinding) binding.getOperationBinding("addPkoFromZamer");
            if (oper != null) {
                oper.getParamsMap().put("kontragId", currRow.getAttribute("Id").toString());
                oper.execute();

                refresh();
            }
        }
    }

    public void onDialogTransfer(DialogEvent dialogEvent) {
        if (dialogEvent.getOutcome().name().equals("ok")) {
            DCBindingContainer bd = (DCBindingContainer) BindingContext.getCurrent().getCurrentBindingsEntry();
            DCIteratorBinding it = bd.findIteratorBinding("VwKontragAllItems1Iterator");
            Row currRow = it.getCurrentRow();

            BindingContainer binding = BindingContext.getCurrent().getCurrentBindingsEntry();
            OperationBinding oper = (OperationBinding) binding.getOperationBinding("transferOfDebt");
            if (oper != null) {
                oper.getParamsMap().put("source", currRow.getAttribute("Id").toString());
                oper.execute();

                refresh();
            }
        }
    }

    public UIComponent findComponent(final String id) {

        FacesContext context = FacesContext.getCurrentInstance();
        UIViewRoot root = context.getViewRoot();
        final UIComponent[] found = new UIComponent[1];

        root.visitTree(new FullVisitContext(context), new VisitCallback() {
            @Override
            public VisitResult visit(VisitContext context, UIComponent component) {
                if (component.getId().equals(id)) {
                    found[0] = component;
                    return VisitResult.COMPLETE;
                }
                return VisitResult.ACCEPT;
            }
        });

        return found[0];

    }

    private UIComponent getUIComponent(String name) {
        FacesContext facesCtx = FacesContext.getCurrentInstance();
        return facesCtx.getViewRoot().findComponent(name);
    }

    public void onPopuoRko(PopupFetchEvent popupFetchEvent) {
        DCBindingContainer bd = (DCBindingContainer) BindingContext.getCurrent().getCurrentBindingsEntry();
        oracle.jbo.domain.Number lbn = null;
        if (popupFetchEvent.getLaunchSourceClientId().contains("b6")) {
            DCIteratorBinding it = bd.findIteratorBinding("VwSupplierMoves1Iterator");
            Row currRow = it.getCurrentRow();
            lbn = (oracle.jbo.domain.Number) currRow.getAttribute("BallForOrder");
        } else {
            DCIteratorBinding it = bd.findIteratorBinding("VwKontragAllItems1Iterator");
            Row currRow = it.getCurrentRow();
            lbn = (oracle.jbo.domain.Number) currRow.getAttribute("DebtSupplier");
        }
        // resetBindingValue("#{bindings.addRko_kassaId1.inputValue}", null);
        resetBindingValue("#{bindings.Summa1.inputValue}", lbn.bigDecimalValue().abs());
    }

    public void onPopupTransfer(PopupFetchEvent popupFetchEvent) {
        //DCBindingContainer bd = (DCBindingContainer) BindingContext.getCurrent().getCurrentBindingsEntry();
        /* if (popupFetchEvent.getLaunchSourceClientId().contains("b6")) {
            DCIteratorBinding it = bd.findIteratorBinding("VwSupplierMoves1Iterator");
            Row currRow = it.getCurrentRow();
            lbn = (oracle.jbo.domain.Number) currRow.getAttribute("BallForOrder");
        } else { */
        //DCIteratorBinding it = bd.findIteratorBinding("VwKontragAllItems1Iterator");
        //Row currRow = it.getCurrentRow();
        //String lbn = currRow.getAttribute("Id").toString();
        //}
        // resetBindingValue("#{bindings.addRko_kassaId1.inputValue}", null);
        resetBindingValue("#{bindings.Summa2.inputValue}", null);
        //RichSelectOneChoice soc = getSource();
        resetBindingValue("#{bindings.transferOfDebt_dest1.inputValue}", null);
        //AttributeBinding attr = (AttributeBinding)getBindings().getControlBinding("transferOfDebt_source1");
        //if (soc != null && soc.getValue() == null) {
        /* try {
            soc.setValue(lbn);
        } catch (Exception e) {
            // TODO: Add catch code
            //e.printStackTrace();
        } */
        //resetBindingValue("#{bindings.transferOfDebt_source1.inputValue}", lbn);
        //}

    }

    public void onDialogRko(DialogEvent dialogEvent) {
        if (dialogEvent.getOutcome().name().equals("ok")) {
            DCBindingContainer bd = (DCBindingContainer) BindingContext.getCurrent().getCurrentBindingsEntry();
            DCIteratorBinding it = bd.findIteratorBinding("VwKontragAllItems1Iterator");
            Row currRow = it.getCurrentRow();

            BindingContainer binding = BindingContext.getCurrent().getCurrentBindingsEntry();
            OperationBinding oper = (OperationBinding) binding.getOperationBinding("addRko");
            if (oper != null) {
                oper.getParamsMap().put("kontragId", currRow.getAttribute("Id").toString());
                oper.execute();

                refresh();
            }
        }
    }

    public void onDialogRkoOrder(DialogEvent dialogEvent) {
        if (dialogEvent.getOutcome().name().equals("ok")) {
            if (this.isKontragentDeleted(getAttrValueFromSelected("KontragId")).booleanValue() == true) {
                FacesContext ctx = FacesContext.getCurrentInstance();
                FacesMessage msg =
                    new FacesMessage(FacesMessage.SEVERITY_ERROR, "Kontragent is deleted",
                                     "Контрагент помечен на удаление" + " операция невозможна!");
                ctx.addMessage(null, msg);
                return;
            }
            /* DCBindingContainer bd = (DCBindingContainer) BindingContext.getCurrent().getCurrentBindingsEntry();
            DCIteratorBinding it = bd.findIteratorBinding("VwSupplierMoves1Iterator");
            Row currRow = it.getCurrentRow(); */

            BindingContainer binding = BindingContext.getCurrent().getCurrentBindingsEntry();
            OperationBinding oper = (OperationBinding) binding.getOperationBinding("addRkoOrder");
            if (oper != null) {
                oper.getParamsMap().put("kontragId", getAttrValueFromSelected("KontragId"));
                oper.getParamsMap().put("OrderId", getAttrValueFromSelected("RegistratorId"));
                oper.execute();

                refresh();
            }
        }
    }

    public void onDialogPkoOrder(DialogEvent dialogEvent) {
        if (dialogEvent.getOutcome().name().equals("ok")) {
            if (this.isKontragentDeleted(getAttrValueFromSelected("KontragId")).booleanValue() == true) {
                FacesContext ctx = FacesContext.getCurrentInstance();
                FacesMessage msg =
                    new FacesMessage(FacesMessage.SEVERITY_ERROR, "Kontragent is deleted",
                                     "Контрагент помечен на удаление" + " операция невозможна!");
                ctx.addMessage(null, msg);
                return;
            }
            /* DCBindingContainer bd = (DCBindingContainer) BindingContext.getCurrent().getCurrentBindingsEntry();
            DCIteratorBinding it = bd.findIteratorBinding("VwSupplierMoves1Iterator");
            Row currRow = it.getCurrentRow(); */

            BindingContainer binding = BindingContext.getCurrent().getCurrentBindingsEntry();
            OperationBinding oper = (OperationBinding) binding.getOperationBinding("addPkoOrder");
            if (oper != null) {
                oper.getParamsMap().put("kontragId", getAttrValueFromSelected("KontragId"));
                oper.getParamsMap().put("OrderId", getAttrValueFromSelected("RegistratorId"));
                oper.execute();

                refresh();
            }
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
        } else if (Float.parseFloat(object.toString()) <= 0) {
            fatal = true;
        }

        if (fatal) {
            /*  facesContext.addMessage(clientId,
                                    new FacesMessage(FacesMessage.SEVERITY_FATAL, "Ошибка",
                                                     "Заработная плата должна быть > 0")); */
            throw new ValidatorException(new FacesMessage(FacesMessage.SEVERITY_ERROR, "Ошибка валидации",
                                                          "Сумма должна быть > 0"));
        }

    }

    private void setMarkToSelected() {
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
            rw.setAttribute("Mark", 1);
        }
    }

    public void onRefresh(ActionEvent actionEvent) {
        refresh();
    }

    public void onCheckMark(ValueChangeEvent valueChangeEvent) {
        //setMarkToSelected();
    }

    public void onPayOrder(ActionEvent actionEvent) {
        DCBindingContainer bd = (DCBindingContainer) BindingContext.getCurrent().getCurrentBindingsEntry();
        DCIteratorBinding it = bd.findIteratorBinding("VwSupplierMoves2Iterator");
        for (int i = 0; i < it.getViewObject().getEstimatedRowCount(); i++) {
            Row rw = it.getRowAtRangeIndex(i);
            if (true == rw.getAttribute("MarkForPay")) {
                System.out.println("MarkForPay: " + rw.getAttribute("MarkForPay").toString());
            }
        }
    }
}
