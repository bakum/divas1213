package ua.divas.bean.control;

import java.util.Date;
import java.util.UUID;

import javax.faces.context.FacesContext;
import javax.faces.event.ActionEvent;

import oracle.adf.model.BindingContext;
import oracle.adf.model.binding.DCDataControl;
import oracle.adf.share.ADFContext;
import oracle.adf.share.security.SecurityContext;

import org.quartz.CronScheduleBuilder;
import org.quartz.CronTrigger;
import org.quartz.JobBuilder;
import org.quartz.JobDataMap;
import org.quartz.JobDetail;
import org.quartz.Trigger;
import org.quartz.TriggerBuilder;

import ua.divas.classes.StartSchedulerQuartz;
import ua.divas.module.AppModuleImpl;
import ua.divas.bean.Notice;
import ua.divas.bean.Notification;

public class ReminderBean {
    
    private String getSessionUser() {
        ADFContext adfCtx = ADFContext.getCurrent();
        SecurityContext secCntx = adfCtx.getSecurityContext();
        String user = secCntx.getUserPrincipal().getName();
        return user;
    }

    public void run() throws Exception {

        String cutid = UUID.randomUUID().toString().substring(0, 7);
        JobDetail job =
            JobBuilder.newJob(Notice.class).withDescription("trigger" + cutid).withIdentity("job" + cutid,
                                                                                                      "group").build();
        job.getJobDataMap().put("UserName", getSessionUser());
        
        long t = new Date().getTime();
        Date afterAddingTenMins=new Date(t + (1 * 60000));
        Date runDate = afterAddingTenMins;
        /* Trigger trigger =
            TriggerBuilder.newTrigger()
            .startAt(runDate)
            .withDescription(getSessionUser())
            .withIdentity("trigger"+cutid,"group").build(); */
        
        Trigger trigger = (Trigger) TriggerBuilder.newTrigger()
                .withDescription(getSessionUser())
                .withIdentity("trigger" + cutid, "group").forJob(job)
                .withSchedule(CronScheduleBuilder.cronSchedule("0 0/2 * * * ?")).build();
        if (StartSchedulerQuartz.sched != null) {
            StartSchedulerQuartz.sched.scheduleJob(job, trigger);
            System.out.println("------- Новое напоминание! ----------------");

            BindingContext bindingContext = BindingContext.getCurrent();
            DCDataControl dc  = bindingContext.findDataControl("AppModuleDataControl"); // Name of application module in datacontrolBinding.cpx
            AppModuleImpl am = (AppModuleImpl)dc.getDataProvider();
            am.addNotification(cutid, "alskjdhflaskjhfd", runDate,null,null);

            return;
        }
        System.out.println("-------Нихрена не получилось ----------------");
        //creatNotification(cutid);

    }

    public void onReminder(ActionEvent actionEvent) throws Exception {
        run();
    }
}
