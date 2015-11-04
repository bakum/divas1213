package ua.divas.bean.control;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

import java.net.InetAddress;
import java.net.MalformedURLException;
import java.net.NetworkInterface;
import java.net.SocketException;
import java.net.URL;
import java.net.URLConnection;

import java.net.UnknownHostException;

import java.text.SimpleDateFormat;

import java.util.Date;
import java.util.Enumeration;

public class OnlineUser {

    private String Id;
    private String Login;
    private Long loginDate;
    private Date logDate;
    private String ipAdress;
    private String ipAdressLocal;
    private String ipAdressNAT;

    public String getIpAdressNAT() {
        return ipAdressNAT;
    }

    public String getIpAdressLocal() {
        return ipAdressLocal;
    }

    public String getIpAdress() {
        return ipAdress;
    }

    public Date getLogDate() {
        return new Date(this.loginDate);
    }

    public OnlineUser() {
        super();
    }

    public OnlineUser(String Id, String login) {
        setId(Id);
        setLogin(login);
        setLoginDate(System.currentTimeMillis());
        /* Enumeration e = null;
        try {
            e = NetworkInterface.getNetworkInterfaces();
        } catch (SocketException f) {
        }
        if (null != e) {
            while (e.hasMoreElements()) {
                NetworkInterface n = (NetworkInterface) e.nextElement();
                Enumeration ee = n.getInetAddresses();
                while (ee.hasMoreElements()) {
                    InetAddress i = (InetAddress) ee.nextElement();
                    System.out.println(i.getHostAddress());
                }
            }
        }  */

        try {
            InetAddress ad = getLocalHostLANAddress();
            ipAdressLocal = ad.getHostAddress();
        } catch (UnknownHostException er) {
            ipAdressLocal = "Inaccessible";
        }
        
        ipAdressNAT = getProviderAdress();
        try {
            URL connection = new URL("http://agentgatech.appspot.com");
            URLConnection con = connection.openConnection();
            String str = null;
            BufferedReader reader = new BufferedReader(new InputStreamReader(con.getInputStream()));
            str = reader.readLine();
            ipAdress = str;
            //System.out.println(str);
        } catch (MalformedURLException murle) {
            ipAdress = "Inaccessible";
        } catch (IOException ioe) {
            ipAdress = "Inaccessible";
        }
    }

    public String loginDateToString() {
        SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy hh:mm:ss");
        Date loginDateTime = new Date(this.loginDate);
        return format.format(loginDateTime);
    }

    public void setId(String Id) {
        this.Id = Id;
    }

    public String getId() {
        return Id;
    }

    public void setLogin(String Login) {
        this.Login = Login;
    }

    public String getLogin() {
        return Login;
    }

    public void setLoginDate(Long loginDate) {
        this.loginDate = loginDate;
    }

    public Long getLoginDate() {
        return loginDate;
    }

    public String toString() {
        return Login + "(" + Id + ")";
    }

    private InetAddress getLocalHostLANAddress() throws UnknownHostException {
        try {
            InetAddress candidateAddress = null;
            // Iterate all NICs (network interface cards)...
            for (Enumeration ifaces = NetworkInterface.getNetworkInterfaces(); ifaces.hasMoreElements();) {
                NetworkInterface iface = (NetworkInterface) ifaces.nextElement();
                // Iterate all IP addresses assigned to each card...
                for (Enumeration inetAddrs = iface.getInetAddresses(); inetAddrs.hasMoreElements();) {
                    InetAddress inetAddr = (InetAddress) inetAddrs.nextElement();
                    if (!inetAddr.isLoopbackAddress()) {

                        if (inetAddr.isSiteLocalAddress()) {
                            // Found non-loopback site-local address. Return it immediately...
                            return inetAddr;
                        } else if (candidateAddress == null) {
                            // Found non-loopback address, but not necessarily site-local.
                            // Store it as a candidate to be returned if site-local address is not subsequently found...
                            candidateAddress = inetAddr;
                            // Note that we don't repeatedly assign non-loopback non-site-local addresses as candidates,
                            // only the first. For subsequent iterations, candidate will be non-null.

                        }
                    }
                }
            }
            if (candidateAddress != null) {
                // We did not find a site-local address, but we found some other non-loopback address.
                // Server might have a non-site-local address assigned to its NIC (or it might be running
                // IPv6 which deprecates the "site-local" concept).
                // Return this non-loopback candidate address...
                return candidateAddress;
            }
            // At this point, we did not find a non-loopback address.
            // Fall back to returning whatever InetAddress.getLocalHost() returns...
            InetAddress jdkSuppliedAddress = InetAddress.getLocalHost();
            if (jdkSuppliedAddress == null) {
                throw new UnknownHostException("The JDK InetAddress.getLocalHost() method unexpectedly returned null.");
            }
            return jdkSuppliedAddress;
        } catch (Exception e) {
            UnknownHostException unknownHostException =
                new UnknownHostException("Failed to determine LAN address: " + e);
            unknownHostException.initCause(e);
            throw unknownHostException;
        }
    }

    private String getProviderAdress() {
        URL url = null;
        BufferedReader in = null;
        String ipAddress = "";
        try {
            url = new URL("http://bot.whatismyipaddress.com");
            in = new BufferedReader(new InputStreamReader(url.openStream()));
            ipAddress = in.readLine().trim();
            /* IF not connected to internet, then
                 * the above code will return one empty
                 * String, we can check it's length and
                 * if length is not greater than zero,
                 * then we can go for LAN IP or Local IP
                 * or PRIVATE IP
                 */
            if (!(ipAddress.length() > 0)) {
                try {
                    InetAddress ip = InetAddress.getLocalHost();
                    System.out.println((ip.getHostAddress()).trim());
                    ipAddress = (ip.getHostAddress()).trim();
                } catch (Exception exp) {
                    ipAddress = "ERROR";
                }
            }
        } catch (Exception ex) {
            // This try will give the Private IP of the Host.
            try {
                InetAddress ip = InetAddress.getLocalHost();
                System.out.println((ip.getHostAddress()).trim());
                ipAddress = (ip.getHostAddress()).trim();
            } catch (Exception exp) {
                ipAddress = "ERROR";
            }
            //ex.printStackTrace();
        }
        System.out.println("IP Address: " + ipAddress);
        return ipAddress;
    }

}
