package ua.divas.view;

import java.util.HashMap;
import java.util.Map;

import oracle.jbo.server.ViewObjectImpl;

import org.codehaus.groovy.runtime.InvokerHelper;

import ua.divas.classes.DivasView;
// ---------------------------------------------------------------------
// ---    File generated by Oracle ADF Business Components Design Time.
// ---    Thu Nov 19 19:35:11 EET 2015
// ---    Custom code may be added to this class.
// ---    Warning: Do not modify method signatures of generated methods.
// ---------------------------------------------------------------------
public class VwKontragSupplierNewImpl extends DivasView {
    /**
     * This is the default constructor (do not remove).
     */
    public VwKontragSupplierNewImpl() {
    }

    /**
     * Returns the bind variable value for u_name.
     * @return bind variable value for u_name
     */
    public String getu_name() {
        return (String) getNamedWhereClauseParam("u_name");
    }

    /**
     * Sets <code>value</code> for bind variable u_name.
     * @param value value to bind as u_name
     */
    public void setu_name(String value) {
        setNamedWhereClauseParam("u_name", value);
    }

    /**
     * Returns the variable value for k_name.
     * @return variable value for k_name
     */
    public String getk_name() {
        return (String) ensureVariableManager().getVariableValue("k_name");
    }

    /**
     * Sets <code>value</code> for variable k_name.
     * @param value value to bind as k_name
     */
    public void setk_name(String value) {
        ensureVariableManager().setVariableValue("k_name", value);
    }

    private class AgrFuncHelper extends HashMap {
        private static final long serialVersionUID = 1L;
        private String funcName;

        public AgrFuncHelper(String funcName) {
            super();
            this.funcName = funcName;
        }


        public Object get(Object key) {
            //Invoke private method
            //of our DefaultRowSet (sum,count,avg,min,max)
            //key is argument expression for the aggr funcion being called
            //sum("Salary")

            return InvokerHelper.invokeMethod(getDefaultRowSet(), funcName, key);
        }


    }
    
    public Map getSum() {
        return new AgrFuncHelper("sum");
    }

    public Map getCount() {
        return new AgrFuncHelper("count");
    }
}

