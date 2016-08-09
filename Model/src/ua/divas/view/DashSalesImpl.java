package ua.divas.view;

import java.sql.SQLException;
import java.sql.Timestamp;

import java.util.Calendar;

import java.util.HashMap;
import java.util.Map;

import oracle.jbo.domain.Date;
import oracle.jbo.server.ViewObjectImpl;

import org.codehaus.groovy.runtime.InvokerHelper;
// ---------------------------------------------------------------------
// ---    File generated by Oracle ADF Business Components Design Time.
// ---    Wed Jul 20 14:38:06 EEST 2016
// ---    Custom code may be added to this class.
// ---    Warning: Do not modify method signatures of generated methods.
// ---------------------------------------------------------------------
public class DashSalesImpl extends ViewObjectImpl {
    /**
     * This is the default constructor (do not remove).
     */
    public DashSalesImpl() {
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
    
    public Date getDateFirst() throws SQLException {
        Calendar calendar = Calendar.getInstance();
        //calendar.set(Calendar.DAY_OF_MONTH, calendar.getActualMinimum(Calendar.DAY_OF_MONTH)); // это будет начало месяца
        calendar.set(Calendar.DAY_OF_MONTH, calendar.getActualMaximum(Calendar.DAY_OF_MONTH)); // это будет конец месяца
        //calendar.set(Calendar.DAY_OF_YEAR, calendar.getActualMaximum(Calendar.DAY_OF_YEAR)); // это будет конец года
        //calendar.set(Calendar.DAY_OF_YEAR, calendar.getActualMinimum(Calendar.DAY_OF_YEAR)); // это будет начало года
        java.util.Date pDate = calendar.getTime();
        oracle.jbo.domain.Date dbDate= new oracle.jbo.domain.Date(new java.sql.Date(pDate.getTime()));
        //oracle.jbo.domain.Date time = new oracle.jbo.domain.Date(pDate);
        return dbDate;
    }

    /**
     * Returns the bind variable value for s_dat.
     * @return bind variable value for s_dat
     */
    public Timestamp gets_dat() {
        return (Timestamp) getNamedWhereClauseParam("s_dat");
    }

    /**
     * Sets <code>value</code> for bind variable s_dat.
     * @param value value to bind as s_dat
     */
    public void sets_dat(Timestamp value) {
        setNamedWhereClauseParam("s_dat", value);
    }

    /**
     * Returns the bind variable value for f_dat.
     * @return bind variable value for f_dat
     */
    public Timestamp getf_dat() {
        return (Timestamp) getNamedWhereClauseParam("f_dat");
    }

    /**
     * Sets <code>value</code> for bind variable f_dat.
     * @param value value to bind as f_dat
     */
    public void setf_dat(Timestamp value) {
        setNamedWhereClauseParam("f_dat", value);
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

