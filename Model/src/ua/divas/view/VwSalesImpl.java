package ua.divas.view;

import java.sql.SQLException;

import java.sql.Timestamp;

import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;

import oracle.jbo.Row;
import oracle.jbo.domain.Date;
import oracle.jbo.server.ViewObjectImpl;

import oracle.jbo.server.ViewRowSetImpl;

import org.codehaus.groovy.runtime.InvokerHelper;

import ua.divas.classes.DivasView;
// ---------------------------------------------------------------------
// ---    File generated by Oracle ADF Business Components Design Time.
// ---    Sun Mar 29 22:11:23 EEST 2015
// ---    Custom code may be added to this class.
// ---    Warning: Do not modify method signatures of generated methods.
// ---------------------------------------------------------------------
public class VwSalesImpl extends DivasView {
    /**
     * This is the default constructor (do not remove).
     */
    public VwSalesImpl() {
    }
    
    public java.sql.Timestamp getDateLast1() throws SQLException {
        Calendar calendar = Calendar.getInstance();
        //calendar.set(Calendar.DAY_OF_MONTH, calendar.getActualMinimum(Calendar.DAY_OF_MONTH)); // это будет начало месяца
        //calendar.set(Calendar.DAY_OF_MONTH, calendar.getActualMaximum(Calendar.DAY_OF_MONTH)); // это будет конец месяца
        //calendar.set(Calendar.DAY_OF_YEAR, calendar.getActualMaximum(Calendar.DAY_OF_YEAR)); // это будет конец года
        //calendar.set(Calendar.DAY_OF_YEAR, calendar.getActualMinimum(Calendar.DAY_OF_YEAR)); // это будет начало года
        calendar.set(1970, Calendar.JANUARY, 01);
        java.util.Date pDate = calendar.getTime();
        java.sql.Timestamp dbDate= new java.sql.Timestamp(pDate.getTime());
        //oracle.jbo.domain.Date time = new oracle.jbo.domain.Date(pDate);
        return dbDate;
    }
    
    public Date getDateLast() throws SQLException {
        Calendar calendar = Calendar.getInstance();
        calendar.set(Calendar.DAY_OF_MONTH, calendar.getActualMinimum(Calendar.DAY_OF_MONTH)); // это будет начало месяца
        //calendar.set(Calendar.DAY_OF_MONTH, calendar.getActualMaximum(Calendar.DAY_OF_MONTH)); // это будет конец месяца
        //calendar.set(Calendar.DAY_OF_YEAR, calendar.getActualMaximum(Calendar.DAY_OF_YEAR)); // это будет конец года
        //calendar.set(Calendar.DAY_OF_YEAR, calendar.getActualMinimum(Calendar.DAY_OF_YEAR)); // это будет начало года
        java.util.Date pDate = calendar.getTime();
        oracle.jbo.domain.Date dbDate= new oracle.jbo.domain.Date(new java.sql.Date(pDate.getTime()));
        //oracle.jbo.domain.Date time = new oracle.jbo.domain.Date(pDate);
        return dbDate;
    }
    
    public String getCompleteStatus() {
        ViewObjectImpl vo = (ViewObjectImpl) this.getRootApplicationModule().findViewObject("OrderStatusView1");
        ViewRowSetImpl rs =
            (ViewRowSetImpl) vo
            .findByViewCriteria(vo.getViewCriteria("FilterOrderStatusComplete"), -1, vo.QUERY_MODE_SCAN_DATABASE_TABLES);
        Row row = rs.first();
        if (row != null) {
            String rv = (String) row.getAttribute("Id");
            return rv;
        }
        return null;
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
     * Returns the variable value for s_dat.
     * @return variable value for s_dat
     */
    public Timestamp gets_dat() {
        return (Timestamp) ensureVariableManager().getVariableValue("s_dat");
    }

    /**
     * Sets <code>value</code> for variable s_dat.
     * @param value value to bind as s_dat
     */
    public void sets_dat(Timestamp value) {
        ensureVariableManager().setVariableValue("s_dat", value);
    }

    /**
     * Returns the variable value for f_dat.
     * @return variable value for f_dat
     */
    public Timestamp getf_dat() {
        return (Timestamp) ensureVariableManager().getVariableValue("f_dat");
    }

    /**
     * Sets <code>value</code> for variable f_dat.
     * @param value value to bind as f_dat
     */
    public void setf_dat(Timestamp value) {
        ensureVariableManager().setVariableValue("f_dat", value);
    }

    /**
     * Returns the variable value for u_status_complete.
     * @return variable value for u_status_complete
     */
    public String getu_status_complete() {
        return (String) ensureVariableManager().getVariableValue("u_status_complete");
    }

    /**
     * Sets <code>value</code> for variable u_status_complete.
     * @param value value to bind as u_status_complete
     */
    public void setu_status_complete(String value) {
        ensureVariableManager().setVariableValue("u_status_complete", value);
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

