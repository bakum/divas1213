package ua.divas.bean;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.faces.event.ActionEvent;

import oracle.adf.model.BindingContext;
import oracle.adf.model.binding.DCBindingContainer;
import oracle.adf.model.binding.DCIteratorBinding;
import oracle.adf.view.rich.component.rich.RichPopup;
import oracle.adf.view.rich.component.rich.data.RichTable;

import oracle.adf.view.rich.component.rich.data.RichTree;

import oracle.adf.view.rich.component.rich.data.RichTreeTable;
import oracle.adf.view.rich.context.AdfFacesContext;

import oracle.adf.view.rich.datatransfer.DataFlavor;
import oracle.adf.view.rich.datatransfer.Transferable;
import oracle.adf.view.rich.dnd.DnDAction;
import oracle.adf.view.rich.event.DialogEvent;
import oracle.adf.view.rich.event.DropEvent;
import oracle.adf.view.rich.event.PopupCanceledEvent;
import oracle.adf.view.rich.event.PopupFetchEvent;

import oracle.adf.view.rich.model.TreeModel;

import oracle.adfinternal.view.faces.model.binding.FacesCtrlHierNodeBinding;

import oracle.binding.BindingContainer;
import oracle.binding.OperationBinding;

import oracle.jbo.Key;

import oracle.jbo.Row;
import oracle.jbo.RowIterator;
import oracle.jbo.uicli.binding.JUCtrlHierBinding;

import oracle.jbo.uicli.binding.JUCtrlHierNodeBinding;

import org.apache.myfaces.trinidad.event.ReturnEvent;
import org.apache.myfaces.trinidad.event.RowDisclosureEvent;
import org.apache.myfaces.trinidad.model.CollectionModel;
import org.apache.myfaces.trinidad.model.RowKeySet;
import org.apache.myfaces.trinidad.model.RowKeySetImpl;

import ua.divas.module.AppModuleImpl;

public class CurrencyBean {
    private RichTable mainTable;
    private RichTree mainTree;
    private RichPopup mainPopup;

    public CurrencyBean() {
    }

    public void setMainPopup(RichPopup mainPopup) {
        this.mainPopup = mainPopup;
    }

    public RichPopup getMainPopup() {
        return mainPopup;
    }

    public void setMainTable(RichTable mainTable) {
        this.mainTable = mainTable;
    }

    public RichTable getMainTable() {
        return mainTable;
    }

    public void setMainTree(RichTree mainTree) {
        this.mainTree = mainTree;
    }

    public RichTree getMainTree() {
        return mainTree;
    }

    public void rowDiscloseListener(RowDisclosureEvent rowDisclosureEvent) {
        RowKeySet addedSet = rowDisclosureEvent.getAddedSet();
        Object object = rowDisclosureEvent.getSource();
        // iterate over the disclosed row (hopefully only one)
        for (Object obj : addedSet) {
            List<Key> rowKeys = (List<Key>) obj;
            // make the disclosed row the current row
            this.makeDisclosedRowCurrent(rowDisclosureEvent, (Key) rowKeys.get(0));
        }
    }

    /**
     * Synchronizes the table UI component row selection with the
     * selection in the ADF binding layer
     * @param rowDisclosureEvent event object created by the table
     * component upon row selection
     */
    public static void makeDisclosedRowCurrent(RowDisclosureEvent rowDisclosureEvent, Key key) {
        RichTable _table = (RichTable) rowDisclosureEvent.getSource();
        //_table.getDisclosedRowKeys().clear();
        //AdfFacesContext.getCurrentInstance().addPartialTarget(_table);
        //the Collection Model is the object that provides the
        //structured data
        //for the table to render
        CollectionModel _tableModel = (CollectionModel) _table.getValue();
        //the ADF object that implements the CollectionModel is
        //JUCtrlHierBinding. It is wrapped by the CollectionModel API
        JUCtrlHierBinding _adfTableBinding = (JUCtrlHierBinding) _tableModel.getWrappedData();
        //Acess the ADF iterator binding that is used with
        //ADF table binding
        DCIteratorBinding _tableIteratorBinding = _adfTableBinding.getDCIteratorBinding();

        //get the row key from the added rowdisclosure event
        Key _rwKey = key;
        _tableIteratorBinding.setCurrentRowWithKey(_rwKey.toStringFormat(true));
    }

