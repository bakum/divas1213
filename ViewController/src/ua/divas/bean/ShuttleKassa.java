package ua.divas.bean;

import java.util.ArrayList;
import java.util.List;

import javax.faces.event.ValueChangeEvent;
import javax.faces.model.SelectItem;

import oracle.adf.model.BindingContext;
import oracle.adf.model.binding.DCBindingContainer;
import oracle.adf.model.binding.DCIteratorBinding;

import oracle.jbo.Row;
import oracle.jbo.RowIterator;

public class ShuttleKassa {
    List selectedValues = new ArrayList();
    List allValues = new ArrayList();

    public ShuttleKassa() {
    }

    public void setSelectedValues(List selectedValues) {
        this.selectedValues = selectedValues;
    }

    public List getSelectedValues() {
        DCBindingContainer bindings = (DCBindingContainer) BindingContext.getCurrent().getCurrentBindingsEntry();
        DCIteratorBinding dcIteratorBindings = bindings.findIteratorBinding("KassaSettingsView2Iterator");

        //DCIteratorBinding divi = bindings.findIteratorBinding("KassaView1Iterator");

        // Get all the rows of a iterator
        if (null != dcIteratorBindings) {
            Row[] rows = dcIteratorBindings.getAllRowsInRange();
            for (Row rw : rows) {
                //String indx = (String) rw.getAttribute("KassaId");
                //RowIterator rIter = divi.findRowsByAttributeValue("Id", true, indx);
                //String fn = rIter.first().getAttribute("Fullname").toString();
                String fn = rw.getAttribute("KassaName").toString();
                selectedValues.add(fn);
            }
        }
        return selectedValues;
    }

    public void setAllValues(List allValues) {
        this.allValues = allValues;
    }

    public List getAllValues() {
        DCBindingContainer bindings = (DCBindingContainer) BindingContext.getCurrent().getCurrentBindingsEntry();
        DCIteratorBinding dcIteratorBindings = bindings.findIteratorBinding("KassaView1_1Iterator");

        if (null != dcIteratorBindings) {
            // Get all the rows of a iterator
            Row[] rows = dcIteratorBindings.getAllRowsInRange();
            for (Row rw : rows) {
                String indx = (String) rw.getAttribute("Fullname");
                Integer gr = (Integer) rw.getAttribute("IsGroup");
                if (gr.intValue() == 0) {
                    allValues.add(new SelectItem(indx));
                }
            }
        }
        return allValues;
    }

    private List diff(List set1, List set2) {
        List diff = new ArrayList(set1);
        diff.removeAll(set2);
        return diff;

    }

    public void onKassaChange(ValueChangeEvent valueChangeEvent) {
        List stored = new ArrayList();
        List toAdd = new ArrayList();
        List toRemove = new ArrayList();
        ArrayList<String> divInUser = (ArrayList<String>) valueChangeEvent.getNewValue();
        if (divInUser == null) {
            divInUser = new ArrayList();
        }
        DCBindingContainer bindings = (DCBindingContainer) BindingContext.getCurrent().getCurrentBindingsEntry();
        DCIteratorBinding dcIteratorBindings = bindings.findIteratorBinding("KassaSettingsView2Iterator");
        DCIteratorBinding divi = bindings.findIteratorBinding("KassaView1_1Iterator");
        if (null != dcIteratorBindings) {
            Row[] rows = dcIteratorBindings.getAllRowsInRange();
            for (Row rw : rows) {
                //String indx = (String) rw.getAttribute("KassaId");
                //RowIterator rIter = divi.findRowsByAttributeValue("Id", true, indx);
                String fn = rw.getAttribute("KassaName").toString();
                stored.add(fn);
            }
        }
        toAdd = diff(divInUser, stored);
        toRemove = diff(stored, divInUser);

        String[] aToAdd = (String[]) toAdd.toArray(new String[toAdd.size()]);
        String[] atoRemove = (String[]) toRemove.toArray(new String[toRemove.size()]);


        DCIteratorBinding allUserIterator = (DCIteratorBinding) bindings.get("UsersView1Iterator");
        //get current row
        Row currentRow = allUserIterator.getCurrentRow();
        String userLogin = (String) currentRow.getAttribute("Id");

        //System.out.println(userLogin);
        if (null != dcIteratorBindings && null != divi) {
            if (aToAdd.length > 0) {
                for (String index : aToAdd) {
                    Row r = dcIteratorBindings.getViewObject().createRow();
                    RowIterator rIter = divi.findRowsByAttributeValue("Fullname", true, index);
                    String fn = rIter.first().getAttribute("Id").toString();
                    r.setAttribute("KassaId", fn);
                    /* BindingContainer binding = BindingContext.getCurrent().getCurrentBindingsEntry();
                OperationBinding oper =
                    (OperationBinding) binding.getOperationBinding("addUserToGroup");
                oper.getParamsMap().put("userName", userLogin);
                oper.getParamsMap().put("groupName", index);
                oper.execute();
                System.out.println(index); */
                }
            }

            if (atoRemove.length > 0) {
                for (String index : atoRemove) {
                    try {
                        RowIterator rIter = divi.findRowsByAttributeValue("Fullname", true, index);
                        String fn = rIter.first().getAttribute("Id").toString();
                        Row rw = dcIteratorBindings.findRowsByAttributeValue("KassaId", true, fn).first();
                        rw.remove();
                        System.out.println(index);
                    } catch (Exception e) {
                        // TODO: Add catch code
                        e.getMessage();
                    }
                }
            }
        }
    }
}
