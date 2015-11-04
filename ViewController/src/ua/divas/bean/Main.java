package ua.divas.bean;

import java.util.List;

import javax.el.ExpressionFactory;

import javax.el.ValueExpression;

import javax.faces.context.FacesContext;

import oracle.adf.model.BindingContext;
import oracle.adf.model.OperationBinding;

import oracle.adf.model.binding.DCBindingContainer;

import oracle.adf.model.binding.DCIteratorBinding;

import oracle.binding.BindingContainer;

import oracle.jbo.Key;
import oracle.jbo.Row;
import oracle.jbo.uicli.binding.JUCtrlHierNodeBinding;

public class Main {
    public BindingContainer getBindings() {
        return BindingContext.getCurrent().getCurrentBindingsEntry();
    }
    
    private Row getRow(String it) {
        DCBindingContainer bindings = (DCBindingContainer)getBindings();
        DCIteratorBinding iter = bindings.findIteratorBinding(it);

        //List rowKey = (List)mainTable.getSelectedRowKeys();
        //Key key = (Key)rowKey.get(0);
        String oldKey = iter.getCurrentRowKeyString();
        //Row row = iter.findRowByKeyString(key.toStringFormat(true));
        Row row = iter.findRowByKeyString(oldKey);
        return row;
    }

    
    public String getCreateEnabled() {
        
        Row row = this.getRow("KontragentsView1Iterator");
        
        BindingContainer bc = this.getBindings();
        OperationBinding ob = (OperationBinding)bc.getOperationBinding("getRowStatus");
        ob.getParamsMap().put("row", row);
        return (String)ob.execute();
    }
    
    public String getCellColor() {
        Row row = this.getRow("KontragentsView1Iterator");

        BindingContainer bc = this.getBindings();
        oracle.adf.model.OperationBinding ob =
            (oracle.adf.model.OperationBinding)bc.getOperationBinding("getRowStatusColor");
        ob.getParamsMap().put("row", row);
        String status = (String)ob.execute();

        if (status.equals("Modified")) {
            return "background-color:Red;";
        }

        else if (status.equals("New")) {
            return "background-color:Gray;";
        }

        return null;
    }
    
    /* public String getCreateEnabled() {
        
        
        BindingContainer bc = this.getBindings();
        OperationBinding ob = (OperationBinding)bc.getOperationBinding("getRowStatus");
        //ob.getParamsMap().put("row", row);
        return (String)ob.execute();
    } */
}
