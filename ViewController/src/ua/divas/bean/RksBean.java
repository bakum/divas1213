package ua.divas.bean;

import oracle.adf.view.rich.component.rich.input.RichInputListOfValues;
import oracle.adf.view.rich.context.AdfFacesContext;

import org.apache.myfaces.trinidad.model.RowKeySet;
import org.apache.myfaces.trinidad.model.RowKeySetImpl;

public class RksBean {
    RowKeySet rks = new RowKeySetImpl(true);
    RowKeySet log = new RowKeySetImpl(true);

    public void setLog(RowKeySet log) {
        this.log = log;
    }

    public RowKeySet getLog() {
        return log;
    }

    public void setRks(RowKeySet rks) {
        this.rks = rks;
    }

    public RowKeySet getRks() {
        return rks;
    }


}
