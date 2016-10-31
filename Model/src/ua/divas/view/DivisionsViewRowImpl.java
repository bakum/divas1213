package ua.divas.view;

import java.math.BigDecimal;

import java.sql.Timestamp;

import oracle.jbo.AttributeList;
import oracle.jbo.RowIterator;
import oracle.jbo.RowSet;
import oracle.jbo.domain.Number;
import oracle.jbo.server.AttributeDefImpl;
import oracle.jbo.server.ViewRowImpl;

import ua.divas.model.DivisionsImpl;
// ---------------------------------------------------------------------
// ---    File generated by Oracle ADF Business Components Design Time.
// ---    Tue Apr 28 21:04:00 EEST 2015
// ---    Custom code may be added to this class.
// ---    Warning: Do not modify method signatures of generated methods.
// ---------------------------------------------------------------------
public class DivisionsViewRowImpl extends ViewRowImpl {


    public static final int ENTITY_DIVISIONS = 0;

    @Override
    public boolean isAttributeUpdateable(int i) {
        BigDecimal editable = this.getDEditable();
        if (editable.intValue()==0) {
            return false;
        } else { 
        return super.isAttributeUpdateable(i);
            }
    }

    @Override
    protected void create(AttributeList attributeList) {
        this.setDEditable(new BigDecimal(1));
        super.create(attributeList);
    }

    /**
     * AttributesEnum: generated enum for identifying attributes and accessors. DO NOT MODIFY.
     */
    public enum AttributesEnum {
        Id,
        Fullname,
        Deleted,
        IsGroup,
        ParentId,
        Version,
        Predefined,
        DEditable,
        MainUser,
        Prefix,
        SummInfo,
        SummReturn,
        TotalActiveStart,
        TotalActiveOborot,
        DivisionsView,
        KassaView,
        OrdersView,
        UserSettingsView,
        DivisionSotrView,
        OrderZamerView,
        OtherZatratyView,
        VwSales,
        VwZatraty,
        NachislSettingsView,
        StartOstView,
        ProfitDistribView,
        KreditOutView,
        DivisionsView1,
        UsersView1;
        static AttributesEnum[] vals = null;
        ;
        private static final int firstIndex = 0;

        public int index() {
            return AttributesEnum.firstIndex() + ordinal();
        }

        public static final int firstIndex() {
            return firstIndex;
        }

        public static int count() {
            return AttributesEnum.firstIndex() + AttributesEnum.staticValues().length;
        }

        public static final AttributesEnum[] staticValues() {
            if (vals == null) {
                vals = AttributesEnum.values();
            }
            return vals;
        }
    }


    public static final int ID = AttributesEnum.Id.index();
    public static final int FULLNAME = AttributesEnum.Fullname.index();
    public static final int DELETED = AttributesEnum.Deleted.index();
    public static final int ISGROUP = AttributesEnum.IsGroup.index();
    public static final int PARENTID = AttributesEnum.ParentId.index();
    public static final int VERSION = AttributesEnum.Version.index();
    public static final int PREDEFINED = AttributesEnum.Predefined.index();
    public static final int DEDITABLE = AttributesEnum.DEditable.index();
    public static final int MAINUSER = AttributesEnum.MainUser.index();
    public static final int PREFIX = AttributesEnum.Prefix.index();
    public static final int SUMMINFO = AttributesEnum.SummInfo.index();
    public static final int SUMMRETURN = AttributesEnum.SummReturn.index();
    public static final int TOTALACTIVESTART = AttributesEnum.TotalActiveStart.index();
    public static final int TOTALACTIVEOBOROT = AttributesEnum.TotalActiveOborot.index();
    public static final int DIVISIONSVIEW = AttributesEnum.DivisionsView.index();
    public static final int KASSAVIEW = AttributesEnum.KassaView.index();
    public static final int ORDERSVIEW = AttributesEnum.OrdersView.index();
    public static final int USERSETTINGSVIEW = AttributesEnum.UserSettingsView.index();
    public static final int DIVISIONSOTRVIEW = AttributesEnum.DivisionSotrView.index();
    public static final int ORDERZAMERVIEW = AttributesEnum.OrderZamerView.index();
    public static final int OTHERZATRATYVIEW = AttributesEnum.OtherZatratyView.index();
    public static final int VWSALES = AttributesEnum.VwSales.index();
    public static final int VWZATRATY = AttributesEnum.VwZatraty.index();
    public static final int NACHISLSETTINGSVIEW = AttributesEnum.NachislSettingsView.index();
    public static final int STARTOSTVIEW = AttributesEnum.StartOstView.index();
    public static final int PROFITDISTRIBVIEW = AttributesEnum.ProfitDistribView.index();
    public static final int KREDITOUTVIEW = AttributesEnum.KreditOutView.index();
    public static final int DIVISIONSVIEW1 = AttributesEnum.DivisionsView1.index();
    public static final int USERSVIEW1 = AttributesEnum.UsersView1.index();

