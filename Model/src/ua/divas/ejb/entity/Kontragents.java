package ua.divas.ejb.entity;

import java.io.Serializable;

import java.sql.Timestamp;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;

@Entity
@NamedQueries({
    @NamedQuery(name = "Kontragents.findAll", query = "select o from Kontragents o"),
    @NamedQuery(name = "Kontragents.findByName", query = "select o from Kontragents o where o.fullname LIKE :name") 
})
public class Kontragents implements Serializable {
    private static final long serialVersionUID = -5699762419615160763L;
    @Column(nullable = false)
    private Integer deleted;
    @Column(nullable = false, length = 150)
    private String fullname;
    @Id
    @Column(nullable = false, length = 50)
    private String id;
    @Column(length = 50)
    private String inn;
    @Column(name = "IS_BUYER", nullable = false)
    private Integer isBuyer;
    @Column(name = "IS_GROUP", nullable = false)
    private Integer isGroup;
    @Column(name = "IS_MEASURER", nullable = false)
    private Integer isMeasurer;
    @Column(name = "IS_SUPPLIER", nullable = false)
    private Integer isSupplier;
    @Column(length = 50)
    private String kpp;
    @Column(length = 150)
    private String namefull;
    @Column(length = 50)
    private String okpo;
    @Column(nullable = false)
    private Integer predefined;
    @Column(name = "UR_FIZ", nullable = false)
    private Integer urFiz;
    @Column(name = "USER_ID", length = 50)
    private String userId;
    @Column(nullable = false)
    private Timestamp version;
    @ManyToOne
    @JoinColumn(name = "PARENT_ID")
    private Kontragents kontragents;
    @OneToMany(mappedBy = "kontragents", cascade = { CascadeType.PERSIST, CascadeType.MERGE })
    private List<Kontragents> kontragentsList;

    public Kontragents() {
    }

    public Kontragents(Integer deleted, String fullname, String id, String inn, Integer isBuyer, Integer isGroup,
                       Integer isMeasurer, Integer isSupplier, String kpp, String namefull, String okpo,
                       Kontragents kontragents, Integer predefined, Integer urFiz, String userId, Timestamp version) {
        this.deleted = deleted;
        this.fullname = fullname;
        this.id = id;
        this.inn = inn;
        this.isBuyer = isBuyer;
        this.isGroup = isGroup;
        this.isMeasurer = isMeasurer;
        this.isSupplier = isSupplier;
        this.kpp = kpp;
        this.namefull = namefull;
        this.okpo = okpo;
        this.kontragents = kontragents;
        this.predefined = predefined;
        this.urFiz = urFiz;
        this.userId = userId;
        this.version = version;
    }

    public Integer getDeleted() {
        return deleted;
    }

    public void setDeleted(Integer deleted) {
        this.deleted = deleted;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getInn() {
        return inn;
    }

    public void setInn(String inn) {
        this.inn = inn;
    }

    public Integer getIsBuyer() {
        return isBuyer;
    }

    public void setIsBuyer(Integer isBuyer) {
        this.isBuyer = isBuyer;
    }

    public Integer getIsGroup() {
        return isGroup;
    }

    public void setIsGroup(Integer isGroup) {
        this.isGroup = isGroup;
    }

    public Integer getIsMeasurer() {
        return isMeasurer;
    }

    public void setIsMeasurer(Integer isMeasurer) {
        this.isMeasurer = isMeasurer;
    }

    public Integer getIsSupplier() {
        return isSupplier;
    }

    public void setIsSupplier(Integer isSupplier) {
        this.isSupplier = isSupplier;
    }

    public String getKpp() {
        return kpp;
    }

    public void setKpp(String kpp) {
        this.kpp = kpp;
    }

    public String getNamefull() {
        return namefull;
    }

    public void setNamefull(String namefull) {
        this.namefull = namefull;
    }

    public String getOkpo() {
        return okpo;
    }

    public void setOkpo(String okpo) {
        this.okpo = okpo;
    }


    public Integer getPredefined() {
        return predefined;
    }

    public void setPredefined(Integer predefined) {
        this.predefined = predefined;
    }

    public Integer getUrFiz() {
        return urFiz;
    }

    public void setUrFiz(Integer urFiz) {
        this.urFiz = urFiz;
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

    public Kontragents getKontragents() {
        return kontragents;
    }

    public void setKontragents(Kontragents kontragents) {
        this.kontragents = kontragents;
    }

    public List<Kontragents> getKontragentsList() {
        return kontragentsList;
    }

    public void setKontragentsList(List<Kontragents> kontragentsList) {
        this.kontragentsList = kontragentsList;
    }

    public Kontragents addKontragents(Kontragents kontragents) {
        getKontragentsList().add(kontragents);
        kontragents.setKontragents(this);
        return kontragents;
    }

    public Kontragents removeKontragents(Kontragents kontragents) {
        getKontragentsList().remove(kontragents);
        kontragents.setKontragents(null);
        return kontragents;
    }
}
