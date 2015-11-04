package ua.divas.bean;

import oracle.adf.model.BindingContext;

import oracle.binding.BindingContainer;
import oracle.binding.OperationBinding;

public class EditRkoBean {
    private boolean visibleKontrag;
    private boolean visibleKassa;
    private String kassaLabel;

    public EditRkoBean() {
    }


    public void setVisibleKontrag(boolean visibleKontrag) {
        this.visibleKontrag = visibleKontrag;
    }
    
    private OperationBinding getOperation(){
        BindingContainer binding = BindingContext.getCurrent().getCurrentBindingsEntry();
        return binding.getOperationBinding("getOperationName");
    }

    public boolean getVisibleKontrag() {
        OperationBinding ob = getOperation();
        if (ob != null) {
            //ob.getParamsMap().put("NomId", NomId);
            String opName = (String) ob.execute();
            System.out.println(opName);
            if (!opName.equalsIgnoreCase("OTHER_PAYMENT")) {
                if (!opName.equalsIgnoreCase("MOVE_KASSA")) {
                    return true;
                }
            }
        }
        //return visibleKontrag;
        return false;
    }

    public void setVisibleKassa(boolean visibleKassa) {
        this.visibleKassa = visibleKassa;
    }

    public boolean getVisibleKassa() {
        OperationBinding ob = getOperation();
        if (ob != null) {
            //ob.getParamsMap().put("NomId", NomId);
            String opName = (String) ob.execute();
            System.out.println(opName);
            if (opName.equalsIgnoreCase("MOVE_KASSA")) {
                return true;
            }
        }
        //return visibleKassa;
        return false;
    }

    public void setKassaLabel(String kassaLabel) {
        this.kassaLabel = kassaLabel;
    }

    public String getKassaLabel() {
        OperationBinding ob = getOperation();
        if (ob != null) {
            //ob.getParamsMap().put("NomId", NomId);
            String opName = (String) ob.execute();
            System.out.println(opName);
            if (opName.equalsIgnoreCase("MOVE_KASSA")) {
                return "Касса отправитель";
            }
        }
        return "Касса";
    }
}
