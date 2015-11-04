package ua.divas.classes;

import java.io.IOException;

import java.util.Properties;

import java.util.logging.Level;
import java.util.logging.Logger;

import javax.faces.context.FacesContext;

import javax.servlet.GenericServlet;

import javax.servlet.ServletConfig;

import javax.servlet.ServletException;

import javax.servlet.ServletRequest;

import javax.servlet.ServletResponse;

import oracle.adf.share.ADFContext;

import org.quartz.Scheduler;

import org.quartz.SchedulerException;
import org.quartz.SchedulerFactory;

import org.quartz.impl.StdSchedulerFactory;

import ua.divas.ejb.entity.DataQuery;
import ua.divas.ejb.entity.QuartzProperty;

public class StartSchedulerQuartz extends GenericServlet {
    @SuppressWarnings("compatibility:2272303327017717660")
    private static final long serialVersionUID = 1L;

    public static Scheduler sched;
    private QuartzProperty p;

    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        if (DataQuery.getAllQuartzSettings().size() > 0) {
            p = DataQuery.getCurrentQuartzSettings();
            Properties prop = new Properties();

            prop.setProperty("org.quartz.scheduler.instanceName", p.getInstanceName());
            prop.setProperty("org.quartz.threadPool.class", p.getThreadpoolClass());
            prop.setProperty("org.quartz.threadPool.threadCount", p.getThreadCount());

            prop.setProperty("org.quartz.threadPool.threadsInheritContextClassLoaderOfInitializingThread",
                             p.getThreadsContext());

            prop.setProperty("org.quartz.jobStore.class", p.getJobstoreClass());
            prop.setProperty("org.quartz.jobStore.driverDelegateClass", p.getDriverDelegate());
            prop.setProperty("org.quartz.jobStore.dataSource", p.getDataSource());
            prop.setProperty("org.quartz.jobStore.tablePrefix", p.getTablePrefix());

            prop.setProperty("org.quartz.dataSource.divas.driver", p.getDriver());
            prop.setProperty("org.quartz.dataSource.divas.URL", p.getUrl());
            prop.setProperty("org.quartz.dataSource.divas.user", p.getUsr());
            prop.setProperty("org.quartz.dataSource.divas.password", p.getPassword());
            prop.setProperty("org.quartz.dataSource.divas.maxConnections", p.getMaxConnections());

            try {
                SchedulerFactory sf = new StdSchedulerFactory(prop);
                sched = sf.getScheduler();
                //FacesContext context = FacesContext.getCurrentInstance();
                //sched.getContext().put("FacesContext", FacesContext.getCurrentInstance());
                //sched.getContext().put("adfCtx", ADFContext.getCurrent());
                sched.start();
                System.out.println("Scheduler was started");

            } catch (SchedulerException e) {
                System.out.println("Error: " + e);
            }

        } else {
            System.out.println("Have not Quartz settings in the database!");
        }

    }

    public void destroy() {

        try {
            sched.shutdown();
            System.out.println("Scheduler was stopped");
        } catch (SchedulerException ex) {
            Logger.getLogger(StartSchedulerQuartz.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    @Override
    public void service(ServletRequest arg0, ServletResponse arg1) 
        throws ServletException, IOException {

    }
}
