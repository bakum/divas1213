package ua.divas.bean.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.faces.context.ExternalContext;
import javax.faces.context.FacesContext;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import ua.divas.bean.control.OnlineUserData;

@WebServlet(name = "SessionKillServlet", urlPatterns = { "/sessionkillservlet" })
public class SessionKillServlet extends HttpServlet {
    @SuppressWarnings("compatibility:-1015554902259394130")
    private static final long serialVersionUID = 1L;
    private static final String CONTENT_TYPE = "text/html; charset=UTF-8";

    public void init(ServletConfig config) throws ServletException {
        super.init(config);
    }

    public String logout() {
        FacesContext ctx = FacesContext.getCurrentInstance();
        if (ctx != null) {
            ExternalContext ectx = ctx.getExternalContext();
            //String logoutUrl = "faces" + ctx.getViewRoot().getViewId();
            String logoutUrl = "adfAuthentication?logout=true&end_url=/faces/home.jsf";
            //String logoutUrl = "faces/home.jsf";
            ((HttpServletRequest) ectx.getRequest()).getSession().invalidate();
            try {
                ectx.redirect(logoutUrl);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return null;
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType(CONTENT_TYPE);
        System.out.println("SessionKillServlet: geted");
        PrintWriter out = response.getWriter();
        String user = null;
        try {
            user = request.getUserPrincipal().getName();
        } catch (Exception e) {
            user = "undefined";
        }
        out.println("<html>");
        out.println("<head><title>SessionKillServlet</title></head>");
        out.println("<body>");
        out.println("<p>The servlet has received a GET. This is the reply.</p>");
        out.println("<p> " + user + ".</p>");
        out.println("</body></html>");
        out.close();
         request.getSession().invalidate();
        if (!user.equals("undefined")) {
            OnlineUserData.removeOnlineUser(user);
        } 
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType(CONTENT_TYPE);
        System.out.println("SessionKillServlet: posted");
        PrintWriter out = response.getWriter();
        out.println("<html>");
        out.println("<head><title>SessionKillServlet</title></head>");
        out.println("<body>");
        out.println("<p>The servlet has received a POST. This is the reply.</p>");
        out.println("</body></html>");
        out.close();
        //logout();
    }
}
