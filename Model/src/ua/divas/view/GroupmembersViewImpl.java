package ua.divas.view;

import oracle.jbo.server.ViewObjectImpl;

import ua.divas.classes.DivasView;
import ua.divas.view.common.GroupmembersView;
// ---------------------------------------------------------------------
// ---    File generated by Oracle ADF Business Components Design Time.
// ---    Wed Oct 15 19:10:53 EEST 2014
// ---    Custom code may be added to this class.
// ---    Warning: Do not modify method signatures of generated methods.
// ---------------------------------------------------------------------
public class GroupmembersViewImpl extends DivasView implements GroupmembersView {
    /**
     * This is the default constructor (do not remove).
     */
    public GroupmembersViewImpl() {
    }
    
    public void addUserToGroup(String userName, String groupName) {
        //AppModuleImpl am = (AppModuleImpl)BindingContext.getCurrent().getDefaultDataControl().getApplicationModule();
        callStoredProcedureWoCommit("UTILITY.add_user_to_group(?,?)", new Object[] {userName,groupName});
        //am.getTransaction().commit();
    }
}

