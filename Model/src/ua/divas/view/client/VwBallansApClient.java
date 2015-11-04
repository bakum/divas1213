package ua.divas.view.client;

import oracle.jbo.client.remote.ViewUsageImpl;
import oracle.jbo.domain.Date;

import ua.divas.view.common.VwBallansAp;
// ---------------------------------------------------------------------
// ---    File generated by Oracle ADF Business Components Design Time.
// ---    Wed Jul 22 00:34:27 EEST 2015
// ---    Custom code may be added to this class.
// ---    Warning: Do not modify method signatures of generated methods.
// ---------------------------------------------------------------------
public class VwBallansApClient extends ViewUsageImpl implements VwBallansAp {
    /**
     * This is the default constructor (do not remove).
     */
    public VwBallansApClient() {
    }

    public void refreshBallans(Date f_dat, Date l_dat) {
        Object _ret = getApplicationModuleProxy().riInvokeExportedMethod(this, "refreshBallans", new String[] {
                                                                         "oracle.jbo.domain.Date",
                                                                         "oracle.jbo.domain.Date"
        }, new Object[] { f_dat, l_dat });
        return;
    }
}

