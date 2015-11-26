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
import oracle.adf.model.binding.DCIteratorBinding;
import oracle.adf.view.rich.component.rich.data.RichTable;
import oracle.adf.view.rich.component.rich.data.RichTreeTable;
import oracle.adf.view.rich.component.rich.nav.RichButton;

import oracle.adf.view.rich.context.AdfFacesContext;

import oracle.binding.BindingContainer;

import oracle.jbo.Key;
import oracle.jbo.Row;
import oracle.jbo.RowSetIterator;
import oracle.jbo.uicli.binding.JUCtrlHierBinding;
import oracle.jbo.uicli.binding.JUCtrlHierNodeBinding;

import org.apache.myfaces.trinidad.event.SelectionEvent;
import org.apache.myfaces.trinidad.event.SelectionListener;
import org.apache.myfaces.trinidad.model.CollectionModel;
import org.apache.myfaces.trinidad.model.RowKeySet;

import ua.divas.bean.control.SupplierWallet;

public class DogovorBean {
    private RichButton execButton;
    private RichTable table;


    public void setTable(RichTable table) {
        this.table = table;
    }

    public RichTable getTable() {
        return table;
    }

    public DogovorBean() {
    }

    public void setExecButton(RichButton execButton) {
        this.execButton = execButton;
    }

    public RichButton getExecButton() {
        return execButton;
    }

    public BindingContainer getBindings() {
        return BindingContext.getCurrent().getCurrentBindingsEntry();
    }

    private MethodExpression resolveMethod(String adfSelectionListener) {
        FacesContext fctx = FacesContext.getCurrentInstance();
        Application application = fctx.getApplication();
        ELContext elCtx = fctx.getELContext();
        ExpressionFactory exprFactory = application.getExpressionFactory();

        MethodExpression me = null;
        me = exprFactory.createMethodExpression(elCtx, adfSelectionListener, Object.class, new Class[] {
                                                SelectionEvent.class });
        return me;
    }

    public void onTableSelect(SelectionEvent selectionEvent) {
        ADFUtil.invokeEL("#{bindings.OrdersView1.collectionModel.makeCurrent}", new Class[] { SelectionEvent.class }, new Object[] {
                         selectionEvent });
    }

    private void setCurrentRow() {
        /* String adfSelectionListener = "#{bindings.OrdersView1.collectionModel.makeCurrent}";
        //table.setSelectionListener(resolveMethod(adfSelectionListener));
        //SelectionEvent selectionEvent = new SelectionEvent(table.getSelectedRowKeys(), table.getSelectedRowKeys(), table);
        //queue event for execution
       // selectionEvent.queue();

        FacesContext fctx = FacesContext.getCurrentInstance();
        Application application = fctx.getApplication();
        ELContext elCtx = fctx.getELContext();
        ExpressionFactory exprFactory = application.getExpressionFactory();

        MethodExpression me = null;
        me = exprFactory.createMethodExpression(elCtx, adfSelectionListener, Object.class, new Class[] {
                                                SelectionEvent.class });
        me.invoke(elCtx, new Object[] { se });  */

        RichTable tree1 = this.getTable();
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
            if (rowType.matches("OrdersView")) {
                String regId = (String) rw.getAttribute("Id");
                Key k = new Key(new Object[] { regId });
                DCIteratorBinding iter = (DCIteratorBinding) getBindings().get("OrdersView1Iterator");
                RowSetIterator rsi = iter.getRowSetIterator();
                Row row = rsi.findByKey(k, 1)[0];
                rsi.setCurrentRow(row);
            }
        }
    }

    public void onEditOrder(ActionEvent actionEvent) {
        setCurrentRow();

        ActionEvent ae = new ActionEvent(getExecButton());
        ae.queue();

        //String adfSelectionListener = "#{bindings.OrdersView1.collectionModel.makeCurrent}";
        //table.removeSelectionListener((SelectionListener) resolveMethod(adfSelectionListener));
    }
}
