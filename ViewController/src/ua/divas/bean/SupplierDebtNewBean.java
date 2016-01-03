package ua.divas.bean;

import java.math.BigDecimal;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;

import javax.faces.event.ActionEvent;

import oracle.adf.model.BindingContext;
import oracle.adf.model.binding.DCBindingContainer;
import oracle.adf.model.binding.DCIteratorBinding;
import oracle.adf.view.rich.component.rich.data.RichTreeTable;

import oracle.adf.view.rich.context.AdfFacesContext;

import oracle.binding.BindingContainer;

import oracle.jbo.Key;
import oracle.jbo.Row;
import oracle.jbo.RowSetIterator;
import oracle.jbo.uicli.binding.JUCtrlHierBinding;
import oracle.jbo.uicli.binding.JUCtrlHierNodeBinding;

import org.apache.myfaces.trinidad.model.CollectionModel;
import org.apache.myfaces.trinidad.model.RowKeySet;

import ua.divas.bean.control.SupplierRecord;
import ua.divas.bean.control.SupplierWallet;

public class SupplierDebtNewBean {
    private RichTreeTable treeTable;
    private List<SupplierRecord> selectedValues = new ArrayList<SupplierRecord>();
    private String btnTextBallans;
    private boolean disabledInBin;
    private boolean disabledInShoppingcart;
    private String btnStyle;

    public SupplierDebtNewBean() {
    }


    /* public final void setSelectedValues(List<SupplierRecord> selectedValues) {
        this.selectedValues = selectedValues;
    } */

    public final List<SupplierRecord> getSelectedValues() {
        DCBindingContainer bindings = (DCBindingContainer) BindingContext.getCurrent().getCurrentBindingsEntry();
        DCIteratorBinding dcIteratorBindings = bindings.findIteratorBinding("VwSupplierMovesNew1Iterator");

        // Get all the rows of a iterator
        Row[] rows = dcIteratorBindings.getAllRowsInRange();
        for (Row rw : rows) {
            BigDecimal lbn = (BigDecimal) rw.getAttribute("Ballans");
            String Id = rw.getAttribute("Keyid").toString();
            int found = SupplierWallet.searchSupplier(Id);
            if (found != -1 || lbn.floatValue() >= 0) {
                continue;
            }
            String kontragId = rw.getAttribute("Id").toString();
            String orderId = rw.getAttribute("RegistratorId").toString();
            SupplierRecord spl = new SupplierRecord(Id, kontragId, orderId, lbn.abs());
            spl.setIsIn(false);
            selectedValues.add(spl);
        }
        return selectedValues;
    }

    public void setTreeTable(RichTreeTable treeTable) {
        this.treeTable = treeTable;
    }

    public RichTreeTable getTreeTable() {
        return treeTable;
    }

    public void refresh() {
        DCBindingContainer binding = (DCBindingContainer) BindingContext.getCurrent().getCurrentBindingsEntry();
        DCIteratorBinding it = binding.findIteratorBinding("VwKontragSupplierNew1Iterator");
        //String rks;
        if (it != null) {
            it.executeQuery();
        }
        AdfFacesContext.getCurrentInstance().addPartialTarget(getTreeTable());
    }

    public void onRefresh(ActionEvent actionEvent) {
        refresh();
    }
    
    /* public final void setDisabledInShoppingcart(boolean disabledInShoppingcart) {
        this.disabledInShoppingcart = disabledInShoppingcart;
    } */

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
        try {
            String Id = (String) ADFUtil.evaluateEL("#{node.Keyid}");
            BigDecimal ball = (BigDecimal) ADFUtil.evaluateEL("#{node.Ballans}");
            if (ball.floatValue() > 0) {
                return true;
            }
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

    /* public void setBtnTextBallans(String btnTextBallans) {
        this.btnTextBallans = btnTextBallans;
    } */

    public String getBtnTextBallans() {
        BigDecimal ball = (BigDecimal) ADFUtil.evaluateEL("#{node.Ballans}");
        //String s1 = ball.replaceFirst(",", ".");
        //return ball;
        //return String.format("%4.2f" , new BigDecimal(s1)) ;
        return String.format("%4.2f", ball);
    }

    public void refreshParent() {
        FacesContext facesContext = FacesContext.getCurrentInstance();
        UIComponent shoppingbtn = facesContext.getViewRoot().findComponent("ptb1:bShoppingcart");
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

    public BindingContainer getBindings() {
        return BindingContext.getCurrent().getCurrentBindingsEntry();
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
            if (rowType.matches("VwSupplierMovesNew")) {
                lbn = (BigDecimal) rw.getAttribute("Ballans");
                String Id = rw.getAttribute("Keyid").toString();
                String kontragId = rw.getAttribute("Id").toString();
                String orderId = rw.getAttribute("RegistratorId").toString();
                SupplierWallet.addSupplierWithId(Id, kontragId, orderId, lbn.abs());
                //rw.setAttribute("MarkForPay", true);
            } else if (rowType.matches("VwKontragSupplierNew")) {
                String regId = (String) rw.getAttribute("Id");
                Key k = new Key(new Object[] { regId });
                DCIteratorBinding iter = (DCIteratorBinding) getBindings().get("VwKontragSupplierNew1Iterator");
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

    /* public void setBtnStyle(String btnStyle) {
        this.btnStyle = btnStyle;
    } */

    public String getBtnStyle() {
        Object fullname = ADFUtil.evaluateEL("#{node.Fullname}");
        BigDecimal ball = (BigDecimal) ADFUtil.evaluateEL("#{node.Ballans}");
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
