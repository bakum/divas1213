package ua.divas.bean.control;

import java.math.BigDecimal;

import java.util.UUID;

public class SupplierRecord {
    private String Id;
    private String kontragId;
    private String orderId;
    private boolean isIn;
    private BigDecimal summa;

    public SupplierRecord() {
        super();
    }

    public SupplierRecord(String kontragId, String orderId, BigDecimal summa) {
        this.kontragId = kontragId;
        this.orderId = orderId;
        this.summa = summa;
        this.isIn = false; 
        this.Id = UUID.randomUUID().toString();
    }
    
    public SupplierRecord(String Id, String kontragId, String orderId, BigDecimal summa) {
        this.kontragId = kontragId;
        this.orderId = orderId;
        this.summa = summa;
        this.isIn = false; 
        this.Id = Id;
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
