package ua.divas.view.client;

import java.math.BigDecimal;

import oracle.jbo.client.remote.ViewUsageImpl;

import ua.divas.view.common.ProfitDistribView;
// ---------------------------------------------------------------------
// ---    File generated by Oracle ADF Business Components Design Time.
// ---    Thu Jun 18 13:30:19 EEST 2015
// ---    Custom code may be added to this class.
// ---    Warning: Do not modify method signatures of generated methods.
// ---------------------------------------------------------------------
public class ProfitDistribViewClient extends ViewUsageImpl implements ProfitDistribView {
    /**
     * This is the default constructor (do not remove).
     */
    public ProfitDistribViewClient() {
    }


    public void addEntry(String _id) {
        Object _ret = getApplicationModuleProxy().riInvokeExportedMethod(this, "addEntry", new String[] {
                                                                         "java.lang.String" }, new Object[] { _id });
        return;
    }

    public BigDecimal getProfit() {
        Object _ret = getApplicationModuleProxy().riInvokeExportedMethod(this, "getProfit", null, null);
        return (BigDecimal) _ret;
    }

    public BigDecimal getProfitByDivision(String p_div) {
        Object _ret = getApplicationModuleProxy().riInvokeExportedMethod(this, "getProfitByDivision", new String[] {
                                                                         "java.lang.String" }, new Object[] { p_div });
        return (BigDecimal) _ret;
    }

    public void removeEntry(String _id) {
        Object _ret = getApplicationModuleProxy().riInvokeExportedMethod(this, "removeEntry", new String[] {
                                                                         "java.lang.String" }, new Object[] { _id });
        return;
    }
}

