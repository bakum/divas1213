package ua.divas.bean;

import java.math.BigDecimal;

import java.util.Iterator;
import java.util.List;

import javax.el.ELContext;

import javax.el.ExpressionFactory;

import javax.el.MethodExpression;

import javax.faces.application.Application;
import javax.faces.context.FacesContext;

import javax.faces.event.ActionEvent;

import oracle.adf.model.BindingContext;
import oracle.adf.model.binding.DCBindingContainer;
import oracle.adf.model.binding.DCDataControl;
import oracle.adf.model.binding.DCIteratorBinding;
import oracle.adf.view.rich.component.rich.data.RichTreeTable;

import oracle.adf.view.rich.context.AdfFacesContext;

import oracle.binding.BindingContainer;

import oracle.jbo.Key;
import oracle.jbo.Row;
import oracle.jbo.RowNotFoundException;
import oracle.jbo.RowSetIterator;
import oracle.jbo.uicli.binding.JUCtrlHierBinding;
import oracle.jbo.uicli.binding.JUCtrlHierNodeBinding;
import oracle.jbo.uicli.binding.JUIteratorBinding;

import org.apache.myfaces.trinidad.context.RequestContext;
import org.apache.myfaces.trinidad.event.SelectionEvent;
import org.apache.myfaces.trinidad.model.CollectionModel;
import org.apache.myfaces.trinidad.model.RowKeySet;
import org.apache.myfaces.trinidad.model.TreeModel;

import ua.divas.module.AppModuleImpl;

public class KassaBean {

    private RichTreeTable treeTable;

    public KassaBean() {
    }

    public BindingContainer getBindings() {
        return BindingContext.getCurrent().getCurrentBindingsEntry();
    }

    /* public void onTreeSelect(SelectionEvent selectionEvent) {
        RichTreeTable tree1 = this.getTreeTable();
        RowKeySet rks2 = tree1.getSelectedRowKeys();
        Iterator rksIterator = rks2.iterator();
        if (rksIterator.hasNext()) {
            List key = (List) rksIterator.next();
            JUCtrlHierBinding treeBinding = null;
            treeBinding = (JUCtrlHierBinding) ((CollectionModel) tree1.getValue()).getWrappedData();
            JUCtrlHierNodeBinding nodeBinding = treeBinding.findNodeByKeyPath(key);
            DCIteratorBinding _treeIteratorBinding = null;
            _treeIteratorBinding = treeBinding.getDCIteratorBinding();
            JUIteratorBinding iterator = nodeBinding.getIteratorBinding();
            String keyStr = nodeBinding.getRowKey().toStringFormat(true);
            DCIteratorBinding iter = (DCIteratorBinding) getBindings().get("VwKassaMoves1Iterator");
            try {
                iter.setCurrentRowWithKey(keyStr);
                String regId = (String) iter.getCurrentRow().getAttribute("RegistratorId");
                System.out.println(regId);
            } catch (RowNotFoundException e) {
                try {
                    iterator.setCurrentRowWithKey(keyStr);
                    String regId = (String) iterator.getCurrentRow().getAttribute("RegistratorId");
                    System.out.println(regId);
                } catch (RowNotFoundException er) {
                    System.out.println(er.getMessage());
                }
            }
        }
    } */


