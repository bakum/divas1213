package ua.divas.ejb.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

@Entity
@NamedQueries({ @NamedQuery(name = "WlsSettings.findAll", query = "select o from WlsSettings o") })
@Table(name = "WLS_SETTINGS")
public class WlsSettings implements Serializable {
    private static final long serialVersionUID = -85122396485016142L;
    @Column(nullable = false, length = 500)
    private String host;
    @Id
    @Column(nullable = false, length = 50)
    private String id;
    @Column(nullable = false, length = 200)
    private String password;
    @Column(nullable = false, length = 5)
    private String port;
    @Column(nullable = false, length = 200)
    private String username;

    public WlsSettings() {
    }

    public WlsSettings(String host, String id, String password, String port, String username) {
        this.host = host;
        this.id = id;
        this.password = password;
        this.port = port;
        this.username = username;
    }

    public String getHost() {
        return host;
    }

    public void setHost(String host) {
        this.host = host;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPort() {
        return port;
    }

    public void setPort(String port) {
        this.port = port;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
}
