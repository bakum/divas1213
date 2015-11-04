package ua.divas.bean;

import java.util.ArrayList;
import java.util.List;

import javax.faces.component.UIViewRoot;
import javax.faces.context.FacesContext;

import oracle.adf.view.rich.component.rich.data.RichTree;
import oracle.adf.view.rich.component.rich.data.RichTreeTable;

import oracle.adf.view.rich.context.AdfFacesContext;

import oracle.jbo.uicli.binding.JUCtrlHierBinding;
import oracle.jbo.uicli.binding.JUCtrlHierNodeBinding;

import org.apache.myfaces.trinidad.model.CollectionModel;
import org.apache.myfaces.trinidad.model.RowKeySetImpl;


public class TreeTableHelper {

    //showCase for tree tables
    private RowKeySetImpl newDisclosedTreeTableKeys = null;
    //showCase for tree
    private RowKeySetImpl newDisclosedTreeKeys = null;
    //allows you to configure the depth of the tree table
    private int expandTreeToLevelLevel = 1;
    
    private RichTree ttree;
    private RichTreeTable tableTree;

    public void setTableTree(RichTreeTable tableTree) {
        this.tableTree = tableTree;
    }

    public RichTreeTable getTableTree() {
        return tableTree;
    }

    public void setTree(RichTree tree) {
        this.ttree = tree;
    }

    public RichTree getTree() {
        return ttree;
    }

    public TreeTableHelper() {
        super();
    }


    public void setNewDisclosedTreeTableKeys(RowKeySetImpl newDisclosedKeys) {
        this.newDisclosedTreeTableKeys = newDisclosedKeys;
    }

    public RowKeySetImpl getNewDisclosedTreeTableKeys() {

        if (newDisclosedTreeTableKeys == null) {
            newDisclosedTreeTableKeys = new RowKeySetImpl();

            /* FacesContext fctx = FacesContext.getCurrentInstance();
            UIViewRoot root = fctx.getViewRoot();
            //lookup the tree table component by its component ID
            RichTreeTable treeTable = (RichTreeTable)root.findComponent("tt1"); */
            RichTreeTable treeTable = this.getTableTree();
            //if tree table is found
            if (treeTable != null) {
                //get the collection model to access the ADF binding layer for 
                //the tree binding used
                CollectionModel model = (CollectionModel)treeTable.getValue();
                JUCtrlHierBinding treeBinding =
                    (JUCtrlHierBinding)model.getWrappedData();

                JUCtrlHierNodeBinding nodeBinding =
                    treeBinding.getRootNodeBinding();          
                expandAllNodes(nodeBinding, newDisclosedTreeTableKeys, 0, expandTreeToLevelLevel);
            }
        }

        return newDisclosedTreeTableKeys;
    }

    public void setNewDisclosedTreeKeys(RowKeySetImpl newDisclosedTreeKeys) {
        this.newDisclosedTreeKeys = newDisclosedTreeKeys;
    }

    public RowKeySetImpl getNewDisclosedTreeKeys() {
        if (newDisclosedTreeKeys == null) {
            newDisclosedTreeKeys = new RowKeySetImpl();

            /* FacesContext fctx = FacesContext.getCurrentInstance();
            UIViewRoot root = fctx.getViewRoot();
            //lookup thetree component by its component ID
            RichTree tree = (RichTree)root.findComponent("t1"); */
            RichTree tree = this.getTree();
            //if tree is found ....
            if (tree != null) {
              //get the collection model to access the ADF binding layer for 
              //the tree binding used. Note that for this sample the bindings
              //used by the tree is different from the binding used for the tree
              //table
                CollectionModel model = (CollectionModel)tree.getValue();
                JUCtrlHierBinding treeBinding = (JUCtrlHierBinding)model.getWrappedData();

                JUCtrlHierNodeBinding nodeBinding = treeBinding.getRootNodeBinding();
                expandAllNodes(nodeBinding, newDisclosedTreeKeys, 0, expandTreeToLevelLevel);
            }
        }
        return newDisclosedTreeKeys;
    }

    /*
     * Method that allows you to dynamically set the maximum level 
     * until where the tree or tree table is disclosed. Note that 
     * to use this from a rendered page, you need an additional method
     * that clears the current disclosed row keys
     */
    public void setExpandTreeToLevelLevel(int expandTreeToLevelLevel) {
        this.expandTreeToLevelLevel = expandTreeToLevelLevel;
    }

    public int getExpandTreeToLevelLevel() {
        return expandTreeToLevelLevel;
    }

    /**
     * Recursive method to expand nodes to a pre-defined level
     *
     * @param nodeBinding the JUCtrlHierNodeBinding representing the current node
     * @param disclosedKeys the RowKeySetImpl instance that holds the keys to disclose
     * @param currentExpandLevel the current depth of the tree node
     * @param maxExpandLevel the max. number of levels to expand nodes for
     */
    private void expandAllNodes(JUCtrlHierNodeBinding nodeBinding,
                                RowKeySetImpl disclosedKeys,
                                int currentExpandLevel, int maxExpandLevel) {
        if (currentExpandLevel <= maxExpandLevel) {
            List<JUCtrlHierNodeBinding> childNodes =
                (List<JUCtrlHierNodeBinding>)nodeBinding.getChildren();
            ArrayList newKeys = new ArrayList();
            if (childNodes != null) {
                for (JUCtrlHierNodeBinding _node : childNodes) {
                    newKeys.add(_node.getKeyPath());
                    expandAllNodes(_node, disclosedKeys,
                                   currentExpandLevel + 1, maxExpandLevel);
                }
            }
            disclosedKeys.addAll(newKeys);
        }
    }

    public String onRefreshTreeTable() {
        
        /* FacesContext fctx = FacesContext.getCurrentInstance();
        UIViewRoot root = fctx.getViewRoot(); */
        AdfFacesContext adfFacesContext = AdfFacesContext.getCurrentInstance();
              
        
        //clear disclosed RowKeys
        newDisclosedTreeTableKeys =null;
        //PPR tree table
        //RichTreeTable treeTable = (RichTreeTable)root.findComponent("tt1");
        RichTreeTable treeTable = this.getTableTree();
        getNewDisclosedTreeTableKeys();
        adfFacesContext.addPartialTarget(treeTable);     
        
        return null;
    }
    
    public String onRefreshTree() {
        
        /* FacesContext fctx = FacesContext.getCurrentInstance();
        UIViewRoot root = fctx.getViewRoot(); */
        AdfFacesContext adfFacesContext = AdfFacesContext.getCurrentInstance();
               
        //reset tree keys
        newDisclosedTreeKeys = null;
        //RichTree tree = (RichTree)root.findComponent("t1");
        RichTree tree = this.getTree();
        getNewDisclosedTreeKeys();
        adfFacesContext.addPartialTarget(tree);        
        
        return null;
    }
}
