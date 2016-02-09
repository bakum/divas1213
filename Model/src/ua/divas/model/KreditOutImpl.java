package ua.divas.model;

import java.math.BigDecimal;

import java.sql.Timestamp;

import java.util.UUID;

import oracle.jbo.Key;
import oracle.jbo.RowIterator;
import oracle.jbo.server.EntityDefImpl;
import oracle.jbo.server.EntityImpl;

import oracle.jbo.server.TransactionEvent;

import ua.divas.classes.DivasEntity;
// ---------------------------------------------------------------------
// ---    File generated by Oracle ADF Business Components Design Time.
// ---    Sat Jan 23 21:08:31 EET 2016
// ---    Custom code may be added to this class.
// ---    Warning: Do not modify method signatures of generated methods.
// ---------------------------------------------------------------------
public class KreditOutImpl extends DivasEntity {
    
    @Override
    protected void doDML(int i, TransactionEvent transactionEvent) {
        super.doDML(i, transactionEvent);
        String _id = this.getId();
        callStoredProcedure("KREDIT_ENTRY.kredit_move_plan_acc(?)", new Object[] { _id });
    }
    
    @Override
    protected void callDeleted() {
        this.setDeleted(1);
    }

    @Override
    protected void callId() {
        this.setId(UUID.randomUUID().toString());
    }
    /**
     * AttributesEnum: generated enum for identifying attributes and accessors. DO NOT MODIFY.
     */
    public enum AttributesEnum {
        Id,
        Dat,
        Num,
        Deleted,
        Posted,
        DivisionId,
        UserId,
        Comments,
        Version,
        CurrId,
        KassaId,
        ActivitiesId,
        Summa,
        KontragId,
        Percent,
        PercentId,
        CalcId,
        Divisions,
        Kassa,
        Kontragents,
        KreditCalcEnum,
        Currency,
        KreditPercentEnum,
        TypeOfActivities,
        Users,
        KreditOutTpPercent,
        KreditOutTpPayment;
        private static AttributesEnum[] vals = null;
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
    public static final int DAT = AttributesEnum.Dat.index();
    public static final int NUM = AttributesEnum.Num.index();
    public static final int DELETED = AttributesEnum.Deleted.index();
    public static final int POSTED = AttributesEnum.Posted.index();
    public static final int DIVISIONID = AttributesEnum.DivisionId.index();
    public static final int USERID = AttributesEnum.UserId.index();
    public static final int COMMENTS = AttributesEnum.Comments.index();
    public static final int VERSION = AttributesEnum.Version.index();
    public static final int CURRID = AttributesEnum.CurrId.index();
    public static final int KASSAID = AttributesEnum.KassaId.index();
    public static final int ACTIVITIESID = AttributesEnum.ActivitiesId.index();
    public static final int SUMMA = AttributesEnum.Summa.index();
    public static final int KONTRAGID = AttributesEnum.KontragId.index();
    public static final int PERCENT = AttributesEnum.Percent.index();
    public static final int PERCENTID = AttributesEnum.PercentId.index();
    public static final int CALCID = AttributesEnum.CalcId.index();
    public static final int DIVISIONS = AttributesEnum.Divisions.index();
    public static final int KASSA = AttributesEnum.Kassa.index();
    public static final int KONTRAGENTS = AttributesEnum.Kontragents.index();
    public static final int KREDITCALCENUM = AttributesEnum.KreditCalcEnum.index();
    public static final int CURRENCY = AttributesEnum.Currency.index();
    public static final int KREDITPERCENTENUM = AttributesEnum.KreditPercentEnum.index();
    public static final int TYPEOFACTIVITIES = AttributesEnum.TypeOfActivities.index();
    public static final int USERS = AttributesEnum.Users.index();
    public static final int KREDITOUTTPPERCENT = AttributesEnum.KreditOutTpPercent.index();
    public static final int KREDITOUTTPPAYMENT = AttributesEnum.KreditOutTpPayment.index();

    /**
     * This is the default constructor (do not remove).
     */
    public KreditOutImpl() {
    }

    /**
     * @return the definition object for this instance class.
     */
    public static synchronized EntityDefImpl getDefinitionObject() {
        return EntityDefImpl.findDefObject("ua.divas.model.KreditOut");
    }


    /**
     * Gets the attribute value for Id, using the alias name Id.
     * @return the value of Id
     */
    public String getId() {
        return (String) getAttributeInternal(ID);
    }

    /**
     * Sets <code>value</code> as the attribute value for Id.
     * @param value value to set the Id
     */
    public void setId(String value) {
        setAttributeInternal(ID, value);
    }

    /**
     * Gets the attribute value for Dat, using the alias name Dat.
     * @return the value of Dat
     */
    public Timestamp getDat() {
        return (Timestamp) getAttributeInternal(DAT);
    }

    /**
     * Sets <code>value</code> as the attribute value for Dat.
     * @param value value to set the Dat
     */
    public void setDat(Timestamp value) {
        setAttributeInternal(DAT, value);
    }

