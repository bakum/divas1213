package ua.divas.view;

import oracle.jbo.server.ViewObjectImpl;

import ua.divas.classes.DivasView;
// ---------------------------------------------------------------------
// ---    File generated by Oracle ADF Business Components Design Time.
// ---    Tue Dec 15 13:29:14 EET 2015
// ---    Custom code may be added to this class.
// ---    Warning: Do not modify method signatures of generated methods.
// ---------------------------------------------------------------------
public class CallCenterVOImpl extends DivasView {
    /**
     * This is the default constructor (do not remove).
     */
    public CallCenterVOImpl() {
    }
    
    public String retrieveCustomersFirstParentId() {
        String rv = getCustomerParentId();
        if (rv != null) {
            return rv;
        }
        /* ViewObjectImpl vo = (ViewObjectImpl) this.getRootApplicationModule().findViewObject("KontragentsView1");
        ViewRowSetImpl rs =
            (ViewRowSetImpl) vo.findByViewCriteria(this.getViewCriteria("KontragentsCustomerParentGroup"), -1,
                                                   this.QUERY_MODE_SCAN_DATABASE_TABLES);
        Row row = rs.first();
        if (row != null) {
            rv = (String) row.getAttribute("Id");
            return rv;
        }*/
        return null; 
    }
}

