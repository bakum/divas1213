package ua.divas.bean;

import com.google.common.io.ByteStreams;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Chapter;
import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;

import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.Section;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

import com.itextpdf.text.pdf.RandomAccessFileOrArray;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;

import java.math.BigDecimal;

import java.net.MalformedURLException;
import java.net.URL;

import java.sql.SQLException;

import java.util.Iterator;
import java.util.List;

import java.util.StringTokenizer;

import javax.el.ELContext;
import javax.el.ExpressionFactory;
import javax.el.MethodExpression;

import javax.el.ValueExpression;

import javax.faces.application.Application;
import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;

import javax.faces.event.ActionEvent;

import javax.faces.event.ValueChangeEvent;

import javax.servlet.http.HttpServletRequest;

import oracle.adf.model.BindingContext;
import oracle.adf.model.binding.DCBindingContainer;
import oracle.adf.model.binding.DCDataControl;
import oracle.adf.model.binding.DCIteratorBinding;
import oracle.adf.view.rich.component.rich.data.RichTreeTable;

import oracle.adf.view.rich.context.AdfFacesContext;
import oracle.adf.view.rich.event.DialogEvent;
import oracle.adf.view.rich.event.PopupCanceledEvent;
import oracle.adf.view.rich.event.PopupFetchEvent;

import oracle.binding.BindingContainer;

import oracle.binding.OperationBinding;

import oracle.jbo.Row;
import oracle.jbo.RowNotFoundException;
import oracle.jbo.ViewObject;
import oracle.jbo.domain.BlobDomain;
import oracle.jbo.server.ViewObjectImpl;
import oracle.jbo.uicli.binding.JUCtrlHierBinding;
import oracle.jbo.uicli.binding.JUCtrlHierNodeBinding;
import oracle.jbo.uicli.binding.JUIteratorBinding;

import org.apache.myfaces.trinidad.event.SelectionEvent;
import org.apache.myfaces.trinidad.model.CollectionModel;
import org.apache.myfaces.trinidad.model.RowKeySet;
import org.apache.myfaces.trinidad.model.UploadedFile;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import ua.divas.module.AppModuleImpl;

public class KontragDirBean {
    private RichTreeTable treeTable;
    private String del_title;
    private String del_label;
    private String del_style;

    public KontragDirBean() {
    }

    public void setTreeTable(RichTreeTable treeTable) {
        this.treeTable = treeTable;
    }

    public RichTreeTable getTreeTable() {
        return treeTable;
    }

    public BindingContainer getBindings() {
        return BindingContext.getCurrent().getCurrentBindingsEntry();
    }

    public String refresh() {
        BindingContainer bd = BindingContext.getCurrent().getCurrentBindingsEntry();
        OperationBinding ob = bd.getOperationBinding("Commit");
        if (ob.isOperationEnabled()) {
            ob.execute();
        }
        DCBindingContainer binding = (DCBindingContainer) BindingContext.getCurrent().getCurrentBindingsEntry();
        DCIteratorBinding it = binding.findIteratorBinding("KontragentsAllRoot1Iterator");
        if (it != null) {
            it.executeQuery();
        }
        it = binding.findIteratorBinding("KontragentsAllGroup1Iterator");
        if (it != null) {
            it.executeQuery();
        }
        AdfFacesContext.getCurrentInstance().addPartialTarget(getTreeTable());
        return null;
    }

