package ua.divas.bean.control;

import java.math.BigDecimal;

import java.util.UUID;

import oracle.adf.share.ADFContext;
import oracle.adf.share.security.SecurityContext;

public class SupplierRecord {
    
    private String Id;
    private String kontragId;
    private String orderId;
    private boolean isIn;
    private BigDecimal summa;
    private String userId;

    public SupplierRecord() {
        super();
    }

    public SupplierRecord(String kontragId, String orderId, BigDecimal summa) {
        this.kontragId = kontragId;
        this.orderId = orderId;
        this.summa = summa;
        this.isIn = false; 
        this.Id = UUID.randomUUID().toString();
        this.userId = getSessionUser();
    }
    
    public SupplierRecord(String Id, String kontragId, String orderId, BigDecimal summa) {
        this.kontragId = kontragId;
        this.orderId = orderId;
        this.summa = summa;
        this.isIn = false; 
        this.Id = Id;
        this.userId = getSessionUser();
    }

    public static final String getSessionUser() {
        ADFContext adfCtx = ADFContext.getCurrent();
        SecurityContext secCntx = adfCtx.getSecurityContext();
        String user = secCntx.getUserPrincipal().getName();
        return user;
    }

    public final void setUserId(String userId) {
        this.userId = userId;
    }

    public final String getUserId() {
        return userId;
    }

    public final void setIsIn(boolean isIn) {
        this.isIn = isIn;
    }

    public final boolean isIsIn() {
        return isIn;
    }

    public void setKontragId(String kontragId) {
        this.kontragId = kontragId;
    }

    public String getId() {
        return Id;
    }

    public String getKontragId() {
        return kontragId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public String getOrderId() {
        return orderId;
    }

    public void setSumma(BigDecimal summa) {
        this.summa = summa;
    }

    public BigDecimal getSumma() {
        return summa;
    }

}
