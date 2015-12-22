package ua.divas.model;

import java.sql.Timestamp;

import java.util.UUID;

import oracle.jbo.Key;
import oracle.jbo.RowIterator;
import oracle.jbo.domain.BlobDomain;
import oracle.jbo.server.AttributeDefImpl;
import oracle.jbo.server.EntityDefImpl;
import oracle.jbo.server.EntityImpl;

import ua.divas.classes.DivasEntity;
// ---------------------------------------------------------------------
// ---    File generated by Oracle ADF Business Components Design Time.
// ---    Sun Aug 24 01:02:23 EEST 2014
// ---    Custom code may be added to this class.
// ---    Warning: Do not modify method signatures of generated methods.
// ---------------------------------------------------------------------
public class KontragentsImpl extends DivasEntity {
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
        IsGroup,
        ParentId,
        Fullname,
        Deleted,
        Inn,
        Okpo,
        Kpp,
        Namefull,
        UrFiz,
        Version,
        Predefined,
        IsBuyer,
        IsMeasurer,
        IsSupplier,
        UserId,
        Photo,
        CityId,
        Datzam,
        Comments,
        InfocardId,
        Kontragents,
        ParentIdKontragents,
        CompaignsDetails,
        ContactDetails,
        Orders,
        OrdersTpUslugi,
        Orders1,
        Users,
        OrdersTpUslugi1,
        OrdersTpRashody,
        OrdersTpNachislenia,
        OrdersTpOplaty,
        CallLog,
        KontragSettings,
        ProfitDistribTp;
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
    public static final int ISGROUP = AttributesEnum.IsGroup.index();
    public static final int PARENTID = AttributesEnum.ParentId.index();
    public static final int FULLNAME = AttributesEnum.Fullname.index();
    public static final int DELETED = AttributesEnum.Deleted.index();
    public static final int INN = AttributesEnum.Inn.index();
    public static final int OKPO = AttributesEnum.Okpo.index();
    public static final int KPP = AttributesEnum.Kpp.index();
    public static final int NAMEFULL = AttributesEnum.Namefull.index();
    public static final int URFIZ = AttributesEnum.UrFiz.index();
    public static final int VERSION = AttributesEnum.Version.index();
    public static final int PREDEFINED = AttributesEnum.Predefined.index();
    public static final int ISBUYER = AttributesEnum.IsBuyer.index();
    public static final int ISMEASURER = AttributesEnum.IsMeasurer.index();
    public static final int ISSUPPLIER = AttributesEnum.IsSupplier.index();
    public static final int USERID = AttributesEnum.UserId.index();
    public static final int PHOTO = AttributesEnum.Photo.index();
    public static final int CITYID = AttributesEnum.CityId.index();
    public static final int DATZAM = AttributesEnum.Datzam.index();
    public static final int COMMENTS = AttributesEnum.Comments.index();
    public static final int INFOCARDID = AttributesEnum.InfocardId.index();
    public static final int KONTRAGENTS = AttributesEnum.Kontragents.index();
    public static final int PARENTIDKONTRAGENTS = AttributesEnum.ParentIdKontragents.index();
    public static final int COMPAIGNSDETAILS = AttributesEnum.CompaignsDetails.index();
    public static final int CONTACTDETAILS = AttributesEnum.ContactDetails.index();
    public static final int ORDERS = AttributesEnum.Orders.index();
    public static final int ORDERSTPUSLUGI = AttributesEnum.OrdersTpUslugi.index();
    public static final int ORDERS1 = AttributesEnum.Orders1.index();
    public static final int USERS = AttributesEnum.Users.index();
    public static final int ORDERSTPUSLUGI1 = AttributesEnum.OrdersTpUslugi1.index();
    public static final int ORDERSTPRASHODY = AttributesEnum.OrdersTpRashody.index();
    public static final int ORDERSTPNACHISLENIA = AttributesEnum.OrdersTpNachislenia.index();
    public static final int ORDERSTPOPLATY = AttributesEnum.OrdersTpOplaty.index();
    public static final int CALLLOG = AttributesEnum.CallLog.index();
    public static final int KONTRAGSETTINGS = AttributesEnum.KontragSettings.index();
    public static final int PROFITDISTRIBTP = AttributesEnum.ProfitDistribTp.index();

    /**
     * This is the default constructor (do not remove).
     */
    public KontragentsImpl() {
    }

