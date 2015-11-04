package ua.divas.bean.control;

import java.io.Serializable;

import oracle.binding.AttributeContext;
import oracle.binding.RowContext;

public class DataPackage {
    private Object dataObject;

    public void setDataObject(Object dataObject) {
        this.dataObject = dataObject;
    }

    public Object getDataObject() {
        return dataObject;
    }

    public void initializeDataObject(Object dataObject) {
        System.out.println("IN: " + dataObject);
        this.setDataObject(dataObject);
    }

    public Serializable createSnapshot() {
        return null;
    }

    public void restoreSnapshot(Serializable p0) {
    }

    public void removeSnapshot(Serializable p0) {
    }

    public boolean isTransactionDirty() {
        return false;
    }

    public void rollbackTransaction() {
    }

    public void commitTransaction() {
    }

    public boolean setAttributeValue(AttributeContext p0, Object p1) {
        return false;
    }

    public Object createRowData(RowContext p0) {
        return null;
    }

    public Object registerDataProvider(RowContext p0) {
        return null;
    }

    public boolean removeRowData(RowContext p0) {
        return false;
    }

    public void validate() {
    }
}
