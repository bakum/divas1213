package ua.divas.bean;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

import java.util.StringTokenizer;

import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.faces.event.ValueChangeEvent;

import oracle.adf.model.binding.DCIteratorBinding;
import oracle.adf.view.rich.component.rich.data.RichTable;
import oracle.adf.view.rich.context.AdfFacesContext;

import oracle.jbo.Row;
import oracle.jbo.uicli.binding.JUCtrlHierBinding;

import org.apache.myfaces.trinidad.model.CollectionModel;
import org.apache.myfaces.trinidad.model.UploadedFile;

public abstract class ImportFromCSV {
    private RichTable staffTable;
    
    public void setStaffTable(RichTable staffTable) {
      this.staffTable = staffTable;
    }

    public RichTable getStaffTable() {
      return staffTable;
    }

    public ImportFromCSV() {
    }

    public void fileUploaded(ValueChangeEvent valueChangeEvent) {
      // Add event code here...    
      UploadedFile file = (UploadedFile)valueChangeEvent.getNewValue();
      try {
        
        parseFile(file.getInputStream());
        AdfFacesContext.getCurrentInstance().addPartialTarget(staffTable);  
        
      } catch (IOException e) {
        System.out.println(e.getMessage().toString());
      }
    }

    
    public abstract void parseFile(java.io.InputStream file);

}