    /**
     * This is the default constructor (do not remove).
     */
    public DivisionsViewRowImpl() {
    }

    /**
     * Gets Divisions entity object.
     * @return the Divisions
     */
    public DivisionsImpl getDivisions() {
        return (DivisionsImpl) getEntity(ENTITY_DIVISIONS);
    }

    /**
     * Gets the attribute value for ID using the alias name Id.
     * @return the ID
     */
    public String getId() {
        return (String) getAttributeInternal(ID);
    }

    /**
     * Sets <code>value</code> as attribute value for ID using the alias name Id.
     * @param value value to set the ID
     */
    public void setId(String value) {
        setAttributeInternal(ID, value);
    }

    /**
     * Gets the attribute value for FULLNAME using the alias name Fullname.
     * @return the FULLNAME
     */
    public String getFullname() {
        return (String) getAttributeInternal(FULLNAME);
    }

    /**
     * Sets <code>value</code> as attribute value for FULLNAME using the alias name Fullname.
     * @param value value to set the FULLNAME
     */
    public void setFullname(String value) {
        setAttributeInternal(FULLNAME, value);
    }

    /**
     * Gets the attribute value for DELETED using the alias name Deleted.
     * @return the DELETED
     */
    public Integer getDeleted() {
        return (Integer) getAttributeInternal(DELETED);
    }

    /**
     * Sets <code>value</code> as attribute value for DELETED using the alias name Deleted.
     * @param value value to set the DELETED
     */
    public void setDeleted(Integer value) {
        setAttributeInternal(DELETED, value);
    }

    /**
     * Gets the attribute value for IS_GROUP using the alias name IsGroup.
     * @return the IS_GROUP
     */
    public Integer getIsGroup() {
        return (Integer) getAttributeInternal(ISGROUP);
    }

    /**
     * Sets <code>value</code> as attribute value for IS_GROUP using the alias name IsGroup.
     * @param value value to set the IS_GROUP
     */
    public void setIsGroup(Integer value) {
        setAttributeInternal(ISGROUP, value);
    }

    /**
     * Gets the attribute value for PARENT_ID using the alias name ParentId.
     * @return the PARENT_ID
     */
    public String getParentId() {
        return (String) getAttributeInternal(PARENTID);
    }

    /**
     * Sets <code>value</code> as attribute value for PARENT_ID using the alias name ParentId.
     * @param value value to set the PARENT_ID
     */
    public void setParentId(String value) {
        setAttributeInternal(PARENTID, value);
    }

    /**
     * Gets the attribute value for VERSION using the alias name Version.
     * @return the VERSION
     */
    public Timestamp getVersion() {
        return (Timestamp) getAttributeInternal(VERSION);
    }

    /**
     * Sets <code>value</code> as attribute value for VERSION using the alias name Version.
     * @param value value to set the VERSION
     */
    public void setVersion(Timestamp value) {
        setAttributeInternal(VERSION, value);
    }

    /**
     * Gets the attribute value for PREDEFINED using the alias name Predefined.
     * @return the PREDEFINED
     */
    public Integer getPredefined() {
        return (Integer) getAttributeInternal(PREDEFINED);
    }

    /**
     * Sets <code>value</code> as attribute value for PREDEFINED using the alias name Predefined.
     * @param value value to set the PREDEFINED
     */
    public void setPredefined(Integer value) {
        setAttributeInternal(PREDEFINED, value);
    }

    /**
     * Gets the attribute value for the calculated attribute DEditable.
     * @return the DEditable
     */
    public BigDecimal getDEditable() {
        return (BigDecimal) getAttributeInternal(DEDITABLE);
    }

    /**
     * Sets <code>value</code> as the attribute value for the calculated attribute DEditable.
     * @param value value to set the  DEditable
     */
    public void setDEditable(BigDecimal value) {
        setAttributeInternal(DEDITABLE, value);
    }

    /**
     * Gets the attribute value for MAIN_USER using the alias name MainUser.
     * @return the MAIN_USER
     */
    public String getMainUser() {
        return (String) getAttributeInternal(MAINUSER);
    }

    /**
     * Sets <code>value</code> as attribute value for MAIN_USER using the alias name MainUser.
     * @param value value to set the MAIN_USER
     */
    public void setMainUser(String value) {
        setAttributeInternal(MAINUSER, value);
    }

    /**
     * Gets the attribute value for the calculated attribute TotalActiveStart.
     * @return the TotalActiveStart
     */
    public Number getTotalActiveStart() {
        return (Number) getAttributeInternal(TOTALACTIVESTART);
    }

    /**
     * Gets the attribute value for the calculated attribute TotalActiveOborot.
     * @return the TotalActiveOborot
     */
    public Number getTotalActiveOborot() {
        return (Number) getAttributeInternal(TOTALACTIVEOBOROT);
    }

