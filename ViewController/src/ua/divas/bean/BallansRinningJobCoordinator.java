package ua.divas.bean;

import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;

import java.util.concurrent.TimeUnit;

import javax.faces.context.FacesContext;
import javax.faces.event.ActionEvent;

import oracle.adf.model.BindingContext;
import oracle.adf.model.binding.DCBindingContainer;
import oracle.adf.model.binding.DCIteratorBinding;
import oracle.adf.view.rich.context.AdfFacesContext;

import oracle.binding.BindingContainer;
import oracle.binding.OperationBinding;

import org.apache.myfaces.trinidad.render.ExtendedRenderKitService;
import org.apache.myfaces.trinidad.util.Service;

public class BallansRinningJobCoordinator implements Runnable {

    private ActiveBean activeBean;

    public void runRefreshBallansJob(ActionEvent ae) {
        // start job in parallel thread
        // pass in the activeBean as the object to inform of the progress of the big job

        // setup a timer that queues the events (in a loop)
        ScheduledExecutorService ses = Executors.newScheduledThreadPool(1);
        ses.schedule(this, 1, TimeUnit.SECONDS); // let's wait one second before starting the job

        
        FacesContext context = FacesContext.getCurrentInstance();
        ExtendedRenderKitService erks = Service.getService(context.getRenderKit(), ExtendedRenderKitService.class);
        erks.addScript(context, "Growl('Внимание'," + "'Баланс запущен в расчет!','warning')");
        // then complete the synchronous request

    }


    public void run() {
        System.out.println("START to process recalc ballans");
        //activeBean.triggerDataUpdate("Job Start");    
        // normally you would do the real work such as processing the big file here
        //for (int i = 0; i < 10; i++) { // sleep between 0 and 2 seconds
        try {
            Thread.sleep(9000);
            //onExecute(null);
        } catch (InterruptedException e) {
        }
        //activeBean.triggerDataUpdate((i + 1) * 10 + " %");
        //System.out.println("Job Progress " + (i + 1) * 10 + " %");
        //}
        activeBean.triggerDataUpdate("BallansJobDone");
        System.out.println("STOP process recalc ballans");

    }


    public ActiveBean getActiveBean() {
        return activeBean;
    }

    public void setActiveBean(ActiveBean activeBean) {
        this.activeBean = activeBean;
    }
}