    public void onTreeSelect(SelectionEvent selectionEvent) {
        String adfSelectionListener = "#{bindings.KontragentsAllRoot1.treeModel.makeCurrent}";

        FacesContext fctx = FacesContext.getCurrentInstance();
        Application application = fctx.getApplication();
        ELContext elCtx = fctx.getELContext();
        ExpressionFactory exprFactory = application.getExpressionFactory();

        MethodExpression me = null;
        me = exprFactory.createMethodExpression(elCtx, adfSelectionListener, Object.class, new Class[] {
                                                SelectionEvent.class });
        me.invoke(elCtx, new Object[] { selectionEvent });

        RichTreeTable tree1 = this.getTreeTable();
        RowKeySet rks2 = tree1.getSelectedRowKeys();
        Iterator rksIterator = rks2.iterator();
        if (rksIterator.hasNext()) {
            List key = (List) rksIterator.next();
            JUCtrlHierBinding treeBinding = null;
            treeBinding = (JUCtrlHierBinding) ((CollectionModel) tree1.getValue()).getWrappedData();
            JUCtrlHierNodeBinding nodeBinding = treeBinding.findNodeByKeyPath(key);

            Row rw = nodeBinding.getRow();
            //print first row attribute. Note that in a tree you have to
            //determine the node type if you want to select node attributes
            //by name and not index
            String rowType = rw.getStructureDef().getDefName();
            System.out.println(rowType);

            DCIteratorBinding _treeIteratorBinding = null;
            _treeIteratorBinding = treeBinding.getDCIteratorBinding();
            JUIteratorBinding iterator = nodeBinding.getIteratorBinding();
            String keyStr = nodeBinding.getRowKey().toStringFormat(true);
            if (keyStr != null && rowType.matches("KontragentsAll")) {
                DCIteratorBinding iter = (DCIteratorBinding) getBindings().get("KontragentsAll1Iterator");
                try {
                    iter.setCurrentRowWithKey(keyStr);
                } catch (RowNotFoundException e) {
                    try {
                        iterator.setCurrentRowWithKey(keyStr);
                    } catch (RowNotFoundException er) {
                        System.out.println(er.getMessage());

                    }
                }
            }
        }
    }

    public void onPopupFetch(PopupFetchEvent popupFetchEvent) {
        DCBindingContainer bd = (DCBindingContainer) BindingContext.getCurrent().getCurrentBindingsEntry();
        DCIteratorBinding it = bd.findIteratorBinding("KontragentsAll1Iterator");
        Row currRow = it.getCurrentRow();
        Integer isGroup = (Integer) currRow.getAttribute("IsGroup");
        String Id = (String) currRow.getAttribute("Id");
        String ParentId = (String) currRow.getAttribute("ParentId");

        if (popupFetchEvent.getLaunchSourceClientId().contains("bCreateGroup")) {
            BindingContainer binding = BindingContext.getCurrent().getCurrentBindingsEntry();
            OperationBinding ob = binding.getOperationBinding("CreateInsert");
            ob.execute();
            currRow = it.getCurrentRow();
            if (isGroup == 1) {
                currRow.setAttribute("ParentId", Id);
            } else {
                currRow.setAttribute("ParentId", ParentId);
            }
            currRow.setAttribute("IsGroup", 1);
        } else if (popupFetchEvent.getLaunchSourceClientId().contains("bCreate")) {
            BindingContainer binding = BindingContext.getCurrent().getCurrentBindingsEntry();
            OperationBinding ob = binding.getOperationBinding("CreateInsert");
            ob.execute();
            currRow = it.getCurrentRow();
            if (isGroup == 1) {
                currRow.setAttribute("ParentId", Id);
            } else {
                currRow.setAttribute("ParentId", ParentId);
            }
        }
    }

    public void onDialogPopup(DialogEvent dialogEvent) {
        DCBindingContainer bd = (DCBindingContainer) BindingContext.getCurrent().getCurrentBindingsEntry();
        if (dialogEvent.getOutcome().name().equals("ok")) {
            BindingContainer binding = BindingContext.getCurrent().getCurrentBindingsEntry();
            OperationBinding ob = binding.getOperationBinding("Commit");
            if (bd.getDataControl().isTransactionModified()) {
                ob.execute();
                refresh();
            }
        } else if (dialogEvent.getOutcome().name().equals("cancel")) {
            BindingContainer binding = BindingContext.getCurrent().getCurrentBindingsEntry();
            OperationBinding ob = binding.getOperationBinding("Rollback");

            ob.execute();

        }
    }