    /**
     * Gets the attribute value for SUMM_INFO using the alias name SummInfo.
     * @return the SUMM_INFO
     */
    public BigDecimal getSummInfo() {
        return (BigDecimal) getAttributeInternal(SUMMINFO);
    }

    /**
     * Sets <code>value</code> as attribute value for SUMM_INFO using the alias name SummInfo.
     * @param value value to set the SUMM_INFO
     */
    public void setSummInfo(BigDecimal value) {
        setAttributeInternal(SUMMINFO, value);
    }

    /**
     * Gets the attribute value for SUMM_RETURN using the alias name SummReturn.
     * @return the SUMM_RETURN
     */
    public BigDecimal getSummReturn() {
        return (BigDecimal) getAttributeInternal(SUMMRETURN);
    }

    /**
     * Sets <code>value</code> as attribute value for SUMM_RETURN using the alias name SummReturn.
     * @param value value to set the SUMM_RETURN
     */
    public void setSummReturn(BigDecimal value) {
        setAttributeInternal(SUMMRETURN, value);
    }

    /**
     * Gets the attribute value for PREFIX using the alias name Prefix.
     * @return the PREFIX
     */
    public String getPrefix() {
        return (String) getAttributeInternal(PREFIX);
    }

    /**
     * Sets <code>value</code> as attribute value for PREFIX using the alias name Prefix.
     * @param value value to set the PREFIX
     */
    public void setPrefix(String value) {
        setAttributeInternal(PREFIX, value);
    }

    /**
     * Gets the associated <code>RowIterator</code> using master-detail link DivisionsView.
     */
    public RowIterator getDivisionsView() {
        return (RowIterator) getAttributeInternal(DIVISIONSVIEW);
    }

    /**
     * Gets the associated <code>RowIterator</code> using master-detail link KassaView.
     */
    public RowIterator getKassaView() {
        return (RowIterator) getAttributeInternal(KASSAVIEW);
    }

    /**
     * Gets the associated <code>RowIterator</code> using master-detail link OrdersView.
     */
    public RowIterator getOrdersView() {
        return (RowIterator) getAttributeInternal(ORDERSVIEW);
    }

    /**
     * Gets the associated <code>RowIterator</code> using master-detail link UserSettingsView.
     */
    public RowIterator getUserSettingsView() {
        return (RowIterator) getAttributeInternal(USERSETTINGSVIEW);
    }

    /**
     * Gets the associated <code>RowIterator</code> using master-detail link DivisionSotrView.
     */
    public RowIterator getDivisionSotrView() {
        return (RowIterator) getAttributeInternal(DIVISIONSOTRVIEW);
    }

    /**
     * Gets the associated <code>RowIterator</code> using master-detail link OrderZamerView.
     */
    public RowIterator getOrderZamerView() {
        return (RowIterator) getAttributeInternal(ORDERZAMERVIEW);
    }

    /**
     * Gets the associated <code>RowIterator</code> using master-detail link OtherZatratyView.
     */
    public RowIterator getOtherZatratyView() {
        return (RowIterator) getAttributeInternal(OTHERZATRATYVIEW);
    }


    /**
     * Gets the associated <code>RowIterator</code> using master-detail link VwSales.
     */
    public RowIterator getVwSales() {
        return (RowIterator) getAttributeInternal(VWSALES);
    }

    /**
     * Gets the associated <code>RowIterator</code> using master-detail link VwZatraty.
     */
    public RowIterator getVwZatraty() {
        return (RowIterator) getAttributeInternal(VWZATRATY);
    }

    /**
     * Gets the associated <code>RowIterator</code> using master-detail link NachislSettingsView.
     */
    public RowIterator getNachislSettingsView() {
        return (RowIterator) getAttributeInternal(NACHISLSETTINGSVIEW);
    }


    /**
     * Gets the associated <code>RowIterator</code> using master-detail link StartOstView.
     */
    public RowIterator getStartOstView() {
        return (RowIterator) getAttributeInternal(STARTOSTVIEW);
    }

    /**
     * Gets the associated <code>RowIterator</code> using master-detail link ProfitDistribView.
     */
    public RowIterator getProfitDistribView() {
        return (RowIterator) getAttributeInternal(PROFITDISTRIBVIEW);
    }

    /**
     * Gets the associated <code>RowIterator</code> using master-detail link KreditOutView.
     */
    public RowIterator getKreditOutView() {
        return (RowIterator) getAttributeInternal(KREDITOUTVIEW);
    }

    /**
     * Gets the view accessor <code>RowSet</code> DivisionsView1.
     */
    public RowSet getDivisionsView1() {
        return (RowSet) getAttributeInternal(DIVISIONSVIEW1);
    }

    /**
     * Gets the view accessor <code>RowSet</code> UsersView1.
     */
    public RowSet getUsersView1() {
        return (RowSet) getAttributeInternal(USERSVIEW1);
    }
}

