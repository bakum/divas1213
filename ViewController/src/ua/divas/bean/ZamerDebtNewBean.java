package ua.divas.bean;

import java.math.BigDecimal;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.el.ELContext;
import javax.el.ExpressionFactory;
import javax.el.MethodExpression;

import javax.faces.application.Application;
import javax.faces.application.ViewHandler;
import javax.faces.component.UIComponent;
import javax.faces.component.UIViewRoot;
import javax.faces.context.FacesContext;

import javax.faces.event.ActionEvent;

import javax.faces.event.ValueChangeEvent;

import oracle.adf.model.BindingContext;
import oracle.adf.model.binding.DCBindingContainer;
import oracle.adf.model.binding.DCIteratorBinding;
import oracle.adf.view.rich.component.rich.data.RichTreeTable;

import oracle.adf.view.rich.component.rich.nav.RichButton;
import oracle.adf.view.rich.context.AdfFacesContext;

import oracle.binding.BindingContainer;

import oracle.jbo.Key;
import oracle.jbo.Row;
import oracle.jbo.RowNotFoundException;
import oracle.jbo.RowSetIterator;
import oracle.jbo.uicli.binding.JUCtrlHierBinding;
import oracle.jbo.uicli.binding.JUCtrlHierNodeBinding;
import oracle.jbo.uicli.binding.JUIteratorBinding;

import org.apache.myfaces.trinidad.event.SelectionEvent;
import org.apache.myfaces.trinidad.model.CollectionModel;
import org.apache.myfaces.trinidad.model.RowKeySet;

import ua.divas.bean.control.SupplierRecord;
import ua.divas.bean.control.SupplierWallet;

public class ZamerDebtNewBean {
    private RichTreeTable treeTable;
    private List<SupplierRecord> selectedValues = new ArrayList<SupplierRecord>();
    private String summAll;
    private boolean walletVisible;
    private boolean disabledInBin;
    private String btnTextBallans;
    private boolean disabledInShoppingcart;
    private String btnStyle;

    public ZamerDebtNewBean() {
    }

    public void setTreeTable(RichTreeTable treeTable) {
        this.treeTable = treeTable;
    }

    public RichTreeTable getTreeTable() {
        return treeTable;
    }

    private BindingContainer getBindings() {
        return BindingContext.getCurrent().getCurrentBindingsEntry();
    }

    public final List<SupplierRecord> getSelectedValues() {
        DCBindingContainer bindings = (DCBindingContainer) BindingContext.getCurrent().getCurrentBindingsEntry();
        DCIteratorBinding dcIteratorBindings = bindings.findIteratorBinding("VwZamerMovesNew2Iterator");

        // Get all the rows of a iterator
        Row[] rows = dcIteratorBindings.getAllRowsInRange();
        for (Row rw : rows) {
            BigDecimal lbn = (BigDecimal) rw.getAttribute("Ballans");
            String Id = rw.getAttribute("Keyid").toString();
            int found = SupplierWallet.searchSupplier(Id);
            if (found != -1 || lbn.floatValue() <= 0) {
                continue;
            }
            String kontragId = rw.getAttribute("Id").toString();
            String orderId = rw.getAttribute("RegistratorId").toString();
            SupplierRecord spl = new SupplierRecord(Id, kontragId, orderId, lbn.abs());
            spl.setIsIn(true);
            selectedValues.add(spl);
        }
        return selectedValues;
    }