    public void cancelListener(PopupCanceledEvent popupCanceledEvent) {
        DCBindingContainer bd = (DCBindingContainer) BindingContext.getCurrent().getCurrentBindingsEntry();

        BindingContainer binding = BindingContext.getCurrent().getCurrentBindingsEntry();
        OperationBinding ob = binding.getOperationBinding("Rollback");

        /*  String rks;
        DCBindingContainer bd = (DCBindingContainer) BindingContext.getCurrent().getCurrentBindingsEntry();
        DCIteratorBinding it = bd.findIteratorBinding("KontragentsAll1Iterator");
        if (it != null) {
            try {
                rks = it.getCurrentRow().getKey().toStringFormat(true);
            } catch (Exception e) {
                rks = null;
                e.printStackTrace();
            }
            it.executeQuery();
            if (rks != null) {
                it.setCurrentRowWithKey(rks);
            }
        }*/
        if (bd.getDataControl().isTransactionModified()) {
            ob.execute();
            refresh();
        }
    }

    public void setDel_title(String del_title) {
        this.del_title = del_title;
    }

    public String getDel_title() {
        DCBindingContainer bd = (DCBindingContainer) BindingContext.getCurrent().getCurrentBindingsEntry();
        DCIteratorBinding it = bd.findIteratorBinding("KontragentsAll1Iterator");
        Row currRow = it.getCurrentRow();
        Integer Del = (Integer) currRow.getAttribute("Deleted");
        String RetStr = null;
        if (Del == 0) {
            RetStr = "Вы хотите пометить объект на удаление?";
        } else {
            RetStr = "Вы хотите снять пометку на удаление?";
        }
        return RetStr;
    }

    public void setDel_label(String del_label) {
        this.del_label = del_label;
    }

    public String getDel_label() {
        DCBindingContainer bd = (DCBindingContainer) BindingContext.getCurrent().getCurrentBindingsEntry();
        DCIteratorBinding it = bd.findIteratorBinding("KontragentsAll1Iterator");
        Row currRow = it.getCurrentRow();
        Integer Del = (Integer) currRow.getAttribute("Deleted");
        String RetStr = null;
        if (Del == 0) {
            RetStr = "Пометить на удаление";
        } else {
            RetStr = "Снять пометку на удаление";
        }
        return RetStr;
    }

    public void setDel_style(String del_style) {
        this.del_style = del_style;
    }

    public String getDel_style() {
        DCBindingContainer bd = (DCBindingContainer) BindingContext.getCurrent().getCurrentBindingsEntry();
        DCIteratorBinding it = bd.findIteratorBinding("KontragentsAll1Iterator");
        Row currRow = it.getCurrentRow();
        Integer Del = (Integer) currRow.getAttribute("Deleted");
        String RetStr = null;
        if (Del == 0) {
            RetStr = "font-size:large; Color : Red;";
        } else {
            RetStr = "font-size:large;";
        }
        return RetStr;
    }

    public void onDeleteDialog(DialogEvent dialogEvent) {
        if (dialogEvent.getOutcome().name().equals("ok")) {
            DCBindingContainer bd = (DCBindingContainer) BindingContext.getCurrent().getCurrentBindingsEntry();
            DCIteratorBinding it = bd.findIteratorBinding("KontragentsAll1Iterator");
            Row currRow = it.getCurrentRow();
            Integer Del = (Integer) currRow.getAttribute("Deleted");
            if (Del == 0) {
                BindingContainer binding = BindingContext.getCurrent().getCurrentBindingsEntry();
                OperationBinding ob = binding.getOperationBinding("Delete");
                ob.execute();
            } else {
                currRow.setAttribute("Deleted", 0);
            }
            BindingContainer binding = BindingContext.getCurrent().getCurrentBindingsEntry();
            OperationBinding ob = binding.getOperationBinding("Commit");

            ob.execute();
            refresh();

        }
    }

    public void onRefresh(ActionEvent actionEvent) {
        refresh();
    }

