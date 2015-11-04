package ua.divas.view;

import java.math.BigDecimal;

import java.sql.Timestamp;

import oracle.jbo.AttributeList;
import oracle.jbo.RowSet;
import oracle.jbo.server.AttributeDefImpl;
import oracle.jbo.server.ViewRowImpl;

import ua.divas.model.OrdersTpOplatyImpl;
// ---------------------------------------------------------------------
// ---    File generated by Oracle ADF Business Components Design Time.
// ---    Sun Feb 22 15:10:28 EET 2015
// ---    Custom code may be added to this class.
// ---    Warning: Do not modify method signatures of generated methods.
// ---------------------------------------------------------------------
public class OrdersTpOplatyViewRowImpl extends ViewRowImpl {


    public static final int ENTITY_ORDERSTPOPLATY = 0;

    @Override
    public boolean isAttributeUpdateable(int i) {
        BigDecimal editable = this.getOtpoEditable();
        if (editable.intValue()==0) {
            return false;
        } else { 
        return super.isAttributeUpdateable(i);
            }
    }

    @Override
    protected void create(AttributeList attributeList) {
        this.setOtpoEditable(new BigDecimal(1));
        super.create(attributeList);
    }

    /**
     * AttributesEnum: generated enum for identifying attributes and accessors. DO NOT MODIFY.
     */
    public enum AttributesEnum {
        Id,
        OrderId,
        Dat,
        Sum1,
        UserId,
        Comments,
        OtpoEditable,
        ZamerId,
        KassaId,
        OrdersView1,
        UsersView1,
        KontragentsView1,
        KassaSettingsView1;
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
    public static final int ORDERID = AttributesEnum.OrderId.index();
    public static final int DAT = AttributesEnum.Dat.index();
    public static final int SUM1 = AttributesEnum.Sum1.index();
    public static final int USERID = AttributesEnum.UserId.index();
    public static final int COMMENTS = AttributesEnum.Comments.index();
    public static final int OTPOEDITABLE = AttributesEnum.OtpoEditable.index();
    public static final int ZAMERID = AttributesEnum.ZamerId.index();
    public static final int KASSAID = AttributesEnum.KassaId.index();
    public static final int ORDERSVIEW1 = AttributesEnum.OrdersView1.index();
    public static final int USERSVIEW1 = AttributesEnum.UsersView1.index();
    public static final int KONTRAGENTSVIEW1 = AttributesEnum.KontragentsView1.index();
    public static final int KASSASETTINGSVIEW1 = AttributesEnum.KassaSettingsView1.index();

    /**
     * This is the default constructor (do not remove).
     */
    public OrdersTpOplatyViewRowImpl() {
    }

    /**
     * Gets OrdersTpOplaty entity object.
     * @return the OrdersTpOplaty
     */
    public OrdersTpOplatyImpl getOrdersTpOplaty() {
        return (OrdersTpOplatyImpl) getEntity(ENTITY_ORDERSTPOPLATY);
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
     * Gets the attribute value for ORDER_ID using the alias name OrderId.
     * @return the ORDER_ID
     */
    public String getOrderId() {
        return (String) getAttributeInternal(ORDERID);
    }

    /**
     * Sets <code>value</code> as attribute value for ORDER_ID using the alias name OrderId.
     * @param value value to set the ORDER_ID
     */
    public void setOrderId(String value) {
        setAttributeInternal(ORDERID, value);
    }

    /**
     * Gets the attribute value for DAT using the alias name Dat.
     * @return the DAT
     */
    public Timestamp getDat() {
        return (Timestamp) getAttributeInternal(DAT);
    }

    /**
     * Sets <code>value</code> as attribute value for DAT using the alias name Dat.
     * @param value value to set the DAT
     */
    public void setDat(Timestamp value) {
        setAttributeInternal(DAT, value);
    }


    /**
     * Gets the attribute value for the calculated attribute Sum1.
     * @return the Sum1
     */
    public BigDecimal getSum1() {
        return (BigDecimal) getAttributeInternal(SUM1);
    }

    /**
     * Sets <code>value</code> as attribute value for SUM using the alias name Sum1.
     * @param value value to set the SUM
     */
    public void setSum1(BigDecimal value) {
        setAttributeInternal(SUM1, value);
    }

    /**
     * Gets the attribute value for USER_ID using the alias name UserId.
     * @return the USER_ID
     */
    public String getUserId() {
        return (String) getAttributeInternal(USERID);
    }

    /**
     * Sets <code>value</code> as attribute value for USER_ID using the alias name UserId.
     * @param value value to set the USER_ID
     */
    public void setUserId(String value) {
        setAttributeInternal(USERID, value);
    }

    /**
     * Gets the attribute value for COMMENTS using the alias name Comments.
     * @return the COMMENTS
     */
    public String getComments() {
        return (String) getAttributeInternal(COMMENTS);
    }

    /**
     * Sets <code>value</code> as attribute value for COMMENTS using the alias name Comments.
     * @param value value to set the COMMENTS
     */
    public void setComments(String value) {
        setAttributeInternal(COMMENTS, value);
    }

    /**
     * Gets the attribute value for the calculated attribute OtpoEditable.
     * @return the OtpoEditable
     */
    public BigDecimal getOtpoEditable() {
        return (BigDecimal) getAttributeInternal(OTPOEDITABLE);
    }

    /**
     * Sets <code>value</code> as the attribute value for the calculated attribute OtpoEditable.
     * @param value value to set the  OtpoEditable
     */
    public void setOtpoEditable(BigDecimal value) {
        setAttributeInternal(OTPOEDITABLE, value);
    }

    /**
     * Gets the attribute value for ZAMER_ID using the alias name ZamerId.
     * @return the ZAMER_ID
     */
    public String getZamerId() {
        return (String) getAttributeInternal(ZAMERID);
    }

    /**
     * Sets <code>value</code> as attribute value for ZAMER_ID using the alias name ZamerId.
     * @param value value to set the ZAMER_ID
     */
    public void setZamerId(String value) {
        setAttributeInternal(ZAMERID, value);
    }


    /**
     * Gets the attribute value for KASSA_ID using the alias name KassaId.
     * @return the KASSA_ID
     */
    public String getKassaId() {
        return (String) getAttributeInternal(KASSAID);
    }

    /**
     * Sets <code>value</code> as attribute value for KASSA_ID using the alias name KassaId.
     * @param value value to set the KASSA_ID
     */
    public void setKassaId(String value) {
        setAttributeInternal(KASSAID, value);
    }


    /**
     * Gets the view accessor <code>RowSet</code> OrdersView1.
     */
    public RowSet getOrdersView1() {
        return (RowSet) getAttributeInternal(ORDERSVIEW1);
    }

    /**
     * Gets the view accessor <code>RowSet</code> UsersView1.
     */
    public RowSet getUsersView1() {
        return (RowSet) getAttributeInternal(USERSVIEW1);
    }

    /**
     * Gets the view accessor <code>RowSet</code> KontragentsView1.
     */
    public RowSet getKontragentsView1() {
        return (RowSet) getAttributeInternal(KONTRAGENTSVIEW1);
    }

    /**
     * Gets the view accessor <code>RowSet</code> KassaSettingsView1.
     */
    public RowSet getKassaSettingsView1() {
        return (RowSet) getAttributeInternal(KASSASETTINGSVIEW1);
    }
}