    /**
     * Gets the attribute value for Num, using the alias name Num.
     * @return the value of Num
     */
    public String getNum() {
        return (String) getAttributeInternal(NUM);
    }

    /**
     * Sets <code>value</code> as the attribute value for Num.
     * @param value value to set the Num
     */
    public void setNum(String value) {
        setAttributeInternal(NUM, value);
    }

    /**
     * Gets the attribute value for Deleted, using the alias name Deleted.
     * @return the value of Deleted
     */
    public Integer getDeleted() {
        return (Integer) getAttributeInternal(DELETED);
    }

    /**
     * Sets <code>value</code> as the attribute value for Deleted.
     * @param value value to set the Deleted
     */
    public void setDeleted(Integer value) {
        setAttributeInternal(DELETED, value);
    }

    /**
     * Gets the attribute value for Posted, using the alias name Posted.
     * @return the value of Posted
     */
    public Integer getPosted() {
        return (Integer) getAttributeInternal(POSTED);
    }

    /**
     * Sets <code>value</code> as the attribute value for Posted.
     * @param value value to set the Posted
     */
    public void setPosted(Integer value) {
        setAttributeInternal(POSTED, value);
    }

    /**
     * Gets the attribute value for DivisionId, using the alias name DivisionId.
     * @return the value of DivisionId
     */
    public String getDivisionId() {
        return (String) getAttributeInternal(DIVISIONID);
    }

    /**
     * Sets <code>value</code> as the attribute value for DivisionId.
     * @param value value to set the DivisionId
     */
    public void setDivisionId(String value) {
        setAttributeInternal(DIVISIONID, value);
    }

    /**
     * Gets the attribute value for UserId, using the alias name UserId.
     * @return the value of UserId
     */
    public String getUserId() {
        return (String) getAttributeInternal(USERID);
    }

    /**
     * Sets <code>value</code> as the attribute value for UserId.
     * @param value value to set the UserId
     */
    public void setUserId(String value) {
        setAttributeInternal(USERID, value);
    }

    /**
     * Gets the attribute value for Comments, using the alias name Comments.
     * @return the value of Comments
     */
    public String getComments() {
        return (String) getAttributeInternal(COMMENTS);
    }

    /**
     * Sets <code>value</code> as the attribute value for Comments.
     * @param value value to set the Comments
     */
    public void setComments(String value) {
        setAttributeInternal(COMMENTS, value);
    }

    /**
     * Gets the attribute value for Version, using the alias name Version.
     * @return the value of Version
     */
    public Timestamp getVersion() {
        return (Timestamp) getAttributeInternal(VERSION);
    }

    /**
     * Sets <code>value</code> as the attribute value for Version.
     * @param value value to set the Version
     */
    public void setVersion(Timestamp value) {
        setAttributeInternal(VERSION, value);
    }

    /**
     * Gets the attribute value for CurrId, using the alias name CurrId.
     * @return the value of CurrId
     */
    public String getCurrId() {
        return (String) getAttributeInternal(CURRID);
    }

    /**
     * Sets <code>value</code> as the attribute value for CurrId.
     * @param value value to set the CurrId
     */
    public void setCurrId(String value) {
        setAttributeInternal(CURRID, value);
    }

    /**
     * Gets the attribute value for KassaId, using the alias name KassaId.
     * @return the value of KassaId
     */
    public String getKassaId() {
        return (String) getAttributeInternal(KASSAID);
    }

    /**
     * Sets <code>value</code> as the attribute value for KassaId.
     * @param value value to set the KassaId
     */
    public void setKassaId(String value) {
        setAttributeInternal(KASSAID, value);
    }

    /**
     * Gets the attribute value for ActivitiesId, using the alias name ActivitiesId.
     * @return the value of ActivitiesId
     */
    public String getActivitiesId() {
        return (String) getAttributeInternal(ACTIVITIESID);
    }

    /**
     * Sets <code>value</code> as the attribute value for ActivitiesId.
     * @param value value to set the ActivitiesId
     */
    public void setActivitiesId(String value) {
        setAttributeInternal(ACTIVITIESID, value);
    }

    /**
     * Gets the attribute value for Summa, using the alias name Summa.
     * @return the value of Summa
     */
    public BigDecimal getSumma() {
        return (BigDecimal) getAttributeInternal(SUMMA);
    }

    /**
     * Sets <code>value</code> as the attribute value for Summa.
     * @param value value to set the Summa
     */
    public void setSumma(BigDecimal value) {
        setAttributeInternal(SUMMA, value);
    }

    /**
     * Gets the attribute value for KontragId, using the alias name KontragId.
     * @return the value of KontragId
     */
    public String getKontragId() {
        return (String) getAttributeInternal(KONTRAGID);
    }

    /**
     * Sets <code>value</code> as the attribute value for KontragId.
     * @param value value to set the KontragId
     */
    public void setKontragId(String value) {
        setAttributeInternal(KONTRAGID, value);
    }

    /**
     * Gets the attribute value for Percent, using the alias name Percent.
     * @return the value of Percent
     */
    public BigDecimal getPercent() {
        return (BigDecimal) getAttributeInternal(PERCENT);
    }

