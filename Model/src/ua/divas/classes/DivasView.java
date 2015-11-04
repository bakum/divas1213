package ua.divas.classes;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Types;

import oracle.adf.share.ADFContext;
import oracle.adf.share.security.SecurityContext;

import oracle.jbo.CriteriaClauses;
import oracle.jbo.JboException;
import oracle.jbo.Row;
import oracle.jbo.ViewCriteria;
import oracle.jbo.server.ViewObjectImpl;

public class DivasView extends ViewObjectImpl {
    public DivasView() {
        super();
    }

     @Override
    public CriteriaClauses buildViewCriteriaClauses(ViewCriteria viewCriteria) {
        // TODO Implement this method
        viewCriteria.setUpperColumns(true);
        return super.buildViewCriteriaClauses(viewCriteria);
    } 

    @Override
    public void insertRow(Row row) {
        super.insertRow(row);
        row.removeAndRetain();
        first();
        previous();
        getDefaultRowSet().insertRow(row);
    }
     
    public String getSessionUser() {
        ADFContext adfCtx = ADFContext.getCurrent();
        SecurityContext secCntx = adfCtx.getSecurityContext();
        String user = secCntx.getUserPrincipal().getName();
        //String _user = secCntx.getUserName();
        //Map sessionScope = ADFContext.getCurrent().getSessionScope();
        //String userName = (String)sessionScope.get("userName");
        return user;
    }

    protected static int VARCHAR2 = Types.VARCHAR;
    protected static int NUMBER = Types.NUMERIC;
    protected static int DATE = Types.DATE;

    public String getSessionUserId() {
        String _id = (String)callStoredFunction(VARCHAR2, "USR_SETT.GET_USERID(?)", new Object[] { getSessionUser() });
        if (_id.equals("00000000-0000-0000-0000-000000000000"))
            return "e6d54d79-12cc-c904-e040-007f010020da";
        else
            return _id;
    }
    
    public String getCustomerParentId() {
        return (String)callStoredFunction(VARCHAR2,"UTILITY.RETRIEVE_CUSTOMER_PARENTID", new Object[] {});
    }
    
    public String getZamerParentId() {
        return (String)callStoredFunction(VARCHAR2,"UTILITY.RETRIEVE_ZAMER_PARENTID", new Object[] {});
    }
    
    public String getOtherParentId() {
        return (String)callStoredFunction(VARCHAR2,"UTILITY.RETRIEVE_OTHER_PARENTID", new Object[] {});
    }
    
    public String getSupplierParentId() {
        return (String)callStoredFunction(VARCHAR2,"UTILITY.RETRIEVE_SUPPLIER_PARENTID", new Object[] {});
    }
    
    public String getCustomerParentName() {
        return (String)callStoredFunction(VARCHAR2,"UTILITY.RETRIEVE_CUSTOMER_PARENTNAME", new Object[] {});
    }
    
    protected void callStoredProcedureWoCommit(String stmt, Object[] bindVars) {
      PreparedStatement st = null;
      try {
        // 1. Create a JDBC PreparedStatement for
        st = getDBTransaction().createPreparedStatement("begin "+stmt+";end;",0);
        if (bindVars != null) {
          // 2. Loop over values for the bind variables passed in, if any
          for (int z = 0; z < bindVars.length; z++) {
            // 3. Set the value of each bind variable in the statement
            st.setObject(z + 1, bindVars[z]);
          }
        }
        // 4. Execute the statement
        st.executeUpdate();
      }
      catch (SQLException e) {
        throw new JboException(e);
      }
      finally {
        if (st != null) {
          try {
            // 5. Close the statement
            st.close();
          }
          catch (SQLException e) {
              System.out.println(e.getMessage());
              }
        }
      }
    }
    
    protected void callStoredProcedure(String stmt, Object[] bindVars) {
      PreparedStatement st = null;
      try {
        // 1. Create a JDBC PreparedStatement for
        st = getDBTransaction().createPreparedStatement("begin "+stmt+";commit;end;",0);
        if (bindVars != null) {
          // 2. Loop over values for the bind variables passed in, if any
          for (int z = 0; z < bindVars.length; z++) {
            // 3. Set the value of each bind variable in the statement
            st.setObject(z + 1, bindVars[z]);
          }
        }
        // 4. Execute the statement
        st.executeUpdate();
      }
      catch (SQLException e) {
        throw new JboException(e);
      }
      finally {
        if (st != null) {
          try {
            // 5. Close the statement
            st.close();
          }
          catch (SQLException e) {
              System.out.println(e.getMessage());
              }
        }
      }
    }
    
    protected Object callStoredFunction(int sqlReturnType, String stmt, Object[] bindVars) {
        CallableStatement st = null;
        try {
            // 1. Create a JDBC CallabledStatement
            st = getDBTransaction().createCallableStatement("begin ? := " + stmt + ";end;", 0);
            // 2. Register the first bind variable for the return value
            st.registerOutParameter(1, sqlReturnType);
            if (bindVars != null) {
                // 3. Loop over values for the bind variables passed in, if any
                for (int z = 0; z < bindVars.length; z++) {
                    // 4. Set the value of user-supplied bind vars in the stmt
                    st.setObject(z + 2, bindVars[z]);
                }
            }
            // 5. Set the value of user-supplied bind vars in the stmt
            st.executeUpdate();
            // 6. Return the value of the first bind variable
            return st.getObject(1);
        } catch (SQLException e) {
            throw new JboException(e);
        } finally {
            if (st != null) {
                try {
                    // 7. Close the statement
                    st.close();
                } catch (SQLException e) {
                }
            }
        }
    }
}