    public void generateExcel(FacesContext facesContext, OutputStream outputStream) {
        try {
            HSSFWorkbook workbook = new HSSFWorkbook();
            HSSFSheet worksheet = workbook.createSheet("Контакты");
            DCBindingContainer bindings = (DCBindingContainer) BindingContext.getCurrent().getCurrentBindingsEntry();
            DCIteratorBinding dcIteratorBindings = bindings.findIteratorBinding("KontragentsRep1Iterator");
            HSSFRow excelrow = null;

            // Get all the rows of a iterator
            oracle.jbo.Row[] rows = dcIteratorBindings.getAllRowsInRange();
            int i = 0;
            for (oracle.jbo.Row row : rows) {
                //print header on first row in excel
                if (i == 0) {
                    excelrow = (HSSFRow) worksheet.createRow((short) i);
                    short j = 0;
                    for (String colName : row.getAttributeNames()) {
                        HSSFCell cellA1 = excelrow.createCell((short) j);
                        if (colName.equalsIgnoreCase("Fullname")) {
                            cellA1.setCellValue("Ф.И.О.");
                        }
                        if (colName.equalsIgnoreCase("Adress")) {
                            cellA1.setCellValue("Адрес");
                        }
                        if (colName.equalsIgnoreCase("Phone")) {
                            cellA1.setCellValue("Телефон");
                        }
                        if (colName.equalsIgnoreCase("Email")) {
                            cellA1.setCellValue("Почта");
                        }
                        j++;
                    }
                }
                //print data from second row in excel
                ++i;
                short j = 0;
                excelrow = worksheet.createRow((short) i);
                for (String colName : row.getAttributeNames()) {
                    //System.out.println("hello " + row.getAttribute(colName));
                    //System.out.println("hello " + colName);
                    HSSFCell cell = excelrow.createCell(j);
                    /* if (null != row.getAttribute(colName)) {
                        cell.setCellValue(row.getAttribute(colName).toString());
                    }  */
                    if (colName.equalsIgnoreCase("Fullname")) {
                        cell.setCellValue(row.getAttribute(colName).toString());
                    }
                    if (colName.equalsIgnoreCase("Adress")) {
                        if (null != row.getAttribute(colName)) {
                            cell.setCellValue(row.getAttribute(colName).toString());
                        }
                    }
                    if (colName.equalsIgnoreCase("Phone")) {
                        if (null != row.getAttribute(colName)) {
                            cell.setCellValue(row.getAttribute(colName).toString());
                        }
                    }
                    if (colName.equalsIgnoreCase("Email")) {
                        if (null != row.getAttribute(colName)) {
                            cell.setCellValue(row.getAttribute(colName).toString());
                        }
                    }
                    //cell.setCellValue("Rакая-то херня");
                    j++;

                }
                worksheet.createFreezePane(0, 1, 0, 1);
                worksheet.autoSizeColumn(0);
                worksheet.autoSizeColumn(1);
                worksheet.autoSizeColumn(2);
                worksheet.autoSizeColumn(3);
            }

            workbook.write(outputStream);
            outputStream.flush();
        } catch (Exception e) {
            // TODO: Add catch code
            e.printStackTrace();
        }


    }

    public void onPdf(ActionEvent actionEvent) {
        FacesContext ctx = FacesContext.getCurrentInstance();
        FacesMessage msg = new FacesMessage(FacesMessage.SEVERITY_INFO, "Infirmation", "Функция ещё не реализована!");
        ctx.addMessage(null, msg);
    }

