package ua.divas.view.client;

import oracle.jbo.client.remote.ViewUsageImpl;

import ua.divas.view.common.OtherZatratyView;
// ---------------------------------------------------------------------
// ---    File generated by Oracle ADF Business Components Design Time.
// ---    Wed Mar 18 20:11:02 EET 2015
// ---    Custom code may be added to this class.
// ---    Warning: Do not modify method signatures of generated methods.
// ---------------------------------------------------------------------
public class OtherZatratyViewClient extends ViewUsageImpl implements OtherZatratyView {
    /**
     * This is the default constructor (do not remove).
     */
    public OtherZatratyViewClient() {
    }


    public void addEntry(String _id) {
        Object _ret = getApplicationModuleProxy().riInvokeExportedMethod(this, "addEntry", new String[] {
                                                                         "java.lang.String" }, new Object[] { _id });
        return;
    }

    public void removeEntry(String _id) {
        Object _ret = getApplicationModuleProxy().riInvokeExportedMethod(this, "removeEntry", new String[] {
                                                                         "java.lang.String" }, new Object[] { _id });
        return;
    }
}