    /**
     * Sets <code>value</code> as the attribute value for Percent.
     * @param value value to set the Percent
     */
    public void setPercent(BigDecimal value) {
        setAttributeInternal(PERCENT, value);
    }

    /**
     * Gets the attribute value for PercentId, using the alias name PercentId.
     * @return the value of PercentId
     */
    public String getPercentId() {
        return (String) getAttributeInternal(PERCENTID);
    }

    /**
     * Sets <code>value</code> as the attribute value for PercentId.
     * @param value value to set the PercentId
     */
    public void setPercentId(String value) {
        setAttributeInternal(PERCENTID, value);
    }

    /**
     * Gets the attribute value for CalcId, using the alias name CalcId.
     * @return the value of CalcId
     */
    public String getCalcId() {
        return (String) getAttributeInternal(CALCID);
    }

    /**
     * Sets <code>value</code> as the attribute value for CalcId.
     * @param value value to set the CalcId
     */
    public void setCalcId(String value) {
        setAttributeInternal(CALCID, value);
    }

    /**
     * @return the associated entity DivisionsImpl.
     */
    public DivisionsImpl getDivisions() {
        return (DivisionsImpl) getAttributeInternal(DIVISIONS);
    }

    /**
     * Sets <code>value</code> as the associated entity DivisionsImpl.
     */
    public void setDivisions(DivisionsImpl value) {
        setAttributeInternal(DIVISIONS, value);
    }

    /**
     * @return the associated entity KassaImpl.
     */
    public KassaImpl getKassa() {
        return (KassaImpl) getAttributeInternal(KASSA);
    }

    /**
     * Sets <code>value</code> as the associated entity KassaImpl.
     */
    public void setKassa(KassaImpl value) {
        setAttributeInternal(KASSA, value);
    }

    /**
     * @return the associated entity KontragentsImpl.
     */
    public KontragentsImpl getKontragents() {
        return (KontragentsImpl) getAttributeInternal(KONTRAGENTS);
    }

    /**
     * Sets <code>value</code> as the associated entity KontragentsImpl.
     */
    public void setKontragents(KontragentsImpl value) {
        setAttributeInternal(KONTRAGENTS, value);
    }

    /**
     * @return the associated entity oracle.jbo.server.EntityImpl.
     */
    public EntityImpl getKreditCalcEnum() {
        return (EntityImpl) getAttributeInternal(KREDITCALCENUM);
    }

    /**
     * Sets <code>value</code> as the associated entity oracle.jbo.server.EntityImpl.
     */
    public void setKreditCalcEnum(EntityImpl value) {
        setAttributeInternal(KREDITCALCENUM, value);
    }

    /**
     * @return the associated entity CurrencyImpl.
     */
    public CurrencyImpl getCurrency() {
        return (CurrencyImpl) getAttributeInternal(CURRENCY);
    }

    /**
     * Sets <code>value</code> as the associated entity CurrencyImpl.
     */
    public void setCurrency(CurrencyImpl value) {
        setAttributeInternal(CURRENCY, value);
    }

    /**
     * @return the associated entity oracle.jbo.server.EntityImpl.
     */
    public EntityImpl getKreditPercentEnum() {
        return (EntityImpl) getAttributeInternal(KREDITPERCENTENUM);
    }

    /**
     * Sets <code>value</code> as the associated entity oracle.jbo.server.EntityImpl.
     */
    public void setKreditPercentEnum(EntityImpl value) {
        setAttributeInternal(KREDITPERCENTENUM, value);
    }

    /**
     * @return the associated entity TypeOfActivitiesImpl.
     */
    public TypeOfActivitiesImpl getTypeOfActivities() {
        return (TypeOfActivitiesImpl) getAttributeInternal(TYPEOFACTIVITIES);
    }

    /**
     * Sets <code>value</code> as the associated entity TypeOfActivitiesImpl.
     */
    public void setTypeOfActivities(TypeOfActivitiesImpl value) {
        setAttributeInternal(TYPEOFACTIVITIES, value);
    }

    /**
     * @return the associated entity UsersImpl.
     */
    public UsersImpl getUsers() {
        return (UsersImpl) getAttributeInternal(USERS);
    }

    /**
     * Sets <code>value</code> as the associated entity UsersImpl.
     */
    public void setUsers(UsersImpl value) {
        setAttributeInternal(USERS, value);
    }

    /**
     * @return the associated entity oracle.jbo.RowIterator.
     */
    public RowIterator getKreditOutTpPercent() {
        return (RowIterator) getAttributeInternal(KREDITOUTTPPERCENT);
    }

    /**
     * @return the associated entity oracle.jbo.RowIterator.
     */
    public RowIterator getKreditOutTpPayment() {
        return (RowIterator) getAttributeInternal(KREDITOUTTPPAYMENT);
    }

    /**
     * @param id key constituent

     * @return a Key object based on given key constituents.
     */
    public static Key createPrimaryKey(String id) {
        return new Key(new Object[] { id });
    }


}

