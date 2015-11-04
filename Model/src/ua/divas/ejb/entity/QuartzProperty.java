package ua.divas.ejb.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

@Entity
@NamedQueries({ @NamedQuery(name = "QuartzProperty.findAll", query = "select o from QuartzProperty o") })
@Table(name = "QUARTZ_PROPERTY")
public class QuartzProperty implements Serializable {
    private static final long serialVersionUID = -9076066633640443665L;
    @Column(name = "DATA_SOURCE", length = 60)
    private String dataSource;
    @Column(length = 60)
    private String driver;
    @Column(name = "DRIVER_DELEGATE", length = 60)
    private String driverDelegate;
    @Id
    @Column(nullable = false, length = 50)
    private String id;
    @Column(name = "INSTANCE_NAME", length = 60)
    private String instanceName;
    @Column(name = "JOBSTORE_CLASS", length = 60)
    private String jobstoreClass;
    @Column(name = "MAX_CONNECTIONS", length = 50)
    private String maxConnections;
    @Column(length = 50)
    private String password;
    @Column(name = "TABLE_PREFIX", length = 60)
    private String tablePrefix;
    @Column(name = "THREAD_COUNT", length = 60)
    private String threadCount;
    @Column(name = "THREADPOOL_CLASS", length = 50)
    private String threadpoolClass;
    @Column(name = "THREADS_CONTEXT", length = 60)
    private String threadsContext;
    @Column(length = 60)
    private String url;
    @Column(length = 50)
    private String usr;

    public QuartzProperty() {
    }

    public QuartzProperty(String dataSource, String driver, String driverDelegate, String id, String instanceName,
                          String jobstoreClass, String maxConnections, String password, String tablePrefix,
                          String threadCount, String threadpoolClass, String threadsContext, String url, String usr) {
        this.dataSource = dataSource;
        this.driver = driver;
        this.driverDelegate = driverDelegate;
        this.id = id;
        this.instanceName = instanceName;
        this.jobstoreClass = jobstoreClass;
        this.maxConnections = maxConnections;
        this.password = password;
        this.tablePrefix = tablePrefix;
        this.threadCount = threadCount;
        this.threadpoolClass = threadpoolClass;
        this.threadsContext = threadsContext;
        this.url = url;
        this.usr = usr;
    }

    public String getDataSource() {
        return dataSource;
    }

    public void setDataSource(String dataSource) {
        this.dataSource = dataSource;
    }

    public String getDriver() {
        return driver;
    }

    public void setDriver(String driver) {
        this.driver = driver;
    }

    public String getDriverDelegate() {
        return driverDelegate;
    }

    public void setDriverDelegate(String driverDelegate) {
        this.driverDelegate = driverDelegate;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getInstanceName() {
        return instanceName;
    }

    public void setInstanceName(String instanceName) {
        this.instanceName = instanceName;
    }

    public String getJobstoreClass() {
        return jobstoreClass;
    }

    public void setJobstoreClass(String jobstoreClass) {
        this.jobstoreClass = jobstoreClass;
    }

    public String getMaxConnections() {
        return maxConnections;
    }

    public void setMaxConnections(String maxConnections) {
        this.maxConnections = maxConnections;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getTablePrefix() {
        return tablePrefix;
    }

    public void setTablePrefix(String tablePrefix) {
        this.tablePrefix = tablePrefix;
    }

    public String getThreadCount() {
        return threadCount;
    }

    public void setThreadCount(String threadCount) {
        this.threadCount = threadCount;
    }

    public String getThreadpoolClass() {
        return threadpoolClass;
    }

    public void setThreadpoolClass(String threadpoolClass) {
        this.threadpoolClass = threadpoolClass;
    }

    public String getThreadsContext() {
        return threadsContext;
    }

    public void setThreadsContext(String threadsContext) {
        this.threadsContext = threadsContext;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getUsr() {
        return usr;
    }

    public void setUsr(String usr) {
        this.usr = usr;
    }
}
