package ua.divas.bean;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import java.net.URLEncoder;

import java.sql.SQLException;

import javax.faces.context.FacesContext;
import javax.faces.event.ActionEvent;
import javax.faces.event.ValueChangeEvent;

import javax.servlet.http.HttpServletResponse;

import oracle.adf.model.binding.DCIteratorBinding;

import oracle.adf.view.rich.component.rich.data.RichTable;

import oracle.adf.view.rich.context.AdfFacesContext;

import oracle.jbo.Row;
import oracle.jbo.ViewObject;
import oracle.jbo.domain.BlobDomain;
import oracle.jbo.server.ViewObjectImpl;

import org.apache.myfaces.trinidad.model.UploadedFile;

public class FileBean {
    private static final String FILE_ITERATOR_NAME = "TempDocsView1Iterator";
    private DCIteratorBinding fileIterator;
    private ViewObjectImpl fileVO;
    private RichTable table;


    public FileBean() {
        // получаем ссылку на итератор
        fileIterator = ADFUtils.findIterator(FILE_ITERATOR_NAME);
        // получаем ссылку на ViewObject
        fileVO = (ViewObjectImpl) fileIterator.getViewObject();
    }

    public void uploadFile(ValueChangeEvent valueChangeEvent) {
        System.out.println("uploadFile-START");
        if (valueChangeEvent.getNewValue() != null) {
            saveFileToBlob((UploadedFile) valueChangeEvent.getNewValue());
        }
        System.out.println("uploadFile-FINISH");
    }

    public void downloadFile(FacesContext facesContext, OutputStream outputStream) {
        System.out.println("downloadFile - START");
        try {
            Row row = fileVO.getCurrentRow();
            System.out.println(row.getAttribute("Id"));
            //получаем имя файла
            String fileName = (String) row.getAttribute("FileName");
            // кодируем имя файла для корректного считывания браузером
            String encodedFileName = URLEncoder.encode(fileName, "UTF-8").replace("+", "%20");
            System.out.println("File Name = " + fileName + "; Encoded File Name = " + encodedFileName);
            HttpServletResponse response =
                (HttpServletResponse) facesContext.getCurrentInstance().getExternalContext().getResponse();
            //следущее значение задано в атрибуте contentType fileDownloadActionListener
            //response.setContentType("application/x-download");
            //задаем имя файла получаемое браузером
            response.setHeader("Content-Disposition", "attachment;filename=\"" + encodedFileName + "\"");
            // BLOB-содержимое файла
            BlobDomain blob = (BlobDomain) row.getAttribute("FileCont");
            // копируем содержимое BLOB в отдаваемый поток
            InputStream in = blob.getInputStream();
            //OutputStream out = response.getOutputStream();
            OutputStream out = outputStream;
            writeFromInputToOutput(in, out);
            in.close();
            out.flush();
            out.close();
            facesContext.responseComplete();
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println("downloadFile-FINISH");

    }

    private void saveFileToBlob(UploadedFile fileInfo) {
        System.out.println("saveFileToBlob-START");
        try {
            //создаем новую строку
            Row row = fileVO.createRow();
            //     имя    файла    и    его    содержимое
            row.setAttribute("FileName", fileInfo.getFilename());
            row.setAttribute("FileCont", createBlobDomain(fileInfo));
            if (fileInfo.getFilename().indexOf(".apk") != -1) {
                row.setAttribute("FileDiscription", "SiGRAND Mobile for Android");
            } else {
                row.setAttribute("FileDiscription", "Other file");
            }
            //добавляем строку во VO
            fileVO.insertRow(row);
            fileVO.getApplicationModule().getTransaction().commit();
        } catch (Exception e) {
            e.printStackTrace();
            fileVO.getApplicationModule().getTransaction().rollback();
        }
        System.out.println("saveFileToBlob-FINISH");
    }

    /**
     *
    Создает BlobDomain по данным UploadedFile
     * @param file
     * @return
     */
    private BlobDomain createBlobDomain(UploadedFile file) {
        System.out.println("createBlobDomain-START");
        InputStream in = null;
        BlobDomain blobDomain = null;
        OutputStream out = null;
        try {
            in = file.getInputStream();
            blobDomain = new BlobDomain();
            out = blobDomain.getBinaryOutputStream();
            writeFromInputToOutput(in, out);
        } catch (SQLException e) {
            e.fillInStackTrace();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        System.out.println("createBlobDomain-FINISH");
        return blobDomain;
    }

    private static final int BUFFER_SIZE = 1024 * 4;
    private static final int EOF_MARK = -1;

    /**
     * Полное копирование данных из одного потока в другой
     * @param source
     * @param dest
     * @return
     */
    public static int writeFromInputToOutput(InputStream source, OutputStream dest) {
        System.out.println("writeFromInputToOutput-START");
        byte[] buffer = new byte[BUFFER_SIZE];
        int bytesRead = EOF_MARK;
        int count = 0;
        try {
            while ((bytesRead = source.read(buffer)) != EOF_MARK) {
                dest.write(buffer, 0, bytesRead);
                count += bytesRead;
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        System.out.println("writeFromInputToOutput-FINISH");
        return count;
    }

    public void deleteFile(ActionEvent actionEvent) {
        System.out.println("deletingFile - START");
        try {
            //Row row = fileVO.getCurrentRow();
            fileVO.removeCurrentRow();
            fileVO.getApplicationModule().getTransaction().commit();
        } catch (Exception e) {
            e.printStackTrace();
            fileVO.getApplicationModule().getTransaction().rollback();
        }
        System.out.println("deletingFile-FINISH");

    }

    public void refreshFile(ActionEvent actionEvent) {
        fileIterator.executeQuery();
        AdfFacesContext.getCurrentInstance().addPartialTarget(getTable());
    }

    public void setTable(RichTable table) {
        this.table = table;
    }

    public RichTable getTable() {
        return table;
    }
}
