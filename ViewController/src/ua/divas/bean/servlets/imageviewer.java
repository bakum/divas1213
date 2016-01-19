package ua.divas.bean.servlets;

import java.io.BufferedInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;

import java.sql.Blob;
import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import javax.sql.DataSource;

import oracle.jdbc.OracleConnection;

@WebServlet(name = "userimageviewer", urlPatterns = { "/userimageviewer" })
public class imageviewer extends HttpServlet {
    @SuppressWarnings("compatibility:373284558077657070")
    private static final long serialVersionUID = 1L;
    private static final String CONTENT_TYPE = "text/html; charset=UTF-8";

    public void init(ServletConfig config) throws ServletException {
        super.init(config);
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType(CONTENT_TYPE);
        String Id = request.getParameter("id");
        System.out.println("ImageViewerServlet: " + Id.toString());

        OutputStream os = response.getOutputStream();

        OracleConnection conn = connect();
        try {
            PreparedStatement st = conn.prepareStatement("select u.ID, U.PHOTO from users u where u.id = ?");
            st.setString(1, Id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Blob blob = rs.getBlob("PHOTO");
                BufferedInputStream in = new BufferedInputStream(blob.getBinaryStream());
                int b;
                byte[] buffer = new byte[10240];

                while ((b = in.read(buffer, 0, 10240)) != -1) {
                    os.write(buffer, 0, b);
                }
                os.close();
            }
            System.out.println("Query executed");
            st.close();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                conn.close();
            } catch (SQLException e) {
            }
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