    public void onTreeSelect(SelectionEvent selectionEvent) {
        //original selection listener set by ADF
        //#{bindings.KassaView1.treeModel.makeCurrent}
        String adfSelectionListener = "#{bindings.KassaView1.treeModel.makeCurrent}";

        FacesContext fctx = FacesContext.getCurrentInstance();
        Application application = fctx.getApplication();
        ELContext elCtx = fctx.getELContext();
        ExpressionFactory exprFactory = application.getExpressionFactory();

        MethodExpression me = null;
        me = exprFactory.createMethodExpression(elCtx, adfSelectionListener, Object.class, new Class[] {
                                                SelectionEvent.class });
        me.invoke(elCtx, new Object[] { selectionEvent });


        /* END PRESERVER DEFAULT ADF SELECT BEHAVIOR */
        RichTreeTable tree = (RichTreeTable) selectionEvent.getSource();
        TreeModel model = (TreeModel) tree.getValue();

        //get selected nodes
        RowKeySet rowKeySet = selectionEvent.getAddedSet();
        Iterator rksIterator = rowKeySet.iterator();
        //for single select configurations,this only is called once
        while (rksIterator.hasNext()) {
            List key = (List) rksIterator.next();
            System.out.println(key);
            JUCtrlHierBinding treeBinding = null;
            CollectionModel collectionModel = (CollectionModel) tree.getValue();
            treeBinding = (JUCtrlHierBinding) collectionModel.getWrappedData();
            JUCtrlHierNodeBinding nodeBinding = null;
            nodeBinding = treeBinding.findNodeByKeyPath(key);
            try {
                Row rw = nodeBinding.getRow();

                //print first row attribute. Note that in a tree you have to
                //determine the node type if you want to select node attributes
                //by name and not index
                String rowType = rw.getStructureDef().getDefName();
                System.out.println(rowType);

                if (rowType.equalsIgnoreCase("VwKassaMoves")) {
                    //System.out.println(rw.getAttribute("RegistratorId"));
                    String regId = (String) rw.getAttribute("RegistratorId");
                    String regType = (String) rw.getAttribute("TableName");
                    if (regType.equalsIgnoreCase("orders")) {
                        Key k = new Key(new Object[] { regId });
                        DCIteratorBinding iter = (DCIteratorBinding) getBindings().get("OrdersView1Iterator");
                        RowSetIterator rsi = iter.getRowSetIterator();
                        Row row = rsi.findByKey(k, 1)[0];
                        //row.setAttribute("OEditable", new BigDecimal(1));
                        rsi.setCurrentRow(row);
                        RequestContext.getCurrentInstance().getPageFlowScope().put("case", "orders");
                    } else if (regType.equalsIgnoreCase("OTHER_ZATRATY")) {
                        Key k = new Key(new Object[] { regId });
                        DCIteratorBinding iter = (DCIteratorBinding) getBindings().get("OtherZatratyView1Iterator");
                        RowSetIterator rsi = iter.getRowSetIterator();
                        Row row = rsi.findByKey(k, 1)[0];
                        //row.setAttribute("OEditable", new BigDecimal(1));
                        rsi.setCurrentRow(row);
                        RequestContext.getCurrentInstance().getPageFlowScope().put("case", "other");
                    } else if (regType.equalsIgnoreCase("PKO")) {
                        Key k = new Key(new Object[] { regId });
                        DCIteratorBinding iter = (DCIteratorBinding) getBindings().get("PkoView1Iterator");
                        RowSetIterator rsi = iter.getRowSetIterator();
                        Row row = rsi.findByKey(k, 1)[0];
                        //row.setAttribute("OEditable", new BigDecimal(1));
                        rsi.setCurrentRow(row);
                        RequestContext.getCurrentInstance().getPageFlowScope().put("case", "pko");
                    } else if (regType.equalsIgnoreCase("RKO")) {
                        Key k = new Key(new Object[] { regId });
                        DCIteratorBinding iter = (DCIteratorBinding) getBindings().get("RkoView1Iterator");
                        RowSetIterator rsi = iter.getRowSetIterator();
                        Row row = rsi.findByKey(k, 1)[0];
                        //row.setAttribute("OEditable", new BigDecimal(1));
                        rsi.setCurrentRow(row);
                        RequestContext.getCurrentInstance().getPageFlowScope().put("case", "rko");
                    } else if (regType.equalsIgnoreCase("START_OST")) {
                        Key k = new Key(new Object[] { regId });
                        DCIteratorBinding iter = (DCIteratorBinding) getBindings().get("StartOstView1Iterator");
                        RowSetIterator rsi = iter.getRowSetIterator();
                        Row row = rsi.findByKey(k, 1)[0];
                        //row.setAttribute("OEditable", new BigDecimal(1));
                        rsi.setCurrentRow(row);
                        RequestContext.getCurrentInstance().getPageFlowScope().put("case", "start");
                    }

                }
            } catch (Exception e) {
                // TODO: Add catch code
                e.printStackTrace();
            }
        }
    }
    
    public void refresh() {
        DCBindingContainer binding = (DCBindingContainer) BindingContext.getCurrent().getCurrentBindingsEntry();
        DCIteratorBinding it = binding.findIteratorBinding("KassaView1Iterator");
        if (it != null) {
            it.executeQuery();
        }
        AdfFacesContext.getCurrentInstance().addPartialTarget(getTreeTable());
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

    public void setTreeTable(RichTreeTable treeTable) {
        this.treeTable = treeTable;
    }

    public RichTreeTable getTreeTable() {
        return treeTable;
    }

    public void onRefresh(ActionEvent actionEvent) {
        refresh();
    }
}
