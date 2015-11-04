package ua.divas.ejb.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

@Entity
@NamedQueries({ 
    @NamedQuery(name = "UserSettings.findAll", query = "select o from UserSettings o"),
    @NamedQuery(name = "UserSettings.findByZamer", query = "select o from UserSettings o where o.zamerkontragId = :zamerId")
})
@Table(name = "USER_SETTINGS")
public class UserSettings implements Serializable {
    private static final long serialVersionUID = 2140392193059182501L;
    @Column(name = "ACTIVITIES_ID", nullable = false, length = 50)
    private String activitiesId;
    @Column(name = "CURRENCY_ID", nullable = false, length = 50)
    private String currencyId;
    @Column(name = "DIVISION_ID", nullable = false, length = 50)
    private String divisionId;
    @Column(name = "FIRMA_ID", nullable = false, length = 50)
    private String firmaId;
    @Id
    @Column(nullable = false, length = 50)
    private String id;
    @Column(name = "KASSA_ID", nullable = false, length = 50)
    private String kassaId;
    @Column(name = "MAIN_USLUGA", nullable = false, length = 50)
    private String mainUsluga;
    @Column(name = "ZAMERKONTRAG_ID", length = 50)
    private String zamerkontragId;
    @ManyToOne
    @JoinColumn(name = "USER_ID")
    private Users users;

    public UserSettings() {
    }

    public UserSettings(String activitiesId, String currencyId, String divisionId, String firmaId, String id,
                        String kassaId, String mainUsluga, Users users, String zamerkontragId) {
        this.activitiesId = activitiesId;
        this.currencyId = currencyId;
        this.divisionId = divisionId;
        this.firmaId = firmaId;
        this.id = id;
        this.kassaId = kassaId;
        this.mainUsluga = mainUsluga;
        this.users = users;
        this.zamerkontragId = zamerkontragId;
    }

    public String getActivitiesId() {
        return activitiesId;
    }

    public void setActivitiesId(String activitiesId) {
        this.activitiesId = activitiesId;
    }

    public String getCurrencyId() {
        return currencyId;
    }

    public void setCurrencyId(String currencyId) {
        this.currencyId = currencyId;
    }

    public String getDivisionId() {
        return divisionId;
    }

    public void setDivisionId(String divisionId) {
        this.divisionId = divisionId;
    }

    public String getFirmaId() {
        return firmaId;
    }

    public void setFirmaId(String firmaId) {
        this.firmaId = firmaId;
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

    public String getMainUsluga() {
        return mainUsluga;
    }

    public void setMainUsluga(String mainUsluga) {
        this.mainUsluga = mainUsluga;
    }


    public String getZamerkontragId() {
        return zamerkontragId;
    }

    public void setZamerkontragId(String zamerkontragId) {
        this.zamerkontragId = zamerkontragId;
    }

    public Users getUsers() {
        return users;
    }

    public void setUsers(Users users) {
        this.users = users;
    }
}
