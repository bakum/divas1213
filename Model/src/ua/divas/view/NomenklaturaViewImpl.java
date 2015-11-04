package ua.divas.view;

import oracle.jbo.Variable;
import oracle.jbo.ViewCriteria;
import oracle.jbo.common.VariableImpl;
import oracle.jbo.server.ViewObjectImpl;

import oracle.jbo.server.ViewRowSetImpl;

import ua.divas.view.common.NomenklaturaView;
// ---------------------------------------------------------------------
// ---    File generated by Oracle ADF Business Components Design Time.
// ---    Wed Dec 10 22:45:54 EET 2014
// ---    Custom code may be added to this class.
// ---    Warning: Do not modify method signatures of generated methods.
// ---------------------------------------------------------------------
public class NomenklaturaViewImpl extends ViewObjectImpl implements NomenklaturaView {
    /**
     * This is the default constructor (do not remove).
     */
    public NomenklaturaViewImpl() {
    }

    /**
     * Returns the variable value for prnt.
     * @return variable value for prnt
     */
    public String getprnt() {
        return (String) ensureVariableManager().getVariableValue("prnt");
    }

    /**
     * Sets <code>value</code> for variable prnt.
     * @param value value to bind as prnt
     */
    public void setprnt(String value) {
        ensureVariableManager().setVariableValue("prnt", value);
    }
    
    public void findNomByParent (String parent) {
        String [] applyViewCriteriaNames = this.getApplyViewCriteriaNames();
        if (applyViewCriteriaNames != null) {
            for (String cname : applyViewCriteriaNames) {
                this.removeApplyViewCriteriaName(cname);
            }
        }
        
        ViewCriteria vc = this.getViewCriteria("FilterNomByCascade");
        this.setprnt(parent);
        this.applyViewCriteria(vc);
        this.executeQuery();
    }

    /**
     * Returns the variable value for fname.
     * @return variable value for fname
     */
    public String getfname() {
        return (String) ensureVariableManager().getVariableValue("fname");
    }

    /**
     * Sets <code>value</code> for variable fname.
     * @param value value to bind as fname
     */
    public void setfname(String value) {
        ensureVariableManager().setVariableValue("fname", value);
    }
    
}