    public void refresh() {
        DCBindingContainer binding = (DCBindingContainer) BindingContext.getCurrent().getCurrentBindingsEntry();
        DCIteratorBinding it = binding.findIteratorBinding("CurrencyView1Iterator");
        //DCIteratorBinding it_detail = binding.findIteratorBinding("ContactDetailsView2Iterator");
        if (it != null) {
            String rks = it.getCurrentRow().getKey().toStringFormat(true);
            it.executeQuery();
            if (rks != null) {
                it.setCurrentRowWithKey(rks);
            }
            /* if (it_detail != null) {
                rks = it_detail.getCurrentRow().getKey().toStringFormat(true);
                it_detail.executeQuery();
                if (rks != null) {
                    it_detail.setCurrentRowWithKey(rks);
                }
            } */
        }
    }

    public String commitChange() {
        BindingContainer binding = BindingContext.getCurrent().getCurrentBindingsEntry();
        OperationBinding ob = binding.getOperationBinding("Commit");
        ob.execute();
        refresh();
        return null;
    }

    public void onRefresh(ActionEvent actionEvent) {
        refresh();
    }


    public String rollbackChange() {
        BindingContainer binding = BindingContext.getCurrent().getCurrentBindingsEntry();
        OperationBinding ob = binding.getOperationBinding("Rollback");
        ob.execute();
        refresh();
        return null;
    }

    public BindingContainer getBindings() {
        return BindingContext.getCurrent().getCurrentBindingsEntry();
    }

    public String doExRates() {
        FacesContext ctx = FacesContext.getCurrentInstance();
        OperationBinding operationBinding = getBindings().getOperationBinding("doCurrencyExchange");
        operationBinding.execute();
        if (!operationBinding.getErrors().isEmpty()) {
            FacesMessage msg =
                new FacesMessage(FacesMessage.SEVERITY_ERROR, "Error", "Произошла ошибка при загрузке курсов!");
            ctx.addMessage(null, msg);
            return null;
        }

        FacesMessage msg = new FacesMessage(FacesMessage.SEVERITY_INFO, "Infirmation", "Загрузка курсов завершена!");
        ctx.addMessage(null, msg);
        return null;
    }


    public void returnListener(ReturnEvent returnEvent) {
        AdfFacesContext.getCurrentInstance().addPartialTarget(this.getMainTree());
    }

    public void onPopup(ActionEvent actionEvent) {
        RowKeySet selection = this.getMainTree().getSelectedRowKeys();

        if (selection != null && selection.getSize() > 0) {
            RichPopup.PopupHints hints = new RichPopup.PopupHints();
            getMainPopup().show(hints);
        }
    }


    public void fetchListener(PopupFetchEvent popupFetchEvent) {
        if (popupFetchEvent.getLaunchSourceClientId() == null) {
            return;
        }
        if (popupFetchEvent.getLaunchSourceClientId().contains("cbInsertDiv")) {
            BindingContainer binding = BindingContext.getCurrent().getCurrentBindingsEntry();
            OperationBinding ob = binding.getOperationBinding("CreateInsert2");
            ob.execute();
        }
    }

    public void cancelListener(PopupCanceledEvent popupCanceledEvent) {
        BindingContainer binding = BindingContext.getCurrent().getCurrentBindingsEntry();
        OperationBinding ob = binding.getOperationBinding("Rollback");
        ob.execute();
    }

    public void dialogListener(DialogEvent dialogEvent) {
        if (dialogEvent.getOutcome().name().equals("ok")) {
            BindingContainer binding = BindingContext.getCurrent().getCurrentBindingsEntry();
            OperationBinding ob = binding.getOperationBinding("Commit");
            ob.execute();
        } else if (dialogEvent.getOutcome().name().equals("cancel")) {
            BindingContainer binding = BindingContext.getCurrent().getCurrentBindingsEntry();
            OperationBinding ob = binding.getOperationBinding("Rollback");
            ob.execute();
        }
    }

