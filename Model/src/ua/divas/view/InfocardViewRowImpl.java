package ua.divas.view;

import java.math.BigDecimal;

import oracle.jbo.AttributeList;
import oracle.jbo.domain.BFileDomain;
import oracle.jbo.server.EntityImpl;
import oracle.jbo.server.ViewRowImpl;

import ua.divas.model.InfocardImpl;
// ---------------------------------------------------------------------
// ---    File generated by Oracle ADF Business Components Design Time.
// ---    Tue Dec 22 22:34:20 EET 2015
// ---    Custom code may be added to this class.
// ---    Warning: Do not modify method signatures of generated methods.
// ---------------------------------------------------------------------
public class InfocardViewRowImpl extends ViewRowImpl {


    public static final int ENTITY_INFOCARD = 0;

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
        Fullname,
        Summa,
        SummaKl,
        Editable;
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
    public static final int SUMMA = AttributesEnum.Summa.index();
    public static final int SUMMAKL = AttributesEnum.SummaKl.index();
    public static final int EDITABLE = AttributesEnum.Editable.index();

    /**
     * This is the default constructor (do not remove).
     */
    public InfocardViewRowImpl() {
    }

    /**
     * Gets Infocard entity object.
     * @return the Infocard
     */
    public InfocardImpl getInfocard() {
        return (InfocardImpl) getEntity(ENTITY_INFOCARD);
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
     * Gets the attribute value for SUMMA using the alias name Summa.
     * @return the SUMMA
     */
    public BigDecimal getSumma() {
        return (BigDecimal) getAttributeInternal(SUMMA);
    }

    /**
     * Sets <code>value</code> as attribute value for SUMMA using the alias name Summa.
     * @param value value to set the SUMMA
     */
    public void setSumma(BigDecimal value) {
        setAttributeInternal(SUMMA, value);
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
     * Gets the attribute value for SUMMA_KL using the alias name SummaKl.
     * @return the SUMMA_KL
     */
    public BigDecimal getSummaKl() {
        return (BigDecimal) getAttributeInternal(SUMMAKL);
    }

    /**
     * Sets <code>value</code> as attribute value for SUMMA_KL using the alias name SummaKl.
     * @param value value to set the SUMMA_KL
     */
    public void setSummaKl(BigDecimal value) {
        setAttributeInternal(SUMMAKL, value);
    }
}

