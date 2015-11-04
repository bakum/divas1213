package ua.divas.bean;

import oracle.adf.model.BindingContext;

import oracle.binding.BindingContainer;
import oracle.binding.OperationBinding;

public class EditPkoBean {
    private boolean visibleKontrag;

    public EditPkoBean() {
    }

    public void setVisibleKontrag(boolean visibleKontrag) {
        this.visibleKontrag = visibleKontrag;
    }

    public boolean getVisibleKontrag() {
        OperationBinding ob = getOperation();
        if (ob != null) {
            //ob.getParamsMap().put("NomId", NomId);
            String opName = (String) ob.execute();
            System.out.println(opName);
            if (!opName.equalsIgnoreCase("OTHER_PAYMENT")) {
                return true;
            }
        }
        //return visibleKontrag;
        return false;
    }

    private OperationBinding getOperation() {
        BindingContainer binding = BindingContext.getCurrent().getCurrentBindingsEntry();
        return binding.getOperationBinding("getOperationName");
    }
}
