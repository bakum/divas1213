package ua.divas.ejb.entity;

import java.io.Serializable;

import java.sql.Timestamp;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;

@Entity
@NamedQueries({ 
    @NamedQuery(name = "Users.findAll", query = "select o from Users o"),
    @NamedQuery(name = "Users.findById", query = "SELECT u FROM Users u WHERE u.id = :id")
    })
public class Users implements Serializable {
    private static final long serialVersionUID = -4763901190420720369L;
    @Column(nullable = false, length = 100)
    private String email;
    @Column(name = "FIRST_NAME", nullable = false, length = 50)
    private String firstName;
    @Id
    @Column(nullable = false, length = 50)
    private String id;
    @Column(name = "IS_ADMIN", nullable = false)
    private Integer isAdmin;
    @Column(name = "IS_ZAMER")
    private Integer isZamer;
    @Column(name = "LAST_NAME", nullable = false, length = 50)
    private String lastName;
    @Column(nullable = false, unique = true, length = 30)
    private String login;
    @Column(name = "PASS_WD", nullable = false, length = 100)
    private String passWd;
    @Column(nullable = false)
    private Integer predefined;
    @Column(name = "U_DESCRIPTION", length = 1000)
    private String uDescription;
    @Column(nullable = false)
    private Timestamp version;
    @OneToMany(mappedBy = "users", cascade = { CascadeType.PERSIST, CascadeType.MERGE })
    private List<UserSettings> userSettingsList;

    public Users() {
    }

    public Users(String email, String firstName, String id, Integer isAdmin, Integer isZamer, String lastName,
                 String login, String passWd, Integer predefined, String uDescription, Timestamp version) {
        this.email = email;
        this.firstName = firstName;
        this.id = id;
        this.isAdmin = isAdmin;
        this.isZamer = isZamer;
        this.lastName = lastName;
        this.login = login;
        this.passWd = passWd;
        this.predefined = predefined;
        this.uDescription = uDescription;
        this.version = version;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Integer getIsAdmin() {
        return isAdmin;
    }

    public void setIsAdmin(Integer isAdmin) {
        this.isAdmin = isAdmin;
    }

    public Integer getIsZamer() {
        return isZamer;
    }

    public void setIsZamer(Integer isZamer) {
        this.isZamer = isZamer;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getPassWd() {
        return passWd;
    }

    public void setPassWd(String passWd) {
        this.passWd = passWd;
    }

    public Integer getPredefined() {
        return predefined;
    }

    public void setPredefined(Integer predefined) {
        this.predefined = predefined;
    }

    public String getUDescription() {
        return uDescription;
    }

    public void setUDescription(String uDescription) {
        this.uDescription = uDescription;
    }

    public Timestamp getVersion() {
        return version;
    }

    public void setVersion(Timestamp version) {
        this.version = version;
    }

    public List<UserSettings> getUserSettingsList() {
        return userSettingsList;
    }

    public void setUserSettingsList(List<UserSettings> userSettingsList) {
        this.userSettingsList = userSettingsList;
    }

    public UserSettings addUserSettings(UserSettings userSettings) {
        getUserSettingsList().add(userSettings);
        userSettings.setUsers(this);
        return userSettings;
    }

    public UserSettings removeUserSettings(UserSettings userSettings) {
        getUserSettingsList().remove(userSettings);
        userSettings.setUsers(null);
        return userSettings;
    }
}
