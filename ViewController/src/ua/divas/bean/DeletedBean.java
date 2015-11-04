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

import oracle.adf.view.rich.event.DialogEvent;

import oracle.binding.BindingContainer;

import oracle.binding.OperationBinding;

import oracle.jbo.Row;
import oracle.jbo.RowNotFoundException;
import oracle.jbo.uicli.binding.JUCtrlHierBinding;
import oracle.jbo.uicli.binding.JUCtrlHierNodeBinding;
import oracle.jbo.uicli.binding.JUIteratorBinding;

import org.apache.myfaces.trinidad.event.SelectionEvent;
import org.apache.myfaces.trinidad.model.CollectionModel;
import org.apache.myfaces.trinidad.model.RowKeySet;

public class DeletedBean {
    private RichTreeTable treeTable;

    public DeletedBean() {
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

    public String refresh() {
        DCBindingContainer binding = (DCBindingContainer) BindingContext.getCurrent().getCurrentBindingsEntry();
        if (binding.getDataControl().isTransactionModified()) {
            BindingContainer bd = BindingContext.getCurrent().getCurrentBindingsEntry();
            OperationBinding ob = bd.getOperationBinding("Rollback");
            ob.execute();
        }
        
        DCIteratorBinding it = binding.findIteratorBinding("ObjectDeleted1Iterator");
        if (it != null) {
            it.executeQuery();
        }
        AdfFacesContext.getCurrentInstance().addPartialTarget(getTreeTable());
        return null;
    }
    
    public void onTreeSelect(SelectionEvent selectionEvent) {
        String adfSelectionListener = "#{bindings.ObjectDeleted1.treeModel.makeCurrent}";

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
            if (keyStr != null && rowType.matches("ObjectDeleted")) {
                DCIteratorBinding iter = (DCIteratorBinding) getBindings().get("ObjectDeleted1Iterator");
                try {
                    iter.setCurrentRowWithKey(keyStr);
                } catch (RowNotFoundException e) {
                    try {
                        iterator.setCurrentRowWithKey(keyStr);
                    } catch (RowNotFoundException er) {
                        System.out.println(er.getMessage());

                    }
                }
            } else if (keyStr != null && rowType.matches("ObjectDeletedRef")) {
                DCIteratorBinding iter = (DCIteratorBinding) getBindings().get("ObjectDeletedRef1Iterator");
                try {
                    iter.setCurrentRowWithKey(keyStr);
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

    public void onRefresh(ActionEvent actionEvent) {
        refresh();
    }

    public void onDelete(ActionEvent actionEvent) {
        BindingContainer binding = BindingContext.getCurrent().getCurrentBindingsEntry();
        OperationBinding oper = (OperationBinding) binding.getOperationBinding("deleteSelectedRowsObj");
        if (oper != null) {
            oper.execute();
        }
        /* oper = (OperationBinding) binding.getOperationBinding("deleteSelectedRowsRef");
        if (oper != null) {
            oper.execute();
        } */
        refresh();
    }
    
    public void onDeleteDialog(DialogEvent dialogEvent) {
        if (dialogEvent.getOutcome().name().equals("ok")) {
            BindingContainer binding = BindingContext.getCurrent().getCurrentBindingsEntry();
            OperationBinding oper = (OperationBinding) binding.getOperationBinding("deleteSelectedRowsObj");
            if (oper != null) {
                oper.execute();
            }
        }
    }
}