    public void generatePdf(FacesContext facesContext, OutputStream outputStream) {
        try {
            //for hosting
            /* String requestUrlDivas = "https://divas.imx.net.ua/divas/faces/index";
            System.out.println("requestUrlDivas: " + requestUrlDivas);
            String contextRootDivas = "/divas";
            System.out.println("contextRootDivas: " + contextRootDivas);
            String fontUrlDivas = requestUrlDivas.substring(0, requestUrlDivas.lastIndexOf(contextRootDivas))+contextRootDivas+"/fonts/times.ttf";
            System.out.println("fontUrlDivas: " + fontUrlDivas); */


            HttpServletRequest request = (HttpServletRequest) facesContext.getExternalContext().getRequest();
            String requestUrl = request.getRequestURL().toString();
            System.out.println("requestUrl: " + requestUrl);
            String contextRoot = facesContext.getExternalContext().getRequestContextPath();
            System.out.println("contextRoot: " + contextRoot);
            String fontUrl =
                requestUrl.substring(0, requestUrl.lastIndexOf(contextRoot)) + contextRoot + "/fonts/times.ttf";
            //String rqPath =
            //    ((HttpServletRequest) facesContext.getExternalContext().getRequest()).getRealPath("/fonts/times.ttf");
            //System.out.println("path: " + rqPath);
            //String urlPath = facesContext.getExternalContext().getRequestContextPath()+"/fonts/times.ttf";
            System.out.println("URL: " + fontUrl);
            InputStream is = (new URL(fontUrl)).openStream();
            byte[] bytes = ByteStreams.toByteArray(is);
            BaseFont bf = BaseFont.createFont("times.ttf", BaseFont.IDENTITY_H, BaseFont.EMBEDDED, false, bytes, null);
            Font font = new Font(bf, 14);
            Font fontc = new Font(bf, 12);
            Font fontm = new Font(bf, 10);
            Document document = new Document(PageSize.A4);
            PdfWriter.getInstance(document, outputStream);
            document.open();
            document.addAuthor("Divas CRM, Copyright by BMExpert");
            document.addCreator("Divas CRM, Copyright by BMExpert");
            document.addSubject("Exported contacts from Divas CRM");
            Paragraph preface = new Paragraph();
            Chapter chapter1 = new Chapter(preface, 1);
            chapter1.setNumberDepth(0);
            Paragraph title = new Paragraph("Список контактов", fontc);
            /* Chunk ch = new Chunk("Список контактов", fontc);
            document.add(ch);
            document.add(Chunk.NEWLINE); */
            Section section1 = chapter1.addSection(title);
            section1.setNumberDepth(0);
            // Start a new page
            //document.newPage();
            DCBindingContainer bindings = (DCBindingContainer) BindingContext.getCurrent().getCurrentBindingsEntry();
            DCIteratorBinding dcIteratorBindings = bindings.findIteratorBinding("KontragentsRep1Iterator");
            oracle.jbo.Row[] rows = dcIteratorBindings.getAllRowsInRange();
            PdfPTable table = new PdfPTable(rows[0].getAttributeCount() - 1);
            table.setSpacingBefore(10);
            int i = 0;
            for (oracle.jbo.Row row : rows) {
                if (i == 0) {
                    for (String colName : row.getAttributeNames()) {
                        //PdfPCell c = new PdfPCell(new Phrase("Билиберда",fontc));
                        //table.addCell(c);
                        if (colName.equalsIgnoreCase("Fullname")) {
                            PdfPCell c1 = new PdfPCell(new Phrase("Ф.И.О.", fontc));
                            c1.setHorizontalAlignment(Element.ALIGN_CENTER);
                            table.addCell(c1);
                        }
                        if (colName.equalsIgnoreCase("Adress")) {
                            PdfPCell c2 = new PdfPCell(new Phrase("Адрес", fontc));
                            c2.setHorizontalAlignment(Element.ALIGN_CENTER);
                            table.addCell(c2);
                        }
                        if (colName.equalsIgnoreCase("Phone")) {
                            PdfPCell c3 = new PdfPCell(new Phrase("Телефон", fontc));
                            c3.setHorizontalAlignment(Element.ALIGN_CENTER);
                            table.addCell(c3);
                        }
                        if (colName.equalsIgnoreCase("Email")) {
                            PdfPCell c4 = new PdfPCell(new Phrase("Почта", fontc));
                            c4.setHorizontalAlignment(Element.ALIGN_CENTER);
                            table.addCell(c4);
                        }
                    }
                    //table.setHeaderRows(1);
                }
                i++;
                for (String colName : row.getAttributeNames()) {
                    if (colName.equalsIgnoreCase("IsBuyer")) {
                        continue;
                    }
                    if (row.getAttribute(colName) != null) {
                        table.addCell(new Phrase(row.getAttribute(colName).toString(), fontm));
                    } else {
                        table.addCell("");
                    }
                }
            }
            section1.add(table);
            document.add(section1);
            //document.newPage();
            document.close();
            outputStream.flush();
        } catch (Exception e) {
            // TODO: Add catch code
            e.printStackTrace();
        }

    }

