package ua.divas.bean;

import com.google.common.io.ByteStreams;

import com.itextpdf.text.Chapter;
import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.Section;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

import java.io.InputStream;
import java.io.OutputStream;

import java.net.URL;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import java.util.Map;

import javax.el.ELContext;
import javax.el.ExpressionFactory;
import javax.el.MethodExpression;

import javax.faces.application.Application;
import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.faces.event.ActionEvent;


import javax.servlet.http.HttpServletRequest;

import oracle.adf.controller.ControllerContext;
import oracle.adf.model.BindingContext;
import oracle.adf.model.binding.DCBindingContainer;
import oracle.adf.model.binding.DCDataControl;
import oracle.adf.model.binding.DCIteratorBinding;
import oracle.adf.share.ADFContext;
import oracle.adf.view.rich.component.rich.data.RichListView;
import oracle.adf.view.rich.component.rich.data.RichTable;
import oracle.adf.view.rich.component.rich.data.RichTree;
import oracle.adf.view.rich.component.rich.data.RichTreeTable;
import oracle.adf.view.rich.component.rich.layout.RichPanelFormLayout;
import oracle.adf.view.rich.context.AdfFacesContext;
import oracle.adf.view.rich.datatransfer.DataFlavor;
import oracle.adf.view.rich.dnd.DnDAction;
import oracle.adf.view.rich.event.DialogEvent;
import oracle.adf.view.rich.event.DropEvent;
import oracle.adf.view.rich.event.ItemEvent;
import oracle.adf.view.rich.event.PopupCanceledEvent;
import oracle.adf.view.rich.event.PopupFetchEvent;
import oracle.adf.view.rich.event.QueryEvent;

import oracle.adf.view.rich.model.FilterableQueryDescriptor;

import oracle.adf.view.rich.render.ClientEvent;

import oracle.binding.BindingContainer;

import oracle.binding.OperationBinding;

import oracle.jbo.Key;

import oracle.jbo.Row;
import oracle.jbo.RowIterator;
import oracle.jbo.RowNotFoundException;
import oracle.jbo.RowSetIterator;
import oracle.jbo.uicli.binding.JUCtrlHierBinding;

import oracle.jbo.uicli.binding.JUCtrlHierNodeBinding;

import oracle.jbo.uicli.binding.JUIteratorBinding;

import org.apache.myfaces.trinidad.event.PollEvent;
import org.apache.myfaces.trinidad.event.ReturnEvent;
import org.apache.myfaces.trinidad.event.RowDisclosureEvent;
import org.apache.myfaces.trinidad.event.SelectionEvent;
import org.apache.myfaces.trinidad.model.CollectionModel;
import org.apache.myfaces.trinidad.model.RowKeySet;

import org.apache.myfaces.trinidad.model.RowKeySetImpl;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import ua.divas.module.AppModuleImpl;


public class FilterBeans {
    private RichTable mainTable;
    private RichPanelFormLayout formToRefresh;
    private String del_title;
    private String del_style;
    private String del_label;
    private RichListView list;


    public FilterBeans() {
        super();
    }

    public void setMainTable(RichTable mainTable) {
        this.mainTable = mainTable;
    }

    public RichTable getMainTable() {
        return mainTable;
    }

    public BindingContainer getBindings() {
        return BindingContext.getCurrent().getCurrentBindingsEntry();
    }

