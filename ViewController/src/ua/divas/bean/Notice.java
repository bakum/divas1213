package ua.divas.bean;

import java.io.Serializable;

import org.quartz.Job;
import org.quartz.JobDataMap;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

public class Notice implements Job, Serializable {
    
    @Override
    public synchronized void execute(JobExecutionContext jec) throws JobExecutionException {
        System.out.println("Trigger description: " + jec.getTrigger().getDescription());
        System.out.println("Job description: " + jec.getJobDetail().getDescription());
        
        JobDataMap jobData=jec.getJobDetail().getJobDataMap();
        String user=(String)jobData.get("UserName");
        
        System.out.println("Map UserName: " + user);
        SocketMediator.getSm().broadcast(user);
    }
}
