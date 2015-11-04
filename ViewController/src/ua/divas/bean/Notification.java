package ua.divas.bean;

import java.io.Serializable;

import javax.faces.context.FacesContext;

import oracle.adf.share.ADFContext;
import oracle.adf.share.security.SecurityContext;

import org.apache.myfaces.trinidad.render.ExtendedRenderKitService;
import org.apache.myfaces.trinidad.util.Service;

import org.quartz.Job;
import org.quartz.JobDataMap;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.quartz.SchedulerException;

public class Notification implements Job, Serializable {
    @SuppressWarnings("compatibility:3193852193603616620")
    private static final long serialVersionUID = 1L;

    private String getSessionUser(ADFContext adfCtx) {
        //ADFContext adfCtx = ADFContext.getCurrent();
        SecurityContext secCntx = adfCtx.getSecurityContext();
        String user = secCntx.getUserPrincipal().getName();
        return user;
    }


    @Override
    public synchronized void execute(JobExecutionContext jec) throws JobExecutionException {
        System.out.println("Trigger description: " + jec.getTrigger().getDescription());
        System.out.println("Job description: " + jec.getJobDetail().getDescription());
        JobDataMap jobData = jec.getJobDetail().getJobDataMap();
        String user = (String) jobData.get("UserName");
        System.out.println("UserName: " + user);

        try {
            FacesContext ctx = (FacesContext) jec.getScheduler().getContext().get("FacesContext");
            ADFContext adfCtx = (ADFContext) jec.getScheduler().getContext().get("adfCtx");
            if (user == getSessionUser(adfCtx)) {
                System.out.println("Current user: " + getSessionUser(adfCtx));
                //ExtendedRenderKitService erks = Service.getService(ctx.getRenderKit(), ExtendedRenderKitService.class);
                //erks.addScript(ctx,
                //               "Growl('Новое напоминание!','Перейдите в панель оповещений чтобы прочитать!','notice')");
            }
        } catch (SchedulerException e) {
        }
        //FacesContext ctx = (FacesContext) jobData.get("FacesContext");


        /* if (user == getSessionUser()) {
            FacesContext context = FacesContext.getCurrentInstance();
            ExtendedRenderKitService erks = Service.getService(context.getRenderKit(), ExtendedRenderKitService.class);
            erks.addScript(context,
                           "Growl('Новое напоминание!','Перейдите в панель оповещений чтобы прочитать!','notice')");
            //erks.addScript(context, "Growl('Новое напоминание!','Перейдите в панель оповещений чтобы прочитать!','warning')");
            //erks.addScript(context, "Growl('Новое напоминание!','Перейдите в панель оповещений чтобы прочитать!','error')");
        } */
    }

}
