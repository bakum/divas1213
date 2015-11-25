package ua.divas.bean;

import java.io.Serializable;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.sql.Statement;

import javax.naming.InitialContext;
import javax.naming.NamingException;

import javax.sql.DataSource;

import org.quartz.Job;
import org.quartz.JobDataMap;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

import oracle.jdbc.OracleConnection;

public class BallansJob implements Job, Serializable {

    @Override
    public synchronized void execute(JobExecutionContext jec) throws JobExecutionException {
        System.out.println("Trigger description: " + jec.getTrigger().getDescription());
        System.out.println("Job description: " + jec.getJobDetail().getDescription());

        JobDataMap jobData = jec.getJobDetail().getJobDataMap();
        String user = (String) jobData.get("UserName");
        oracle.jbo.domain.Date f_date = (oracle.jbo.domain.Date) jobData.get("f_date");
        oracle.jbo.domain.Date l_date = (oracle.jbo.domain.Date) jobData.get("l_date");


        try {
            callStoredProcedure("report_pkg.refresh_ballans(?,?)", new Object[] { f_date, l_date });
        } catch (SQLException e) {
        }
        /* try {
            Thread.sleep(9000);
        } catch (InterruptedException ex) {
            //ToCatchOrNot
        } */
        System.out.println("Map UserName: " + user);
        System.out.println("Map f_date: " + f_date.toString());
        System.out.println("Map l_date: " + l_date.toString());
        SocketMediator.getSm().broadcast(user + "Ballans");
    }

    private void callStoredProcedure (String stmt, Object[] bindVars) throws SQLException {
        OracleConnection conn = connect();
        PreparedStatement st = null;
        try {
            st = conn.prepareStatement("begin "+stmt+";end;",0);
            if (bindVars != null) {
              // 2. Loop over values for the bind variables passed in, if any
              for (int z = 0; z < bindVars.length; z++) {
                // 3. Set the value of each bind variable in the statement
                st.setObject(z + 1, bindVars[z]);
              }
            }
            // 4. Execute the statement
            st.executeUpdate();

            //rs.close();
            st.close();
            conn.close();
            System.out.println("Query executed");
        } catch (SQLException ex) {
            if (conn != null) {
                conn.close();
            }
            throw ex;
        }
    }

    private OracleConnection connect() {
        InitialContext ic;
        OracleConnection con = null;
        try {
            ic = new InitialContext();
            DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/divasDS");
            con = (OracleConnection) ds.getConnection();
        } catch (NamingException e) {
            // logger.warning("Unable to find 'jdbc/HrDSDS' datasource.");
            System.out.println("Unable to find 'java:comp/env/jdbc/divasDS' datasource.");
        } catch (SQLException e) {
            //logger.severe("Unexpected error: ", e);
            System.out.println("Unexpected error: " + e);
        }
        return con;
    }
}