    public void onTreeSelect(SelectionEvent selectionEvent) {
        String adfSelectionListener = "#{bindings.VwKontragZamerNew1.treeModel.makeCurrent}";

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
            if (keyStr != null && rowType.matches("VwZamerMovesNew")) {
                DCIteratorBinding iter = (DCIteratorBinding) getBindings().get("VwZamerMovesNew1Iterator");
                //DCIteratorBinding itr = (DCIteratorBinding) getBindings().get("VwZamerMoves2Iterator");
                try {
                    iter.setCurrentRowWithKey(keyStr);
                    //itr.setCurrentRowWithKey(keyStr);
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

    public void refresh() {
        DCBindingContainer binding = (DCBindingContainer) BindingContext.getCurrent().getCurrentBindingsEntry();
        DCIteratorBinding it = binding.findIteratorBinding("VwKontragZamerNew1Iterator");
        //String rks;
        if (it != null) {
            it.executeQuery();
        }
        AdfFacesContext.getCurrentInstance().addPartialTarget(getTreeTable());
    }

    public void onRefresh(ActionEvent actionEvent) {
        refresh();
    }

    public void onAddWallet(ActionEvent actionEvent) {
        RichTreeTable tree1 = this.getTreeTable();
        RowKeySet rks2 = tree1.getSelectedRowKeys();
        Iterator rksIterator = rks2.iterator();
        BigDecimal lbn = null;
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
            if (rowType.matches("VwZamerMovesNew")) {
                lbn = (BigDecimal) rw.getAttribute("Ballans");
                String Id = rw.getAttribute("Keyid").toString();
                String kontragId = rw.getAttribute("Id").toString();
                String orderId = rw.getAttribute("RegistratorId").toString();
                SupplierWallet.addSupplierWithIdIn(Id, kontragId, orderId, lbn.abs());
                //rw.setAttribute("MarkForPay", true);
            } else if (rowType.matches("VwKontragZamerNew")) {
                String regId = (String) rw.getAttribute("Id");
                Key k = new Key(new Object[] { regId });
                DCIteratorBinding iter = (DCIteratorBinding) getBindings().get("VwKontragZamerNew1Iterator");
                RowSetIterator rsi = iter.getRowSetIterator();
                Row row = rsi.findByKey(k, 1)[0];
                //row.setAttribute("OEditable", new BigDecimal(1));
                rsi.setCurrentRow(row);
                SupplierWallet.setAllSupplierList(this.getSelectedValues());
            }
            //AdfFacesContext.getCurrentInstance().addPartialTarget(getBinButton());
            AdfFacesContext.getCurrentInstance().addPartialTarget(getTreeTable());
            refreshParent();
        }
    }

    public void refreshParent() {
        FacesContext facesContext = FacesContext.getCurrentInstance();
        UIComponent shoppingbtn = facesContext.getViewRoot().findComponent("bShoppingcart");
        AdfFacesContext.getCurrentInstance().addPartialTarget(shoppingbtn);

        /* UIComponent foundComponent = null;
        for (UIComponent component : FacesContext.getCurrentInstance().getViewRoot().getChildren()) {
            if (component.getId().contains("bShoppingcart")) {
                foundComponent = component;
                break;
            }
        }
        if (foundComponent != null) {
            AdfFacesContext.getCurrentInstance().addPartialTarget(foundComponent);
        } */
    }

    /* public void setSummAll(String summAll) {
        this.summAll = summAll;
    } */

    public String getSummAll() {
        return "В корзине к оплате: " + SupplierWallet.getSummAll().toString();
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

    public boolean getDisabledInShoppingcart() {
        try {
            String Id = (String) ADFUtil.evaluateEL("#{node.Keyid}");
            int i = SupplierWallet.searchSupplier(Id);
            System.out.println("i: " + i);
            if (i == -1) {
                return false;
            } else {
                return true;
            }
        } catch (Exception e) {
            return false;
            //e.printStackTrace();
        }
    }

    public boolean getDisabledInBin() {
        String Id = (String) ADFUtil.evaluateEL("#{node.Keyid}");
        BigDecimal ball = null;
        try {
            ball = (BigDecimal) ADFUtil.evaluateEL("#{node.Ballans}");
        } catch (Exception e) {
            String s1 = (String) ADFUtil.evaluateEL("#{node.Ballans}");
            String s2 = s1.replaceFirst(",", ".");
            ball = new BigDecimal(s2);
        }
        if (ball.floatValue() <= 0) {
            return true;
        }
        if (null != Id) {
            int i = SupplierWallet.searchSupplier(Id);
            System.out.println("i: " + i);
            if (i == -1) {
                return false;
            } else {
                return true;
            }
        } else {
            return false;
        }
    }

    public void onCheckAdd(ValueChangeEvent valueChangeEvent) {
        onAddWallet(null);
    }

    /* public void setBtnTextBallans(String btnTextBallans) {
        this.btnTextBallans = btnTextBallans;
    } */

    public String getBtnTextBallans() {

        try {
            String ball = (String) ADFUtil.evaluateEL("#{node.Ballans}");
            String s1 = ball.replaceFirst(",", ".");
            return String.format("%4.2f", new BigDecimal(s1));
        } catch (Exception e) {
            BigDecimal ball = (BigDecimal) ADFUtil.evaluateEL("#{node.Ballans}");
            return String.format("%4.2f", ball);
        }
    }

    public String getBtnStyle() {
        Object fullname = ADFUtil.evaluateEL("#{node.Fullname}");
        BigDecimal ball = null;
        try {
            ball = (BigDecimal) ADFUtil.evaluateEL("#{node.Ballans}");
        } catch (Exception e) {
            String s1 = (String) ADFUtil.evaluateEL("#{node.Ballans}");
            String s2 = s1.replaceFirst(",", ".");
            ball = new BigDecimal(s2);
        }
        if (null == fullname) {
            if (ball.floatValue() > 0) {
                return "color:Black;";
            } else {
                return "color:Red;";
            }
        } else {
            if (ball.floatValue() > 0) {
                return "color:Black;font-weight:bold;";
            } else {
                return "color:Red;font-weight:bold;";
            }
        }
    }
}