    /**
     * @return the definition object for this instance class.
     */
    public static synchronized EntityDefImpl getDefinitionObject() {
        return EntityDefImpl.findDefObject("ua.divas.model.Kontragents");
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
     * Gets the attribute value for IsGroup, using the alias name IsGroup.
     * @return the value of IsGroup
     */
    public Integer getIsGroup() {
        return (Integer) getAttributeInternal(ISGROUP);
    }

    /**
     * Sets <code>value</code> as the attribute value for IsGroup.
     * @param value value to set the IsGroup
     */
    public void setIsGroup(Integer value) {
        setAttributeInternal(ISGROUP, value);
    }

    /**
     * Gets the attribute value for ParentId, using the alias name ParentId.
     * @return the value of ParentId
     */
    public String getParentId() {
        return (String) getAttributeInternal(PARENTID);
    }

    /**
     * Sets <code>value</code> as the attribute value for ParentId.
     * @param value value to set the ParentId
     */
    public void setParentId(String value) {
        setAttributeInternal(PARENTID, value);
    }

    /**
     * Gets the attribute value for Fullname, using the alias name Fullname.
     * @return the value of Fullname
     */
    public String getFullname() {
        return (String) getAttributeInternal(FULLNAME);
    }

    /**
     * Sets <code>value</code> as the attribute value for Fullname.
     * @param value value to set the Fullname
     */
    public void setFullname(String value) {
        setAttributeInternal(FULLNAME, value);
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
     * Gets the attribute value for Inn, using the alias name Inn.
     * @return the value of Inn
     */
    public String getInn() {
        return (String) getAttributeInternal(INN);
    }

    /**
     * Sets <code>value</code> as the attribute value for Inn.
     * @param value value to set the Inn
     */
    public void setInn(String value) {
        setAttributeInternal(INN, value);
    }

    /**
     * Gets the attribute value for Okpo, using the alias name Okpo.
     * @return the value of Okpo
     */
    public String getOkpo() {
        return (String) getAttributeInternal(OKPO);
    }

    /**
     * Sets <code>value</code> as the attribute value for Okpo.
     * @param value value to set the Okpo
     */
    public void setOkpo(String value) {
        setAttributeInternal(OKPO, value);
    }

    /**
     * Gets the attribute value for Kpp, using the alias name Kpp.
     * @return the value of Kpp
     */
    public String getKpp() {
        return (String) getAttributeInternal(KPP);
    }

    /**
     * Sets <code>value</code> as the attribute value for Kpp.
     * @param value value to set the Kpp
     */
    public void setKpp(String value) {
        setAttributeInternal(KPP, value);
    }

    /**
     * Gets the attribute value for Namefull, using the alias name Namefull.
     * @return the value of Namefull
     */
    public String getNamefull() {
        return (String) getAttributeInternal(NAMEFULL);
    }

    /**
     * Sets <code>value</code> as the attribute value for Namefull.
     * @param value value to set the Namefull
     */
    public void setNamefull(String value) {
        setAttributeInternal(NAMEFULL, value);
    }

    /**
     * Gets the attribute value for UrFiz, using the alias name UrFiz.
     * @return the value of UrFiz
     */
    public Integer getUrFiz() {
        return (Integer) getAttributeInternal(URFIZ);
    }

    /**
     * Sets <code>value</code> as the attribute value for UrFiz.
     * @param value value to set the UrFiz
     */
    public void setUrFiz(Integer value) {
        setAttributeInternal(URFIZ, value);
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
     * Gets the attribute value for Predefined, using the alias name Predefined.
     * @return the value of Predefined
     */
    public Integer getPredefined() {
        return (Integer) getAttributeInternal(PREDEFINED);
    }

    /**
     * Sets <code>value</code> as the attribute value for Predefined.
     * @param value value to set the Predefined
     */
    public void setPredefined(Integer value) {
        setAttributeInternal(PREDEFINED, value);
    }


    /**
     * Gets the attribute value for IsBuyer, using the alias name IsBuyer.
     * @return the value of IsBuyer
     */
    public Integer getIsBuyer() {
        return (Integer) getAttributeInternal(ISBUYER);
    }

    /**
     * Sets <code>value</code> as the attribute value for IsBuyer.
     * @param value value to set the IsBuyer
     */
    public void setIsBuyer(Integer value) {
        setAttributeInternal(ISBUYER, value);
    }

    /**
     * Gets the attribute value for IsMeasurer, using the alias name IsMeasurer.
     * @return the value of IsMeasurer
     */
    public Integer getIsMeasurer() {
        return (Integer) getAttributeInternal(ISMEASURER);
    }

    /**
     * Sets <code>value</code> as the attribute value for IsMeasurer.
     * @param value value to set the IsMeasurer
     */
    public void setIsMeasurer(Integer value) {
        setAttributeInternal(ISMEASURER, value);
    }

    /**
     * Gets the attribute value for IsSupplier, using the alias name IsSupplier.
     * @return the value of IsSupplier
     */
    public Integer getIsSupplier() {
        return (Integer) getAttributeInternal(ISSUPPLIER);
    }

    /**
     * Sets <code>value</code> as the attribute value for IsSupplier.
     * @param value value to set the IsSupplier
     */
    public void setIsSupplier(Integer value) {
        setAttributeInternal(ISSUPPLIER, value);
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
     * Gets the attribute value for Photo, using the alias name Photo.
     * @return the value of Photo
     */
    public BlobDomain getPhoto() {
        return (BlobDomain) getAttributeInternal(PHOTO);
    }

    /**
     * Sets <code>value</code> as the attribute value for Photo.
     * @param value value to set the Photo
     */
    public void setPhoto(BlobDomain value) {
        setAttributeInternal(PHOTO, value);
    }

    /**
     * Gets the attribute value for CityId, using the alias name CityId.
     * @return the value of CityId
     */
    public String getCityId() {
        return (String) getAttributeInternal(CITYID);
    }

    /**
     * Sets <code>value</code> as the attribute value for CityId.
     * @param value value to set the CityId
     */
    public void setCityId(String value) {
        setAttributeInternal(CITYID, value);
    }

    /**
     * Gets the attribute value for Datzam, using the alias name Datzam.
     * @return the value of Datzam
     */
    public Timestamp getDatzam() {
        return (Timestamp) getAttributeInternal(DATZAM);
    }

    /**
     * Sets <code>value</code> as the attribute value for Datzam.
     * @param value value to set the Datzam
     */
    public void setDatzam(Timestamp value) {
        setAttributeInternal(DATZAM, value);
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
     * Gets the attribute value for InfocardId, using the alias name InfocardId.
     * @return the value of InfocardId
     */
    public String getInfocardId() {
        return (String) getAttributeInternal(INFOCARDID);
    }

    /**
     * Sets <code>value</code> as the attribute value for InfocardId.
     * @param value value to set the InfocardId
     */
    public void setInfocardId(String value) {
        setAttributeInternal(INFOCARDID, value);
    }

    /**
     * @return the associated entity oracle.jbo.RowIterator.
     */
    public RowIterator getKontragents() {
        return (RowIterator) getAttributeInternal(KONTRAGENTS);
    }

    /**
     * @return the associated entity KontragentsImpl.
     */
    public KontragentsImpl getParentIdKontragents() {
        return (KontragentsImpl) getAttributeInternal(PARENTIDKONTRAGENTS);
    }

    /**
     * Sets <code>value</code> as the associated entity KontragentsImpl.
     */
    public void setParentIdKontragents(KontragentsImpl value) {
        setAttributeInternal(PARENTIDKONTRAGENTS, value);
    }

    /**
     * @return the associated entity oracle.jbo.RowIterator.
     */
    public RowIterator getCompaignsDetails() {
        return (RowIterator) getAttributeInternal(COMPAIGNSDETAILS);
    }

    /**
     * @return the associated entity oracle.jbo.RowIterator.
     */
    public RowIterator getContactDetails() {
        return (RowIterator) getAttributeInternal(CONTACTDETAILS);
    }

    /**
     * @return the associated entity oracle.jbo.RowIterator.
     */
    public RowIterator getOrders() {
        return (RowIterator) getAttributeInternal(ORDERS);
    }

    /**
     * @return the associated entity oracle.jbo.RowIterator.
     */
    public RowIterator getOrdersTpUslugi() {
        return (RowIterator) getAttributeInternal(ORDERSTPUSLUGI);
    }

    /**
     * @return the associated entity oracle.jbo.RowIterator.
     */
    public RowIterator getOrders1() {
        return (RowIterator) getAttributeInternal(ORDERS1);
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
    public RowIterator getOrdersTpUslugi1() {
        return (RowIterator) getAttributeInternal(ORDERSTPUSLUGI1);
    }

    /**
     * @return the associated entity oracle.jbo.RowIterator.
     */
    public RowIterator getOrdersTpRashody() {
        return (RowIterator) getAttributeInternal(ORDERSTPRASHODY);
    }

    /**
     * @return the associated entity oracle.jbo.RowIterator.
     */
    public RowIterator getOrdersTpNachislenia() {
        return (RowIterator) getAttributeInternal(ORDERSTPNACHISLENIA);
    }

    /**
     * @return the associated entity oracle.jbo.RowIterator.
     */
    public RowIterator getOrdersTpOplaty() {
        return (RowIterator) getAttributeInternal(ORDERSTPOPLATY);
    }

    /**
     * @return the associated entity oracle.jbo.RowIterator.
     */
    public RowIterator getCallLog() {
        return (RowIterator) getAttributeInternal(CALLLOG);
    }

    /**
     * @return the associated entity oracle.jbo.RowIterator.
     */
    public RowIterator getKontragSettings() {
        return (RowIterator) getAttributeInternal(KONTRAGSETTINGS);
    }

    /**
     * @return the associated entity oracle.jbo.RowIterator.
     */
    public RowIterator getProfitDistribTp() {
        return (RowIterator) getAttributeInternal(PROFITDISTRIBTP);
    }

    /**
     * @param id key constituent

     * @return a Key object based on given key constituents.
     */
    public static Key createPrimaryKey(String id) {
        return new Key(new Object[] { id });
    }


}