    public DnDAction dropHundler(DropEvent dropEvent) {
        //AppModuleImpl am = (AppModuleImpl) BindingContext.getCurrent().getDefaultDataControl().getApplicationModule();
        try {
            RichTree table = (RichTree) dropEvent.getDragComponent();
            RichTree tree = (RichTree) dropEvent.getDropComponent();
            Object currentRowKey = tree.getRowKey();
            List dropRowKey = (List) dropEvent.getDropSite();
            //if no dropsite then drop area was not a data area
            if (dropRowKey == null) {
                return DnDAction.NONE;
            }
            tree.setRowKey(dropRowKey);
            JUCtrlHierNodeBinding dropNode = (JUCtrlHierNodeBinding) tree.getRowData();
            String dropNodeVO = dropNode.getHierTypeBinding().getStructureDefName();
            Row treeRow = dropNode.getRow();
            if (dropNodeVO.equalsIgnoreCase("ua.divas.view.DivisionsView")) {

                Transferable t = dropEvent.getTransferable();
                DataFlavor<RowKeySet> df = DataFlavor.getDataFlavor(RowKeySet.class, "rowmove");
                RowKeySet rks = t.getData(df);
                Iterator iter = rks.iterator();
                Object[] keys = rks.toArray();

                //for (int i = 0; i < keys.length; i++) {
                while (iter.hasNext()) {
                    //get next selected row key
                    List key = (List) iter.next();
                    //List key = (List)keys[i];
                    table.setRowKey(key);
                    //the table model represents its row by the ADF binding class,
                    //which is JUCtrlHierNodeBinding
                    JUCtrlHierNodeBinding rowBinding = (JUCtrlHierNodeBinding) table.getRowData();
                    //DCDataRow is the generic row class representation in in ADF.
                    //It is the super class of oracle.jbo.Row, which you use with
                    //ADF BC services
                    Row tableRow = (Row) rowBinding.getRow();
                    
                    BindingContainer binding = BindingContext.getCurrent().getCurrentBindingsEntry();
                    OperationBinding oper = (OperationBinding) binding.getOperationBinding("changeParentInDivisions");
                    oper.getParamsMap().put("Id", tableRow.getAttribute("Id"));
                    oper.getParamsMap().put("ParentId", treeRow.getAttribute("Id"));
                    oper.execute();
                    
                    //to relocate employees, just change the department ID
                    //tableRow.setAttribute("ParentId", treeRow.getAttribute("Id"));
                }
                tree.setRowKey(currentRowKey);
                CollectionModel treeModel = (CollectionModel) tree.getValue();
                JUCtrlHierBinding treeBinding = (JUCtrlHierBinding) treeModel.getWrappedData();
                //create a new row key set
                RowKeySetImpl rksImpl = new RowKeySetImpl();
                rksImpl.add(dropRowKey);

                JUCtrlHierNodeBinding treeDropNode = treeBinding.findNodeByKeyPath(dropRowKey);
                JUCtrlHierNodeBinding rootNode = treeBinding.getRootNodeBinding();
                JUCtrlHierNodeBinding dropNodeParent = treeDropNode.getParent();
                //walk up the tree to expand all parent nodes
                while (dropNodeParent != null && dropNodeParent != rootNode) {
                    rksImpl.add(dropNodeParent.getKeyPath());
                    dropNodeParent = dropNodeParent.getParent();
                }

                ArrayList<JUCtrlHierNodeBinding> childList =
                    (ArrayList<JUCtrlHierNodeBinding>) treeDropNode.getChildren();
                if (childList != null) {
                    for (JUCtrlHierNodeBinding nb : childList) {
                        rksImpl.add(nb.getKeyPath());
                    }
                }

                tree.setDisclosedRowKeys(rksImpl);
                AdfFacesContext.getCurrentInstance().addPartialTarget(tree.getParent());
                AdfFacesContext.getCurrentInstance().addPartialTarget(table);
                //am.getTransaction().commit();
                return DnDAction.MOVE;
            }
            tree.setRowKey(currentRowKey);
        } catch (Exception ex) {
            System.out.println("drop failed with : " + ex.getMessage());
            //am.getTransaction().rollback();
            //tree.setRowKey(currentRowKey);
            return DnDAction.NONE;
        }
        return DnDAction.NONE;

    }


    /**Method to get Iterator*/
    public RowIterator getSelectedNodeIterator() {
        if (getMainTree() != null && getMainTree().getSelectedRowKeys() != null) {
            for (Object rKey : getMainTree().getSelectedRowKeys()) {
                getMainTree().setRowKey(rKey);
                return ((JUCtrlHierNodeBinding) getMainTree().getRowData()).getRowIterator();
            }
        }
        return null;
    }