    public void resetTableFilter(ActionEvent actionEvent) {
        FilterableQueryDescriptor queryDescriptor = (FilterableQueryDescriptor) getMainTable().getFilterModel();
        if (queryDescriptor != null && queryDescriptor.getFilterCriteria() != null) {
            queryDescriptor.getFilterCriteria().clear();
            getMainTable().queueEvent(new QueryEvent(getMainTable(), queryDescriptor));
        }
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

    public void fetchListener(PopupFetchEvent popupFetchEvent) {
        BindingContainer binding = BindingContext.getCurrent().getCurrentBindingsEntry();
        OperationBinding ob = binding.getOperationBinding("CreateInsert1");
        ob.execute();
    }

    public void cancelListener(PopupCanceledEvent popupCanceledEvent) {
        BindingContainer binding = BindingContext.getCurrent().getCurrentBindingsEntry();
        OperationBinding ob = binding.getOperationBinding("Rollback");
        ob.execute();
        callSelectionListener();
    }

    public void dialogListener(DialogEvent dialogEvent) {
        if (dialogEvent.getOutcome().name().equals("ok")) {
            BindingContainer binding = BindingContext.getCurrent().getCurrentBindingsEntry();
            OperationBinding ob = binding.getOperationBinding("Commit");
            ob.execute();
            refresh();
        } else if (dialogEvent.getOutcome().name().equals("cancel")) {
            BindingContainer binding = BindingContext.getCurrent().getCurrentBindingsEntry();
            OperationBinding ob = binding.getOperationBinding("Rollback");
            ob.execute();
            callSelectionListener();
        }
    }

    private void callSelectionListener() {
        DCBindingContainer binding = (DCBindingContainer) BindingContext.getCurrent().getCurrentBindingsEntry();
        DCIteratorBinding it = binding.findIteratorBinding("KontragentsView1Iterator");

        Row currentRow = it.getCurrentRow();
        //build the table rowKeySet
        List rowKeyList = new ArrayList();
        //check if there is child data at all
        if (currentRow != null) {
            //add primary key as jbo key
            Key jboKey = new Key(new Object[] { currentRow.getAttribute("Id") });
            rowKeyList.add(jboKey);
            //add key to RowKeySet. For table multi row select usecases
            //you would add multiple row keys like this
            RowKeySet newRowKeySet = new RowKeySetImpl();
            newRowKeySet.add(rowKeyList);
            //create SelectioNEvent that pretends users has selected first row
            //in table
            SelectionEvent selectEvent = new SelectionEvent(mainTable.getSelectedRowKeys(), newRowKeySet, mainTable);
            //queue event for execution
            selectEvent.queue();
        }
    }

    public void selectedListener(SelectionEvent selectionEvent) {
        /* ADFUtil.invokeEL("#{bindings.KontragentsView1.collectionModel.makeCurrent}",
                                 new Class[] { SelectionEvent.class },
                                 new Object[] { selectionEvent }); */
        /*  Row selectedRow =
           (Row)ADFUtil.evaluateEL("#{bindings.KontragentsView1Iterator.currentRow}");
         RowKeySet rks = mainTable.getDisclosedRowKeys();
        List keyList = Collections.singletonList(selectedRow.getKey());
        rks.add(keyList);  */
        /*  this.mainTable.getDisclosedRowKeys().addAll();
        AdfFacesContext.getCurrentInstance().addPartialTarget(mainTable);  */

        //keep track of (old) selected row key
        RowKeySet oldKeySet = selectionEvent.getRemovedSet();

        //until here only the row selection in the table has changed. The ADF
        //binding layer doesn't know about the row selection yet. If there is
        //uncommitted data then we don't change current row on the binding and
        //just set the table key back

        RichTable table = (RichTable) selectionEvent.getSource();

        //From the table, get the associated ADF tree binding. This handle
        //is used later to set the current row in the binding to the row
        //selected in the ADF Faces table.

        CollectionModel tableModel = (CollectionModel) table.getValue();
        JUCtrlHierBinding adfTableBinding = (JUCtrlHierBinding) tableModel.getWrappedData();

        //read the transaction state from the controller context. This way we
        //do have it easy to use this code in a bounded task flow too even if
        //the task flow doesn't share the data control instance with its parent
        ControllerContext cctx = ControllerContext.getInstance();
        if (cctx.getCurrentViewPort().isDataDirty()) {
            FacesMessage message =
                new FacesMessage(FacesMessage.SEVERITY_INFO, "Please Commit Changes",
                                 "Changes must be committed before selecting a new table row");
            FacesContext fctx = FacesContext.getCurrentInstance();
            fctx.addMessage(null, message);

            table.setSelectedRowKeys(oldKeySet);
            AdfFacesContext adfFacesCtx = AdfFacesContext.getCurrentInstance();
            //refresh table to show current selected row set back to original row.
            //Note that though we set the row back, no row selection event is fired.
            //Row selection events fire only if users select a row

            adfFacesCtx.addPartialTarget(table);
            fctx.renderResponse();
        } else {
            //Next: Make the selected table row the current row in the ADF binding
            //layer. The code below is the substitution of the default SelectionListener
            //definition JDevelopert set to #{bindings.DepartmentsVie1.makeCurrent}
            //or, put in more generic terms, #{bindings.<tree binding Id>.makeCurrent}
            JUCtrlHierNodeBinding tableRowBinding = (JUCtrlHierNodeBinding) table.getSelectedRowData();
            Row row = tableRowBinding.getRow();
            //get access to the iterator that is used by teh table binding
            DCIteratorBinding iter = adfTableBinding.getDCIteratorBinding();
            //set the row rterieved from the table as the current row
            iter.getRowSetIterator().setCurrentRow(row);
            //no need to refresh the ADF Faces table because table and binding
            //are in synch
            //this.pd_info.setDisclosed(true);
        }
    }

    private String getRks() {
        DCBindingContainer binding = (DCBindingContainer) BindingContext.getCurrent().getCurrentBindingsEntry();
        DCIteratorBinding it = binding.findIteratorBinding("KontragentsView1Iterator");
        String rks;
        if (it != null) {
            try {
                return it.getCurrentRow().getKey().toStringFormat(true);
            } catch (Exception e) {
                return null;
            }
        }
        return null;
    }

    public void refresh() {
        DCBindingContainer binding = (DCBindingContainer) BindingContext.getCurrent().getCurrentBindingsEntry();
        DCIteratorBinding it = binding.findIteratorBinding("KontragentsView1Iterator");
        String rks;
        DCIteratorBinding it_detail = binding.findIteratorBinding("ContactDetailsView2Iterator");
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
                RowIterator rIter = it_detail.findRowsByAttributeValue("KontragId", true, masterId);
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
    }

    private void setIsBuyer() {
        DCBindingContainer bd = (DCBindingContainer) BindingContext.getCurrent().getCurrentBindingsEntry();
        DCIteratorBinding it = bd.findIteratorBinding("KontragentsView1Iterator");
        Row currRow = it.getCurrentRow();

        currRow.setAttribute("IsBuyer", new Integer(1));
    }

    private void setParentId() {

        DCBindingContainer bd = (DCBindingContainer) BindingContext.getCurrent().getCurrentBindingsEntry();
        DCIteratorBinding it = bd.findIteratorBinding("KontragentsView1Iterator");
        Row currRow = it.getCurrentRow();
        BindingContainer binding = BindingContext.getCurrent().getCurrentBindingsEntry();
        OperationBinding oper = (OperationBinding) binding.getOperationBinding("retrieveCustomersFirstParentId");
        String res = (String) oper.execute();
        currRow.setAttribute("ParentId", res);

    }

    public String commitChange() {
        this.setParentId();
        this.setIsBuyer();
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
        String rks = getRks();
        BindingContainer binding = BindingContext.getCurrent().getCurrentBindingsEntry();
        OperationBinding ob = binding.getOperationBinding("Rollback");
        ob.execute();
        //refresh();
        DCBindingContainer it_binding = (DCBindingContainer) BindingContext.getCurrent().getCurrentBindingsEntry();
        DCIteratorBinding it = it_binding.findIteratorBinding("KontragentsView1Iterator");
        it.executeQuery();
        DCIteratorBinding it_detail = it_binding.findIteratorBinding("ContactDetailsView2Iterator");
        if (rks != null) {
            try {
                String rks1 = it.getCurrentRow().getKey().toStringFormat(true);
            } catch (Exception e) {
                rks = null;
            }
            if (rks != null) {
                try {
                    it.setCurrentRowWithKey(rks);
                    Row masterRow = it.getCurrentRow();
                    String masterId = (String) masterRow.getAttribute("Id");
                    it_detail.executeQuery();
                    RowIterator rIter = it_detail.findRowsByAttributeValue("KontragId", true, masterId);
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
                } catch (Exception e) {
                    // TODO: Add catch code
                    e.printStackTrace();
                }
            }
        }
        return null;
    }

    public void setFormToRefresh(RichPanelFormLayout formToRefresh) {
        this.formToRefresh = formToRefresh;
    }

    public RichPanelFormLayout getFormToRefresh() {
        return formToRefresh;
    }

    public String refreshForm() {
        DCBindingContainer binding = (DCBindingContainer) BindingContext.getCurrent().getCurrentBindingsEntry();
        DCIteratorBinding it = binding.findIteratorBinding("ContactDetailsView2Iterator");

        String currRowKey = it.getCurrentRowKeyString();
        Row currRow = it.findRowByKeyString(currRowKey);

        if (currRow != null) {
            currRow.refresh(Row.REFRESH_UNDO_CHANGES);
            it.setCurrentRowWithKey(currRowKey);
        }

        AdfFacesContext.getCurrentInstance().addPartialTarget(this.getFormToRefresh());

        return null;
    }

    public DnDAction dropHandler(DropEvent dropEvent) {
        RichTable table = (RichTable) dropEvent.getDragComponent();
        RowKeySet droppedValue = null;
        String KonId = null;
        Iterator it = null;
        RichTree tree = (RichTree) dropEvent.getDropComponent();
        Object currentRowKey = tree.getRowKey();
        List dropRowKey = (List) dropEvent.getDropSite();
        if (dropRowKey == null) {
            return DnDAction.NONE;
        }
        try {
            DataFlavor<RowKeySet> df = DataFlavor.getDataFlavor(RowKeySet.class, "rowcopy");
            droppedValue = dropEvent.getTransferable().getData(df);
            if (droppedValue != null) {
                it = droppedValue.iterator();
                if (it.hasNext()) {
                    List key = (List) it.next();
                    table.setRowKey(key);
                    JUCtrlHierNodeBinding rowBinding = (JUCtrlHierNodeBinding) table.getRowData();
                    Row tableRow = (Row) rowBinding.getRow();
                    KonId = (String) tableRow.getAttribute("Id");

                    tree.setRowKey(dropRowKey);
                    JUCtrlHierNodeBinding dropNode = (JUCtrlHierNodeBinding) tree.getRowData();
                    //Row treeRow = dropNode.getRow();
                    String dropNodeVO = dropNode.getHierTypeBinding().getStructureDefName();
                    if (!dropNodeVO.equalsIgnoreCase("ua.divas.view.ro.CompaignsView1")) {
                        return DnDAction.NONE;
                    }

                    tree.setRowKey(currentRowKey);
                    CollectionModel treeModel = (CollectionModel) tree.getValue();
                    JUCtrlHierBinding treeBinding = (JUCtrlHierBinding) treeModel.getWrappedData();

                    JUCtrlHierNodeBinding treeDropNode = treeBinding.findNodeByKeyPath(dropRowKey);
                    JUCtrlHierNodeBinding rootNode = treeBinding.getRootNodeBinding();
                    JUCtrlHierNodeBinding dropNodeParent = treeDropNode.getParent();

                    //walk up the tree to expand all parent nodes
                    if (treeDropNode != null && treeDropNode != rootNode) {
                        RowKeySet drk = tree.getDisclosedRowKeys();
                        if (drk != null) {
                            drk.clear();
                            AdfFacesContext.getCurrentInstance().addPartialTarget(tree);
                        }
                        RowKeySetImpl rksImpl = new RowKeySetImpl();
                        rksImpl.add(dropRowKey);
                        String CompId = (String) treeDropNode.getRow().getAttribute("Id");
                        BindingContainer binding = BindingContext.getCurrent().getCurrentBindingsEntry();
                        OperationBinding oper =
                            (OperationBinding) binding.getOperationBinding("addKonragentToCallList");
                        oper.getParamsMap().put("KonId", KonId);
                        oper.getParamsMap().put("CompId", CompId);
                        oper.execute();
                        //walk up the tree to expand all parent nodes
                        while (dropNodeParent != null && dropNodeParent != rootNode) {
                            rksImpl.add(dropNodeParent.getKeyPath());
                            dropNodeParent = dropNodeParent.getParent();
                        }
                        //3. get all employee nodes in a tree to disclose them too
                        ArrayList<JUCtrlHierNodeBinding> childList =
                            (ArrayList<JUCtrlHierNodeBinding>) treeDropNode.getChildren();
                        for (JUCtrlHierNodeBinding nb : childList) {
                            rksImpl.add(nb.getKeyPath());
                        }
                        //ready to disclose
                        tree.setDisclosedRowKeys(rksImpl);
                        AdfFacesContext.getCurrentInstance().addPartialTarget(tree);

                    } else {
                        return DnDAction.NONE;
                    }
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
            return DnDAction.NONE;
        }
        return DnDAction.COPY;
    }

    private void expandTree(RichTree soTreeTableBind) {

        RowKeySet disclosedTreeRowKeySet = new RowKeySetImpl();
        CollectionModel model = (CollectionModel) soTreeTableBind.getValue();
        JUCtrlHierBinding treeBinding = (JUCtrlHierBinding) model.getWrappedData();
        JUCtrlHierNodeBinding rootNode = treeBinding.getRootNodeBinding();
        disclosedTreeRowKeySet = soTreeTableBind.getDisclosedRowKeys();
        if (disclosedTreeRowKeySet == null) {
            disclosedTreeRowKeySet = new RowKeySetImpl();
        }
        List<JUCtrlHierNodeBinding> firstLevelChildren = rootNode.getChildren();
        for (JUCtrlHierNodeBinding node : firstLevelChildren) {
            ArrayList list = new ArrayList();
            list.add(node.getRowKey());
            disclosedTreeRowKeySet.add(list);
            //expandTreeChildrenNode(soTreeTableBind, node, list);
        }
        soTreeTableBind.setDisclosedRowKeys(disclosedTreeRowKeySet);
    }


    public DnDAction dropTableHandler(DropEvent dropEvent) {
        RichTree tree = (RichTree) dropEvent.getDragComponent();
        DataFlavor<RowKeySet> df = DataFlavor.getDataFlavor(RowKeySet.class, "rowmove");
        RowKeySet droppedValue = dropEvent.getTransferable().getData(df);

        List dropRowKey = (List) dropEvent.getDropSite();
        if (dropRowKey == null) {
            return DnDAction.NONE;
        }

        if (droppedValue != null) {
            Iterator it = droppedValue.iterator();
            if (it.hasNext()) {
                List key = (List) it.next();
                tree.setRowKey(key);
                JUCtrlHierNodeBinding rowBinding = (JUCtrlHierNodeBinding) tree.getRowData();
                Row treeRow = (Row) rowBinding.getRow();

                CollectionModel treeModel = (CollectionModel) tree.getValue();

                JUCtrlHierBinding treeBinding = (JUCtrlHierBinding) treeModel.getWrappedData();
                JUCtrlHierNodeBinding treeDragNode = treeBinding.findNodeByKeyPath(key);
                JUCtrlHierNodeBinding rootNode = treeBinding.getRootNodeBinding();
                JUCtrlHierNodeBinding dragNodeParent = treeDragNode.getParent();
                if (dragNodeParent.getParent() == null || treeDragNode == rootNode) {
                    return DnDAction.NONE;
                }
                String KonId = (String) treeRow.getAttribute("Id");
                BindingContainer binding = BindingContext.getCurrent().getCurrentBindingsEntry();
                OperationBinding oper = (OperationBinding) binding.getOperationBinding("removeKonragentFromCallList");
                oper.getParamsMap().put("KonId", KonId);
                oper.execute();
                //treeRow.remove();
                if (treeDragNode != null && treeDragNode != rootNode) {
                    /* RowKeySet drk = tree.getDisclosedRowKeys();
                    if (drk != null) {
                        drk.clear();
                        AdfFacesContext.getCurrentInstance().addPartialTarget(tree);
                    }
                       RowKeySetImpl rksImpl = new RowKeySetImpl();
                    //rksImpl.add(key);
                    while (dragNodeParent != null && dragNodeParent != rootNode) {
                        rksImpl.add(dragNodeParent.getKeyPath());
                        dragNodeParent = dragNodeParent.getParent();
                    }
                    ArrayList<JUCtrlHierNodeBinding> childList = treeDragNode.getChildren();
                    if (childList != null) {
                        for (JUCtrlHierNodeBinding nb : childList) {
                            rksImpl.add(nb.getKeyPath());
                        }
                    }
                    tree.setDisclosedRowKeys(rksImpl);   */



                    //this.setTree((RichTree) tree.getParent());
                    //this.onRefreshTree();
                    tree.getDisclosedRowKeys().clear();
                    //expandTree(tree);
                    AdfFacesContext.getCurrentInstance().addPartialTarget(tree.getParent());

                }
                //AdfFacesContext.getCurrentInstance().addPartialTarget(tree.getParent());
            }
        }

        return DnDAction.MOVE;
    }

    public void onPoll(PollEvent pollEvent) {
        ADFContext adfCtx = ADFContext.getCurrent();
        Map pageFlowScope = adfCtx.getPageFlowScope();
        Object val = pageFlowScope.get("KontragId"); //Name = PageFlowScope value name

        if (val == null) { //Avoid null pointer exception
            DCBindingContainer binding = (DCBindingContainer) BindingContext.getCurrent().getCurrentBindingsEntry();
            DCIteratorBinding it = binding.findIteratorBinding("KontragentsView1Iterator");
            it.executeQuery();
        }
    }

    public void onAddReturn(ReturnEvent returnEvent) {
        System.out.println("Return value " + returnEvent.getReturnValue());
        DCBindingContainer binding = (DCBindingContainer) BindingContext.getCurrent().getCurrentBindingsEntry();
        DCIteratorBinding it = binding.findIteratorBinding("KontragentsView1Iterator");
        it.executeQuery();
    }

    public void afterListener() {
        System.out.println("After listener called ");
        BindingContext bindingContext = BindingContext.getCurrent();
        DCDataControl dc =
            bindingContext.findDataControl("AppModuleDataControl"); // Name of application module in datacontrolBinding.cpx
        AppModuleImpl am = (AppModuleImpl) dc.getDataProvider();
        am.getKontragentsView1().executeQuery();
    }

    public void LogFetshListener(PopupFetchEvent popupFetchEvent) {
        BindingContainer binding = BindingContext.getCurrent().getCurrentBindingsEntry();
        OperationBinding ob = binding.getOperationBinding("CreateInsert2");
        ob.execute();
    }

    public void onReturnValue(ReturnEvent returnEvent) {
        refresh();
        System.out.println("On return called ");
    }

    public void setDel_title(String del_title) {
        this.del_title = del_title;
    }

    public String getDel_title() {
        DCBindingContainer bd = (DCBindingContainer) BindingContext.getCurrent().getCurrentBindingsEntry();
        DCIteratorBinding it = bd.findIteratorBinding("KontragentsView1Iterator");
        Row currRow = it.getCurrentRow();
        Integer Del = (Integer) currRow.getAttribute("Deleted");
        String RetStr = null;
        if (Del == 0) {
            RetStr = "Вы хотите пометить объект на удаление?";
        } else {
            RetStr = "Вы хотите снять пометку на удаление?";
        }
        return RetStr;
    }

    public void setDel_style(String del_style) {
        this.del_style = del_style;
    }

    public String getDel_style() {
        DCBindingContainer bd = (DCBindingContainer) BindingContext.getCurrent().getCurrentBindingsEntry();
        DCIteratorBinding it = bd.findIteratorBinding("KontragentsView1Iterator");
        Row currRow = it.getCurrentRow();
        Integer Del = (Integer) currRow.getAttribute("Deleted");
        String RetStr = null;
        if (Del == 0) {
            RetStr = "font-size:large; Color : Red;";
        } else {
            RetStr = "font-size:large;";
        }
        return RetStr;
    }

    public void setDel_label(String del_label) {
        this.del_label = del_label;
    }

    public String getDel_label() {
        DCBindingContainer bd = (DCBindingContainer) BindingContext.getCurrent().getCurrentBindingsEntry();
        DCIteratorBinding it = bd.findIteratorBinding("KontragentsView1Iterator");
        Row currRow = it.getCurrentRow();
        Integer Del = (Integer) currRow.getAttribute("Deleted");
        String RetStr = null;
        if (Del == 0) {
            RetStr = "Пометить на удаление";
        } else {
            RetStr = "Снять пометку на удаление";
        }
        return RetStr;
    }

    public void onDeleteDialog(DialogEvent dialogEvent) {
        if (dialogEvent.getOutcome().name().equals("ok")) {
            DCBindingContainer bd = (DCBindingContainer) BindingContext.getCurrent().getCurrentBindingsEntry();
            DCIteratorBinding it = bd.findIteratorBinding("KontragentsView1Iterator");
            Row currRow = it.getCurrentRow();
            Integer Del = (Integer) currRow.getAttribute("Deleted");
            if (Del == 0) {
                BindingContainer binding = BindingContext.getCurrent().getCurrentBindingsEntry();
                OperationBinding ob = binding.getOperationBinding("Delete");
                ob.execute();
            } else {
                currRow.setAttribute("Deleted", 0);
            }
            commitChange();
        }
    }

    public void onSelectListView(SelectionEvent selectionEvent) {
        String adfSelectionListener = "#{bindings.OrdersViewKontragent.treeModel.makeCurrent}";
        FacesContext fctx = FacesContext.getCurrentInstance();
        Application application = fctx.getApplication();
        ELContext elCtx = fctx.getELContext();
        ExpressionFactory exprFactory = application.getExpressionFactory();

        MethodExpression me = null;
        me = exprFactory.createMethodExpression(elCtx, adfSelectionListener, Object.class, new Class[] {
                                                SelectionEvent.class });
        me.invoke(elCtx, new Object[] { selectionEvent });

        RichListView list1 = this.getList();
        RowKeySet rks2 = list1.getSelectedRowKeys();
        Iterator rksIterator = rks2.iterator();

        if (rksIterator.hasNext()) {
            List key = (List) rksIterator.next();
            JUCtrlHierBinding treeBinding = null;
            treeBinding = (JUCtrlHierBinding) ((CollectionModel) list1.getValue()).getWrappedData();
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
            if (keyStr != null && rowType.matches("OrdersView")) {
                DCIteratorBinding iter = (DCIteratorBinding) getBindings().get("OrdersView1Iterator");
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

    public void setList(RichListView list) {
        this.list = list;
    }

    public RichListView getList() {
        return list;
    }

    public void onItem(ItemEvent itemEvent) {
        refresh();
    }

    public void generateExcel(FacesContext facesContext, OutputStream outputStream) {
        try {
            HSSFWorkbook workbook = new HSSFWorkbook();
            HSSFSheet worksheet = workbook.createSheet("Контакты");
            DCBindingContainer bindings = (DCBindingContainer) BindingContext.getCurrent().getCurrentBindingsEntry();
            DCIteratorBinding dcIteratorBindings = bindings.findIteratorBinding("KontragentsRep1Iterator");
            HSSFRow excelrow = null;

            // Get all the rows of a iterator
            oracle.jbo.Row[] rows = dcIteratorBindings.getAllRowsInRange();
            int i = 0;
            for (oracle.jbo.Row row : rows) {
                Integer buyer = (Integer)row.getAttribute("IsBuyer");
                if (buyer != 1 ) continue;
                //print header on first row in excel
                if (i == 0) {
                    excelrow = (HSSFRow) worksheet.createRow((short) i);
                    short j = 0;
                    for (String colName : row.getAttributeNames()) {
                        HSSFCell cellA1 = excelrow.createCell((short) j);
                        if (colName.equalsIgnoreCase("Fullname")) {
                            cellA1.setCellValue("Ф.И.О.");
                        }
                        if (colName.equalsIgnoreCase("Adress")) {
                            cellA1.setCellValue("Адрес");
                        }
                        if (colName.equalsIgnoreCase("Phone")) {
                            cellA1.setCellValue("Телефон");
                        }
                        if (colName.equalsIgnoreCase("Email")) {
                            cellA1.setCellValue("Почта");
                        }
                        j++;
                    }
                }
                //print data from second row in excel
                ++i;
                short j = 0;
                excelrow = worksheet.createRow((short) i);
                for (String colName : row.getAttributeNames()) {
                    //System.out.println("hello " + row.getAttribute(colName));
                    //System.out.println("hello " + colName);
                    HSSFCell cell = excelrow.createCell(j);
                    /* if (null != row.getAttribute(colName)) {
                        cell.setCellValue(row.getAttribute(colName).toString());
                    } */
                    if (colName.equalsIgnoreCase("Fullname")) {
                        cell.setCellValue(row.getAttribute(colName).toString());
                    }
                    if (colName.equalsIgnoreCase("Adress")) {
                        if (null != row.getAttribute(colName)) {
                            cell.setCellValue(row.getAttribute(colName).toString());
                        }
                    }
                    if (colName.equalsIgnoreCase("Phone")) {
                        if (null != row.getAttribute(colName)) {
                            cell.setCellValue(row.getAttribute(colName).toString());
                        }
                    }
                    if (colName.equalsIgnoreCase("Email")) {
                        if (null != row.getAttribute(colName)) {
                            cell.setCellValue(row.getAttribute(colName).toString());
                        }
                    }
                    //cell.setCellValue("Rакая-то херня");
                    j++;

                }
                worksheet.createFreezePane(0, 1, 0, 1);
                worksheet.autoSizeColumn(0);
                worksheet.autoSizeColumn(1);
                worksheet.autoSizeColumn(2);
                worksheet.autoSizeColumn(3);
            }

            workbook.write(outputStream);
            outputStream.flush();
        } catch (Exception e) {
            // TODO: Add catch code
            e.printStackTrace();
        }


    }
    
    public void onPdf(ActionEvent actionEvent) {
        FacesContext ctx = FacesContext.getCurrentInstance();
        FacesMessage msg = new FacesMessage(FacesMessage.SEVERITY_INFO, "Infirmation", "Функция ещё не реализована!");
        ctx.addMessage(null, msg);
    }
    
    public void generatePdf(FacesContext facesContext, OutputStream outputStream) {
        try {
            HttpServletRequest request =
                        (HttpServletRequest)facesContext.getExternalContext().getRequest();
            String requestUrl = request.getRequestURL().toString();
            String contextRoot = facesContext.getExternalContext().getRequestContextPath();
            String fontUrl = requestUrl.substring(0, requestUrl.lastIndexOf(contextRoot))+contextRoot+"/fonts/times.ttf";
            //String rqPath =
            //    ((HttpServletRequest) facesContext.getExternalContext().getRequest()).getRealPath("/fonts/times.ttf");
            //System.out.println("path: " + rqPath);
            //String urlPath = facesContext.getExternalContext().getRequestContextPath()+"/fonts/times.ttf";
            System.out.println("URL: " + fontUrl);
            InputStream is = (new URL(fontUrl)).openStream();
            byte[] bytes = ByteStreams.toByteArray(is);
            BaseFont bf = BaseFont.createFont("times.ttf", BaseFont.IDENTITY_H, BaseFont.EMBEDDED, false, bytes, null);
            Font font = new Font(bf, 14);
            Font fontc = new Font(bf, 12);
            Font fontm = new Font(bf, 10);
            Document document = new Document(PageSize.A4);
            PdfWriter.getInstance(document, outputStream);
            document.open();
            document.addAuthor("Divas CRM, Copyright by BMExpert");
            document.addCreator("Divas CRM, Copyright by BMExpert");
            document.addSubject("Exported buyer's contacts from Divas CRM");
            Paragraph preface = new Paragraph();
            Chapter chapter1 = new Chapter(preface, 1);
            chapter1.setNumberDepth(0);
            Paragraph title = new Paragraph("Список контактов", fontc);
            /* Chunk ch = new Chunk("Список контактов", fontc);
            document.add(ch);
            document.add(Chunk.NEWLINE); */
            Section section1 = chapter1.addSection(title);
            section1.setNumberDepth(0);
            // Start a new page
            //document.newPage();
            DCBindingContainer bindings = (DCBindingContainer) BindingContext.getCurrent().getCurrentBindingsEntry();
            DCIteratorBinding dcIteratorBindings = bindings.findIteratorBinding("KontragentsRep1Iterator");
            oracle.jbo.Row[] rows = dcIteratorBindings.getAllRowsInRange();
            PdfPTable table = new PdfPTable(rows[0].getAttributeCount() - 1);
            table.setSpacingBefore(10);
            int i = 0;
            for (oracle.jbo.Row row : rows) {
                Integer buyer = (Integer)row.getAttribute("IsBuyer");
                if (buyer != 1 ) continue;
                if (i == 0) {
                    for (String colName : row.getAttributeNames()) {
                        //PdfPCell c = new PdfPCell(new Phrase("Билиберда",fontc));
                        //table.addCell(c);
                        if (colName.equalsIgnoreCase("Fullname")) {
                            PdfPCell c1 = new PdfPCell(new Phrase("Ф.И.О.", fontc));
                            c1.setHorizontalAlignment(Element.ALIGN_CENTER);
                            table.addCell(c1);
                        }
                        if (colName.equalsIgnoreCase("Adress")) {
                            PdfPCell c2 = new PdfPCell(new Phrase("Адрес", fontc));
                            c2.setHorizontalAlignment(Element.ALIGN_CENTER);
                            table.addCell(c2);
                        }
                        if (colName.equalsIgnoreCase("Phone")) {
                            PdfPCell c3 = new PdfPCell(new Phrase("Телефон", fontc));
                            c3.setHorizontalAlignment(Element.ALIGN_CENTER);
                            table.addCell(c3);
                        }
                        if (colName.equalsIgnoreCase("Email")) {
                            PdfPCell c4 = new PdfPCell(new Phrase("Почта", fontc));
                            c4.setHorizontalAlignment(Element.ALIGN_CENTER);
                            table.addCell(c4);
                        }
                    }
                    //table.setHeaderRows(1);
                }
                i++;
                for (String colName : row.getAttributeNames()) {
                    if (colName.equalsIgnoreCase("IsBuyer")) {
                        continue;
                    }
                    if (row.getAttribute(colName) != null) {
                        table.addCell(new Phrase(row.getAttribute(colName).toString(), fontm));
                    } else {
                        table.addCell("");
                    }
                }
            }
            section1.add(table);
            document.add(section1);
            //document.newPage();
            document.close();
            outputStream.flush();
        } catch (Exception e) {
            // TODO: Add catch code
            e.printStackTrace();
        }

    }
}
