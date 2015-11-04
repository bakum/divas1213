package ua.divas.bean;

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

public class BuyerDebtBean {
    private RichTreeTable treeTable;

    public BuyerDebtBean() {
    }

    public void setTreeTable(RichTreeTable treeTable) {
        this.treeTable = treeTable;
    }

    public RichTreeTable getTreeTable() {
        return treeTable;
    }

    public BindingContainer getBindings() {
        return BindingContext.getCurrent().getCurrentBindingsEntry();
    }

    public void onTreeSelect(SelectionEvent selectionEvent) {
        //original selection listener set by ADF
        //#{bindings.KassaView1.treeModel.makeCurrent}
        String adfSelectionListener = "#{bindings.VwKontragDeb1.treeModel.makeCurrent}";

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

                if (rowType.equalsIgnoreCase("VwBuyerMoves")) {
                    System.out.println(rw.getAttribute("RegistratorId"));
                    String regId = (String) rw.getAttribute("RegistratorId");
                }
            } catch (Exception e) {
                // TODO: Add catch code
                e.printStackTrace();
            }
        }
    }
    
    public void refresh() {
        DCBindingContainer binding = (DCBindingContainer) BindingContext.getCurrent().getCurrentBindingsEntry();
        DCIteratorBinding it = binding.findIteratorBinding("VwKontragDeb1Iterator");
        //String rks;
        if (it != null) {
            it.executeQuery();
        }
        AdfFacesContext.getCurrentInstance().addPartialTarget(getTreeTable());
    }

    public void onRefresh(ActionEvent actionEvent) {
        refresh();
    }
}
