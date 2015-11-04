package ua.divas.bean;

import java.io.OutputStream;

import javax.faces.context.FacesContext;

import oracle.adf.model.BindingContext;
import oracle.adf.model.binding.DCBindingContainer;
import oracle.adf.model.binding.DCIteratorBinding;

import oracle.binding.BindingContainer;
import oracle.binding.OperationBinding;

import oracle.jbo.Row;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

public class RaitingsBean {
    public RaitingsBean() {
    }
    
    private String getKontragName(String Id){
            BindingContainer binding = BindingContext.getCurrent().getCurrentBindingsEntry();
            OperationBinding ob = binding.getOperationBinding("retrieveKontragName");
            if (ob != null) {
                ob.getParamsMap().put("Id", Id);
                String measure = (String) ob.execute();
                System.out.println(measure);
                //currRow.setAttribute("MeasureId", measure);
                return measure;
            }
            return null;
        }

    public void generateExcel(FacesContext facesContext, OutputStream outputStream) {
        try {
            HSSFWorkbook workbook = new HSSFWorkbook();
            HSSFSheet worksheet = workbook.createSheet("Рейтинги");
            DCBindingContainer bindings = (DCBindingContainer) BindingContext.getCurrent().getCurrentBindingsEntry();
            DCIteratorBinding dcIteratorBindings = bindings.findIteratorBinding("VwRating1Iterator");
            HSSFRow excelrow = null;

            // Get all the rows of a iterator
            oracle.jbo.Row[] rows = dcIteratorBindings.getAllRowsInRange();
            int i = 0;
            for (oracle.jbo.Row row : rows) {
                //Integer buyer = (Integer)row.getAttribute("IsBuyer");
                //if (buyer != 1 ) continue;
                //print header on first row in excel
                if (i == 0) {
                    excelrow = (HSSFRow) worksheet.createRow((short) i);
                    short j = 0;
                    for (String colName : row.getAttributeNames()) {
                        HSSFCell cellA1 = excelrow.createCell((short) j);
                        if (colName.equalsIgnoreCase("Place")) {
                            cellA1.setCellValue("Место");
                        }
                        if (colName.equalsIgnoreCase("DivisionId")) {
                            cellA1.setCellValue("Менеджер");
                        }
                        if (colName.equalsIgnoreCase("Cnt")) {
                            cellA1.setCellValue("Количество заказов");
                        }
                        if (colName.equalsIgnoreCase("Total")) {
                            cellA1.setCellValue("Заказов на сумму");
                        }
                        if (colName.equalsIgnoreCase("BallSum")) {
                            cellA1.setCellValue("Баллов по сумме");
                        }
                        if (colName.equalsIgnoreCase("BallCnt")) {
                            cellA1.setCellValue("Баллов по количеству");
                        }
                        if (colName.equalsIgnoreCase("BallTotal")) {
                            cellA1.setCellValue("Всего баллов");
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
                    } */
                    if (colName.equalsIgnoreCase("Place")) {
                        cell.setCellValue(row.getAttribute(colName).toString());
                    }
                    if (colName.equalsIgnoreCase("DivisionId")) {
                        if (null != row.getAttribute(colName)) {
                            cell.setCellValue(getKontragName(row.getAttribute(colName).toString()));
                        }
                    }
                    if (colName.equalsIgnoreCase("Cnt")) {
                        if (null != row.getAttribute(colName)) {
                            cell.setCellValue(row.getAttribute(colName).toString());
                        }
                    }
                    if (colName.equalsIgnoreCase("Total")) {
                        if (null != row.getAttribute(colName)) {
                            cell.setCellValue(row.getAttribute(colName).toString());
                        }
                    }
                    if (colName.equalsIgnoreCase("BallSum")) {
                        if (null != row.getAttribute(colName)) {
                            cell.setCellValue(row.getAttribute(colName).toString());
                        }
                    }
                    if (colName.equalsIgnoreCase("BallCnt")) {
                        if (null != row.getAttribute(colName)) {
                            cell.setCellValue(row.getAttribute(colName).toString());
                        }
                    }
                    if (colName.equalsIgnoreCase("BallTotal")) {
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
                worksheet.autoSizeColumn(4);
                worksheet.autoSizeColumn(5);
                worksheet.autoSizeColumn(6);
            }

            workbook.write(outputStream);
            outputStream.flush();
        } catch (Exception e) {
            // TODO: Add catch code
            e.printStackTrace();
        }
    }
}
