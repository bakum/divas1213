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
@NamedQueries({ @NamedQuery(name = "Notification.findAll", query = "select o from Notification o") })
public class Notification implements Serializable {
    private static final long serialVersionUID = 6440409594794566313L;
    private Integer client;
    @Column(length = 50)
    private String contact;
    @Temporal(TemporalType.DATE)
    @Column(nullable = false)
    private Date dat;
    @Column(nullable = false, length = 200)
    private String description;
    @Id
    @Column(nullable = false, length = 50)
    private String id;
    @Column(name = "OBJECT_ID", length = 50)
    private String objectId;
    private Integer server;
    @Column(name = "TRG_NAME", length = 50)
    private String trgName;
    @Column(name = "USER_ID", nullable = false, length = 50)
    private String userId;
    @Column(name = "USER_LOGIN", length = 50)
    private String userLogin;
    @Column(nullable = false)
    private Timestamp version;

    public Notification() {
    }

    public Notification(Integer client, String contact, Date dat, String description, String id, String objectId,
                        Integer server, String trgName, String userId, String userLogin, Timestamp version) {
        this.client = client;
        this.contact = contact;
        this.dat = dat;
        this.description = description;
        this.id = id;
        this.objectId = objectId;
        this.server = server;
        this.trgName = trgName;
        this.userId = userId;
        this.userLogin = userLogin;
        this.version = version;
    }

    public Integer getClient() {
        return client;
    }

    public void setClient(Integer client) {
        this.client = client;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public Date getDat() {
        return dat;
    }

    public void setDat(Date dat) {
        this.dat = dat;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getObjectId() {
        return objectId;
    }

    public void setObjectId(String objectId) {
        this.objectId = objectId;
    }

    public Integer getServer() {
        return server;
    }

    public void setServer(Integer server) {
        this.server = server;
    }

    public String getTrgName() {
        return trgName;
    }

    public void setTrgName(String trgName) {
        this.trgName = trgName;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getUserLogin() {
        return userLogin;
    }

    public void setUserLogin(String userLogin) {
        this.userLogin = userLogin;
    }

    public Timestamp getVersion() {
        return version;
    }

    public void setVersion(Timestamp version) {
        this.version = version;
    }
}
