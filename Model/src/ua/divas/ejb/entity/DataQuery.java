package ua.divas.ejb.entity;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;


public class DataQuery {


    private static EntityManager getEm() {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("Model");
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        return em;
    }

    public static WlsSettings getCurrentWlsSettings() {
        try {
            WlsSettings u = getEm().createNamedQuery("WlsSettings.findAll", WlsSettings.class).getSingleResult();
            if (u != null) {
                return u;
            }
            return null;
        } catch (Exception e) {
            return null;
        }
    }

    public static QuartzProperty getCurrentQuartzSettings() {
        try {
            QuartzProperty u =
                getEm().createNamedQuery("QuartzProperty.findAll", QuartzProperty.class).getSingleResult();
            if (u != null) {
                return u;
            }
            return null;
        } catch (Exception e) {
            return null;
        }
    }
    
    public static boolean zamerInUseUser(String Id) {
        int cnt =
            getEm().createNamedQuery("UserSettings.findByZamer", UserSettings.class)
            .setParameter("zamerId", Id)
            .getResultList().size();
        if (cnt > 0) {
            return true;
        }
        return false;
    }

    public static boolean zamerInUse(String Id) {
        int cnt =
            getEm().createNamedQuery("Orders.findByZamer", Orders.class)
            .setParameter("id", Id)
            .getResultList().size();
        if (cnt > 0) {
            return true;
        }
        return false;
    }
    
    public static boolean zamernameInUse(String name) {
        Kontragents k = getEm().createNamedQuery("Kontragents.findByName",Kontragents.class)
            .setParameter("name", name).getSingleResult();
        int cnt =
            getEm().createNamedQuery("Orders.findByZamer", Orders.class)
            .setParameter("id", k.getId())
            .getResultList().size();
        if (cnt > 0) {
            return true;
        }
        return false;
    }

    public static Users getZamerUser(String Id) {
        try {
            Users u = getEm().createNamedQuery("Users.findById", Users.class).setParameter("id", Id).getSingleResult();
            if (u != null) {
                return u;
            }
            return null;
        } catch (Exception e) {
            return null;
        }
    }

    public static List<QuartzProperty> getAllQuartzSettings() {
        try {
            List<QuartzProperty> u =
                getEm().createNamedQuery("QuartzProperty.findAll", QuartzProperty.class).getResultList();
            if (u != null) {
                return u;
            }
            return null;
        } catch (Exception e) {
            return null;
        }
    }
}