    /**Method to get Node Key*/
    public Key getSelectedNodeKey() {
        if (getMainTree() != null && getMainTree().getSelectedRowKeys() != null) {
            for (Object rKey : getMainTree().getSelectedRowKeys()) {
                getMainTree().setRowKey(rKey);
                return ((JUCtrlHierNodeBinding) getMainTree().getRowData()).getRowKey();
            }
        }
        return null;
    }

    public void delete(ActionEvent actionEvent) {
        RowKeySet selection = this.getMainTree().getSelectedRowKeys();

        if (selection != null && selection.getSize() > 0) {
            for (Object facesTreeRowKey : selection) {
                this.getMainTree().setRowKey(facesTreeRowKey);
                JUCtrlHierNodeBinding root = (JUCtrlHierNodeBinding) this.getMainTree().getRowData();

                JUCtrlHierNodeBinding node = this.getFirstChild(root);
                while (node != null) {
                    System.out.println(node.getRow().getAttribute(0));

                    node.getRow().remove();

                    if (node.getChildren() != null) {
                        node = this.getFirstChild(node);
                    } else {
                        while (this.getNextSibling(node) == null && node != root)
                            node = node.getParent();

                        if (node != root) {
                            node = this.getNextSibling(node);
                        } else {
                            node = null;
                        }
                    }
                }
                System.out.println(root.getRow().getAttribute(0));

                root.getRow().remove();
            }
        }
    }

    private JUCtrlHierNodeBinding getFirstChild(JUCtrlHierNodeBinding node) {
        if (node.getChildren() != null) {
            return (JUCtrlHierNodeBinding) node.getChildren().get(0);
        }

        return null;
    }

    private JUCtrlHierNodeBinding getNextSibling(JUCtrlHierNodeBinding node) {
        try {
            JUCtrlHierNodeBinding parent = node.getParent();
            int index = parent.getChildren().indexOf(node);

            index = ++index;

            if (index < parent.getChildren().size()) {
                return (JUCtrlHierNodeBinding) parent.getChildren().get(index);
            }
        } catch (Exception e) {

            return null;
        }
        return null;
    }

    private void expandTreeChildrenNode(RichTree rt, FacesCtrlHierNodeBinding node, List<Key> parentRowKey) {
        ArrayList children = node.getChildren();
        List<Key> rowKey;

        if (children != null) {
            for (int i = 0; i < children.size(); i++) {
                rowKey = new ArrayList<Key>();
                rowKey.addAll(parentRowKey);
                rowKey.add(((FacesCtrlHierNodeBinding) children.get(i)).getRowKey());
                rt.getDisclosedRowKeys().add(rowKey);
                if (((FacesCtrlHierNodeBinding) (children.get(i))).getChildren() == null)
                    continue;
                expandTreeChildrenNode(rt, (FacesCtrlHierNodeBinding) (node.getChildren().get(i)), rowKey);
            }
        }
    }
    
    public void discloseTreeNodeChildren(RowDisclosureEvent event) {
       RowKeySet addedKeys = event.getAddedSet();
       Iterator addedIt = addedKeys.iterator();
       if(addedIt.hasNext()) {
           Object addedKey = addedIt.next();
           TreeModel treeModel = (TreeModel) this.mainTree.getValue();
           JUCtrlHierNodeBinding nodeBinding = (JUCtrlHierNodeBinding)
                  treeModel.getRowData(addedKey);
           String isLeaf = (String) nodeBinding.getAttribute("isLeaf");       
             // you have to have a condition to break the series of disclosure events!!
           if(!(new Boolean(isLeaf))) {
               this.expandAllNodes(nodeBinding, this.mainTree.getDisclosedRowKeys());
               AdfFacesContext.getCurrentInstance().addPartialTarget(this.mainTree);
           }
       }
    }
    
    private void expandAllNodes(JUCtrlHierNodeBinding nodeBinding, RowKeySet
             disclosedKeys) {   
       List<JUCtrlHierNodeBinding> childNodes = (List<JUCtrlHierNodeBinding>)
           nodeBinding.getChildren();     
       ArrayList newKeys = new ArrayList();
       if(childNodes != null) {
           for(JUCtrlHierNodeBinding node : childNodes) {           
               newKeys.add(node.getKeyPath());
               // recursive call to the method expandAllNodes()         
               expandAllNodes(node, disclosedKeys);
           }
       }
       disclosedKeys.addAll(newKeys);     
    }
}