    public String getValueFrmExpression(String data) {
        FacesContext fc = FacesContext.getCurrentInstance();
        Application app = fc.getApplication();
        ExpressionFactory elFactory = app.getExpressionFactory();
        ELContext elContext = fc.getELContext();
        ValueExpression valueExp = elFactory.createValueExpression(elContext, data, Object.class);
        String Message = null;
        Object obj = valueExp.getValue(elContext);
        if (obj != null) {
            Message = obj.toString();
        }
        return Message;
    }

    public void onPaySettChange(ValueChangeEvent valueChangeEvent) {
        valueChangeEvent.getComponent().processUpdates(FacesContext.getCurrentInstance());
        //System.out.println(vce.getNewValue());
        String pId = getValueFrmExpression("#{row.bindings.PayId.attributeValue}");
        System.out.println(pId);
        DCBindingContainer bd = (DCBindingContainer) BindingContext.getCurrent().getCurrentBindingsEntry();
        DCIteratorBinding it = bd.findIteratorBinding("KontragSettingsView2Iterator");
        Row currRow = it.getCurrentRow();
        currRow.setAttribute("Summa", null);

        BindingContainer binding = BindingContext.getCurrent().getCurrentBindingsEntry();
        OperationBinding ob = binding.getOperationBinding("retrieveSumm");

        if (ob != null) {
            ob.getParamsMap().put("pId", pId);
            BigDecimal summa = (BigDecimal) ob.execute();
            System.out.println(summa);
            currRow.setAttribute("Summa", summa);
        }
    }

    public void onCancel(PopupCanceledEvent popupCanceledEvent) {
        BindingContainer binding = BindingContext.getCurrent().getCurrentBindingsEntry();
        OperationBinding ob = binding.getOperationBinding("Rollback");
        if (ob != null) {
            if (ob.isOperationEnabled()) {
                ob.execute();
                refresh();
            }
        }
    }

    public void onDialog(DialogEvent dialogEvent) {
        if (dialogEvent.getOutcome().name().equals("ok")) {
            BindingContainer binding = BindingContext.getCurrent().getCurrentBindingsEntry();
            OperationBinding ob = binding.getOperationBinding("Commit");
            if (ob != null) {
                if (ob.isOperationEnabled()) {
                    ob.execute();
                    refresh();
                }
            }
        } else {
            BindingContainer binding = BindingContext.getCurrent().getCurrentBindingsEntry();
            OperationBinding ob = binding.getOperationBinding("Rollback");
            if (ob != null) {
                if (ob.isOperationEnabled()) {
                    ob.execute();
                    refresh();
                }
            }
        }
    }

    private BlobDomain createBlobDomain(UploadedFile file) {

        InputStream in = null;
        BlobDomain blobDomain = null;
        OutputStream out = null;

        try {
            in = file.getInputStream();

            blobDomain = new BlobDomain();
            out = blobDomain.getBinaryOutputStream();
            byte[] buffer = new byte[8192];
            int bytesRead = 0;

            while ((bytesRead = in.read(buffer, 0, 8192)) != -1) {
                out.write(buffer, 0, bytesRead);
            }

            in.close();

        } catch (IOException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.fillInStackTrace();
        }

        return blobDomain;
    }

    public void parseFile(UploadedFile file) {

        DCBindingContainer bindings = (DCBindingContainer) BindingContext.getCurrent().getCurrentBindingsEntry();
        DCIteratorBinding dcIteratorBindings = bindings.findIteratorBinding("KontragentsRep1Iterator");
        Row rw = dcIteratorBindings.getCurrentRow();
        rw.setAttribute("Photo", createBlobDomain(file));

    }

    public void onFileDownload(ValueChangeEvent valueChangeEvent) {
        UploadedFile file = (UploadedFile) valueChangeEvent.getNewValue();
        if (file.getContentType().equalsIgnoreCase("image/jpeg") ||
            file.getContentType().equalsIgnoreCase("image/png") ||
            file.getContentType().equalsIgnoreCase("image/gif")) {
            try {

                parseFile(file);
                //AdfFacesContext.getCurrentInstance().addPartialTarget(staffTable);

            } catch (Exception e) {
                System.out.println(e.getMessage().toString());
            }
        }
    }
}
