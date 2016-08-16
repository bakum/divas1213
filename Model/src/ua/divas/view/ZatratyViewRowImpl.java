package ua.divas.view;

import java.math.BigDecimal;

import java.sql.Timestamp;

import oracle.jbo.AttributeList;
import oracle.jbo.RowIterator;
import oracle.jbo.server.AttributeDefImpl;
import oracle.jbo.server.ViewRowImpl;

import ua.divas.model.ZatratyImpl;
// ---------------------------------------------------------------------
// ---    File generated by Oracle ADF Business Components Design Time.
// ---    Fri Jul 17 11:25:05 EEST 2015
// ---    Custom code may be added to this class.
// ---    Warning: Do not modify method signatures of generated methods.
// ---------------------------------------------------------------------
public class ZatratyViewRowImpl extends ViewRowImpl {


    public static final int ENTITY_ZATRATY = 0;

    @Override
    public boolean isAttributeUpdateable(int i) {
        BigDecimal editable = this.getEditable();
        if (editable.intValue()==0) {
            return false;
        } else { 
        return super.isAttributeUpdateable(i);
            }
    }

    @Override
    protected void create(AttributeList attributeList) {
        this.setEditable(new BigDecimal(1));
        //this.setForValidation(new Integer(2));
        super.create(attributeList);
    }

    /**
     * AttributesEnum: generated enum for identifying attributes and accessors. DO NOT MODIFY.
     */
    public enum AttributesEnum {
        Id,
        IsGroup,
        ParentId,
        Deleted,
        Fullname,
        Version,
        Predefined,
        Editable,
        ZatratyView,
        OrdersTpRashodyView,
        OtherZatratyTabPartZatratyView,
        VwZatraty;
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
    public static final int ISGROUP = AttributesEnum.IsGroup.index();
    public static final int PARENTID = AttributesEnum.ParentId.index();
    public static final int DELETED = AttributesEnum.Deleted.index();
    public static final int FULLNAME = AttributesEnum.Fullname.index();
    public static final int VERSION = AttributesEnum.Version.index();
    public static final int PREDEFINED = AttributesEnum.Predefined.index();
    public static final int EDITABLE = AttributesEnum.Editable.index();
    public static final int ZATRATYVIEW = AttributesEnum.ZatratyView.index();
    public static final int ORDERSTPRASHODYVIEW = AttributesEnum.OrdersTpRashodyView.index();
    public static final int OTHERZATRATYTABPARTZATRATYVIEW = AttributesEnum.OtherZatratyTabPartZatratyView.index();
    public static final int VWZATRATY = AttributesEnum.VwZatraty.index();

    /**
     * This is the default constructor (do not remove).
     */
    public ZatratyViewRowImpl() {
    }

    /**
     * Gets Zatraty entity object.
     * @return the Zatraty
     */
    public ZatratyImpl getZatraty() {
        return (ZatratyImpl) getEntity(ENTITY_ZATRATY);
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
     * Gets the attribute value for the calculated attribute Editable.
     * @return the Editable
     */
    public BigDecimal getEditable() {
        return (BigDecimal) getAttributeInternal(EDITABLE);
    }

    /**
     * Sets <code>value</code> as the attribute value for the calculated attribute Editable.
     * @param value value to set the  Editable
     */
    public void setEditable(BigDecimal value) {
        setAttributeInternal(EDITABLE, value);
    }

    /**
     * Gets the associated <code>RowIterator</code> using master-detail link ZatratyView.
     */
    public RowIterator getZatratyView() {
        return (RowIterator) getAttributeInternal(ZATRATYVIEW);
    }

    /**
     * Gets the associated <code>RowIterator</code> using master-detail link OrdersTpRashodyView.
     */
    public RowIterator getOrdersTpRashodyView() {
        return (RowIterator) getAttributeInternal(ORDERSTPRASHODYVIEW);
    }

    /**
     * Gets the associated <code>RowIterator</code> using master-detail link OtherZatratyTabPartZatratyView.
     */
    public RowIterator getOtherZatratyTabPartZatratyView() {
        return (RowIterator) getAttributeInternal(OTHERZATRATYTABPARTZATRATYVIEW);
    }

    /**
     * Gets the associated <code>RowIterator</code> using master-detail link VwZatraty.
     */
    public RowIterator getVwZatraty() {
        return (RowIterator) getAttributeInternal(VWZATRATY);
    }
}

