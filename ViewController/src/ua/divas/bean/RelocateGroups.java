package ua.divas.bean;

import java.util.ArrayList;

import javax.faces.event.ValueChangeEvent;

import oracle.adf.model.BindingContext;

import oracle.adf.model.binding.DCIteratorBinding;

import oracle.binding.BindingContainer;

import oracle.jbo.Row;
import oracle.jbo.RowSetIterator;
import oracle.jbo.uicli.binding.JUCtrlListBinding;

public class RelocateGroups {
    private String[] selectedIndxs;
    private ArrayList<String> selectedIndxList;

    public RelocateGroups() {
    }

    public void setSelectedIndxs(String[] selectedIndxs) {
        this.selectedIndxs = selectedIndxs;
    }

    public String[] getSelectedIndxs() {
        selectedIndxs = null;
        selectedIndxList = new ArrayList<String>();
        BindingContext bctx = BindingContext.getCurrent();
        BindingContainer bindings = bctx.getCurrentBindingsEntry();
        //get all employees for the current selected department
        DCIteratorBinding groupsInUserDciter = (DCIteratorBinding) bindings.get("GroupmembersView5Iterator");
        RowSetIterator rsi = groupsInUserDciter.getRowSetIterator();
        //get access to        the "allEmployees" list binding
        JUCtrlListBinding allGroupsList = (JUCtrlListBinding) bindings.get("GroupsView1");
        DCIteratorBinding allGroupsIter = allGroupsList.getDCIteratorBinding();
        while (rsi.hasNext()) {
            Row rw = (Row) rsi.next();
            String indx = (String) rw.getAttribute("GName");
            /* allGroupsIter.setCurrentRowWithKey(rw.getKey().toStringFormat(true));
            int indx = allGroupsIter.getCurrentRowIndexInRange(); */
            selectedIndxList.add(indx);
        }
        selectedIndxs = selectedIndxList.toArray(new String[selectedIndxList.size()]);
        return selectedIndxs;
    }

    public void onGroupChange(ValueChangeEvent valueChangeEvent) {
        ArrayList<String> groupsInUser = (ArrayList<String>) valueChangeEvent.getNewValue();
        String[] giu = groupsInUser.toArray(new String[groupsInUser.size()]);
        BindingContext bctx = BindingContext.getCurrent();
        BindingContainer bindings = bctx.getCurrentBindingsEntry();
        DCIteratorBinding allUserIterator = (DCIteratorBinding) bindings.get("UsersView1Iterator");
        //get current row
        Row currentRow = allUserIterator.getCurrentRow();
        String userLogin = (String) currentRow.getAttribute("Login");
        if (giu.length > 0) {
            for (String index : giu) {

            }
        }
    }
}
