package ua.divas.bean;

import javax.faces.event.ActionEvent;

import oracle.adf.view.rich.component.rich.data.RichTreeTable;
import oracle.adf.view.rich.context.AdfFacesContext;

public class KontragCalcBean {
    private RichTreeTable treeTable;

    public KontragCalcBean() {
    }

    public void setTreeTable(RichTreeTable treeTable) {
        this.treeTable = treeTable;
    }

    public RichTreeTable getTreeTable() {
        return treeTable;
    }
    
    public void refresh() {
        AdfFacesContext.getCurrentInstance().addPartialTarget(getTreeTable());
    }

    public void onRefresh(ActionEvent actionEvent) {
        refresh();
    }
}
