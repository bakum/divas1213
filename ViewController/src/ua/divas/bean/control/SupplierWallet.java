package ua.divas.bean.control;

import java.math.BigDecimal;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.apache.commons.net.nntp.Article;

public class SupplierWallet {

    private static List<SupplierRecord> supplierList = new ArrayList<SupplierRecord>();
    //private static BigDecimal summAll = new BigDecimal(0);
    private String kassaId;

    public final void setKassaId(String kassaId) {
        this.kassaId = kassaId;
    }

    public final String getKassaId() {
        return kassaId;
    }

    private static final BigDecimal getFilteredSumm(String user) {
        BigDecimal ms = new BigDecimal(0);
        for (SupplierRecord a : supplierList) {
            // or equalsIgnoreCase or whatever your conditon is
            if (a.getUserId().equals(user)) {
                // do something
                ms = ms.add(a.getSumma());
            }
        }
        return ms;
    }


    public static final BigDecimal getSummAll() {
        return getFilteredSumm(SupplierRecord.getSessionUser());
        //return summAll;
    }

    /* public static final void setSummAll(BigDecimal summAll) {
        SupplierWallet.summAll = summAll;
    } */

    public void setSupplierList(List<SupplierRecord> supplierList) {
        SupplierWallet.supplierList = supplierList;
    }

    public static void setAllSupplierList(List<SupplierRecord> sl) {
        ArrayList<SupplierRecord> al = new ArrayList<SupplierRecord>();
        al.addAll(supplierList);
        al.addAll(sl);
        supplierList = al;
        //recalcSumm();
    }

    private static List<SupplierRecord> getFilteredList(String user) {
        List<SupplierRecord> secondList = new ArrayList<SupplierRecord>();
        for (SupplierRecord a : supplierList) {
            // or equalsIgnoreCase or whatever your conditon is
            if (a.getUserId().equals(user)) {
                // do something
                secondList.add(a);
            }
        }
        return secondList;
    }

    public List<SupplierRecord> getSupplierList() {
        return getFilteredList(SupplierRecord.getSessionUser());
        //return supplierList;
    }

    public final static void addSupplier(String kontragId, String orderId, BigDecimal summa) {
        SupplierRecord spl = new SupplierRecord(kontragId, orderId, summa);
        supplierList.add(spl);
//        summAll = summAll.add(summa);
    }

    public static Iterator<SupplierRecord> getWalletIterator() {
        return supplierList.iterator();
    }

    /* public static void recalcSumm() {
        BigDecimal ni = new BigDecimal(0);
        if (supplierList.isEmpty()) {
//            summAll = new BigDecimal(0);
            return;
        } else {
            Iterator<SupplierRecord> i = supplierList.iterator();
            while (i.hasNext()) {
                SupplierRecord o = i.next();
                ni = ni.add(o.getSumma());
            }
//            summAll = ni;
        }
    } */

    public static int searchSupplier(String Id) {
        if (supplierList.isEmpty()) {
            return -1;
        } else {
            Iterator<SupplierRecord> i = supplierList.iterator();
            int c = 0;
            while (i.hasNext()) {
                SupplierRecord o = i.next();
                if (o.getId().matches(Id)) {
                    return c;
                }
                c++;
            }
        }
        return -1;
    }

    public final static void addSupplierWithId(String Id, String kontragId, String orderId, BigDecimal summa) {
        SupplierRecord spl = new SupplierRecord(Id, kontragId, orderId, summa);
        int i = searchSupplier(Id);
        if (i == -1) {
            supplierList.add(spl);
//            summAll = summAll.add(summa);
        } else {
            supplierList.set(i, spl);
        }
        //System.out.println("User list: " + onlineUserList.toString()); */
    }

    public final static void addSupplierWithIdIn(String Id, String kontragId, String orderId, BigDecimal summa) {
        SupplierRecord spl = new SupplierRecord(Id, kontragId, orderId, summa);
        spl.setIsIn(true);
        int i = searchSupplier(Id);
        if (i == -1) {
            supplierList.add(spl);
//            summAll = summAll.add(summa);
        } else {
            supplierList.set(i, spl);
        }
        //System.out.println("User list: " + onlineUserList.toString()); */
    }

    public final static void removeSupplier(String _id) {
        Iterator<SupplierRecord> i = supplierList.iterator();
        while (i.hasNext()) {
            SupplierRecord o = i.next();
            if (o.getId().matches(_id)) {
                i.remove();
//                summAll.subtract(o.getSumma());
            }
        }
    }

    public final static void clearSupplier() {
        Iterator<SupplierRecord> i = supplierList.iterator();
        while (i.hasNext()) {
            SupplierRecord o = i.next();
            if (o.getUserId().equals(SupplierRecord.getSessionUser())) {
                i.remove();
               // summAll.subtract(o.getSumma());
            }
        }
        //supplierList.clear();
        //summAll = new BigDecimal(0);
    }

    public final static boolean hasSupplier() {
        return getFilteredList(SupplierRecord.getSessionUser()).isEmpty();
        //return supplierList.isEmpty();
    }


}
