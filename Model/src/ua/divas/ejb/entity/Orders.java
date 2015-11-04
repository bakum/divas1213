package ua.divas.ejb.entity;

import java.io.Serializable;

import java.sql.Timestamp;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@NamedQueries({ 
    @NamedQuery(name = "Orders.findAll", query = "select o from Orders o"),
    @NamedQuery(name = "Orders.findByZamer", query = "select o from Orders o where o.zamerId = :id")
})
public class Orders implements Serializable {
    private static final long serialVersionUID = 3252839660604833160L;
    @Column(name = "ACTIVITIES_ID", nullable = false, length = 50)
    private String activitiesId;
    @Column(name = "CURR_ID", nullable = false, length = 50)
    private String currId;
    @Temporal(TemporalType.DATE)
    @Column(nullable = false)
    private Date dat;
    @Temporal(TemporalType.DATE)
    @Column(name = "DAT_COMPLETE")
    private Date datComplete;
    @Temporal(TemporalType.DATE)
    @Column(name = "DAT_ZAM", nullable = false)
    private Date datZam;
    @Column(nullable = false)
    private Integer deleted;
    @Column(length = 2000)
    private String discription;
    @Column(name = "DIVISION_ID", nullable = false, length = 50)
    private String divisionId;
    @Column(name = "FIRM_ID", nullable = false, length = 50)
    private String firmId;
    @Id
    @Column(nullable = false, length = 50)
    private String id;
    @Column(name = "KASSA_ID", nullable = false, length = 50)
    private String kassaId;
    @Column(name = "KONTRAG_ID", nullable = false, length = 50)
    private String kontragId;
    @Column(nullable = false)
    private Long kratnost;
    @Column(nullable = false)
    private Long kurs;
    @Column(nullable = false, length = 50)
    private String num;
    @Column(nullable = false)
    private Integer posted;
    @Column(name = "STATUS_ID", nullable = false, length = 50)
    private String statusId;
    @Column(name = "SUMM_PLAN", nullable = false)
    private Long summPlan;
    @Column(name = "TIME_ZAM", nullable = false, length = 5)
    private String timeZam;
    @Column(name = "USER_ID", nullable = false, length = 50)
    private String userId;
    @Column(nullable = false)
    private Timestamp version;
    @Column(name = "ZAMER_ID", length = 50)
    private String zamerId;

    public Orders() {
    }

    public Orders(String activitiesId, String currId, Date dat, Date datComplete, Date datZam, Integer deleted,
                  String discription, String divisionId, String firmId, String id, String kassaId, String kontragId,
                  Long kratnost, Long kurs, String num, Integer posted, String statusId, Long summPlan, String timeZam,
                  String userId, Timestamp version, String zamerId) {
        this.activitiesId = activitiesId;
        this.currId = currId;
        this.dat = dat;
        this.datComplete = datComplete;
        this.datZam = datZam;
        this.deleted = deleted;
        this.discription = discription;
        this.divisionId = divisionId;
        this.firmId = firmId;
        this.id = id;
        this.kassaId = kassaId;
        this.kontragId = kontragId;
        this.kratnost = kratnost;
        this.kurs = kurs;
        this.num = num;
        this.posted = posted;
        this.statusId = statusId;
        this.summPlan = summPlan;
        this.timeZam = timeZam;
        this.userId = userId;
        this.version = version;
        this.zamerId = zamerId;
    }

    public String getActivitiesId() {
        return activitiesId;
    }

    public void setActivitiesId(String activitiesId) {
        this.activitiesId = activitiesId;
    }

    public String getCurrId() {
        return currId;
    }

    public void setCurrId(String currId) {
        this.currId = currId;
    }

    public Date getDat() {
        return dat;
    }

    public void setDat(Date dat) {
        this.dat = dat;
    }

    public Date getDatComplete() {
        return datComplete;
    }

    public void setDatComplete(Date datComplete) {
        this.datComplete = datComplete;
    }

    public Date getDatZam() {
        return datZam;
    }

    public void setDatZam(Date datZam) {
        this.datZam = datZam;
    }

    public Integer getDeleted() {
        return deleted;
    }

    public void setDeleted(Integer deleted) {
        this.deleted = deleted;
    }

    public String getDiscription() {
        return discription;
    }

    public void setDiscription(String discription) {
        this.discription = discription;
    }

    public String getDivisionId() {
        return divisionId;
    }

    public void setDivisionId(String divisionId) {
        this.divisionId = divisionId;
    }

    public String getFirmId() {
        return firmId;
    }

    public void setFirmId(String firmId) {
        this.firmId = firmId;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getKassaId() {
        return kassaId;
    }

    public void setKassaId(String kassaId) {
        this.kassaId = kassaId;
    }

    public String getKontragId() {
        return kontragId;
    }

    public void setKontragId(String kontragId) {
        this.kontragId = kontragId;
    }

    public Long getKratnost() {
        return kratnost;
    }

    public void setKratnost(Long kratnost) {
        this.kratnost = kratnost;
    }

    public Long getKurs() {
        return kurs;
    }

    public void setKurs(Long kurs) {
        this.kurs = kurs;
    }

    public String getNum() {
        return num;
    }

    public void setNum(String num) {
        this.num = num;
    }

    public Integer getPosted() {
        return posted;
    }

    public void setPosted(Integer posted) {
        this.posted = posted;
    }

    public String getStatusId() {
        return statusId;
    }

    public void setStatusId(String statusId) {
        this.statusId = statusId;
    }

    public Long getSummPlan() {
        return summPlan;
    }

    public void setSummPlan(Long summPlan) {
        this.summPlan = summPlan;
    }

    public String getTimeZam() {
        return timeZam;
    }

    public void setTimeZam(String timeZam) {
        this.timeZam = timeZam;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public Timestamp getVersion() {
        return version;
    }

    public void setVersion(Timestamp version) {
        this.version = version;
    }

    public String getZamerId() {
        return zamerId;
    }

    public void setZamerId(String zamerId) {
        this.zamerId = zamerId;
    }
}
