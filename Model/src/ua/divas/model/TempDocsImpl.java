package ua.divas.model;

import java.util.UUID;

import oracle.jbo.Key;
import oracle.jbo.domain.BlobDomain;
import oracle.jbo.server.EntityDefImpl;
import oracle.jbo.server.EntityImpl;

import ua.divas.classes.DivasEntityNoDelete;
// ---------------------------------------------------------------------
// ---    File generated by Oracle ADF Business Components Design Time.
// ---    Tue Aug 09 15:24:37 EEST 2016
// ---    Custom code may be added to this class.
// ---    Warning: Do not modify method signatures of generated methods.
// ---------------------------------------------------------------------
public class TempDocsImpl extends DivasEntityNoDelete {
    
    protected void callId() {
        this.setId(UUID.randomUUID().toString());
    }
    /**
     * AttributesEnum: generated enum for identifying attributes and accessors. DO NOT MODIFY.
     */
    public enum AttributesEnum {
        Id,
        FileName,
        FileCont,
        FileDiscription;
        private static AttributesEnum[] vals = null;
        private static final int firstIndex = 0;

        public int index() {
            return AttributesEnum.firstIndex() + ordinal();
        }

        public static final int firstIndex() {
            return firstIndex;
        }

        public static int count() {
            return AttributesEnum.firstIndex() + AttributesEnum.staticValues().length;
        }

        public static final AttributesEnum[] staticValues() {
            if (vals == null) {
                vals = AttributesEnum.values();
            }
            return vals;
        }
    }

    public static final int ID = AttributesEnum.Id.index();
    public static final int FILENAME = AttributesEnum.FileName.index();
    public static final int FILECONT = AttributesEnum.FileCont.index();
    public static final int FILEDISCRIPTION = AttributesEnum.FileDiscription.index();

    /**
     * This is the default constructor (do not remove).
     */
    public TempDocsImpl() {
    }

    /**
     * @return the definition object for this instance class.
     */
    public static synchronized EntityDefImpl getDefinitionObject() {
        return EntityDefImpl.findDefObject("ua.divas.model.TempDocs");
    }

    /**
     * Gets the attribute value for Id, using the alias name Id.
     * @return the value of Id
     */
    public String getId() {
        return (String) getAttributeInternal(ID);
    }

    /**
     * Sets <code>value</code> as the attribute value for Id.
     * @param value value to set the Id
     */
    public void setId(String value) {
        setAttributeInternal(ID, value);
    }

    /**
     * Gets the attribute value for FileName, using the alias name FileName.
     * @return the value of FileName
     */
    public String getFileName() {
        return (String) getAttributeInternal(FILENAME);
    }

    /**
     * Sets <code>value</code> as the attribute value for FileName.
     * @param value value to set the FileName
     */
    public void setFileName(String value) {
        setAttributeInternal(FILENAME, value);
    }

    /**
     * Gets the attribute value for FileCont, using the alias name FileCont.
     * @return the value of FileCont
     */
    public BlobDomain getFileCont() {
        return (BlobDomain) getAttributeInternal(FILECONT);
    }

    /**
     * Sets <code>value</code> as the attribute value for FileCont.
     * @param value value to set the FileCont
     */
    public void setFileCont(BlobDomain value) {
        setAttributeInternal(FILECONT, value);
    }

    /**
     * Gets the attribute value for FileDiscription, using the alias name FileDiscription.
     * @return the value of FileDiscription
     */
    public String getFileDiscription() {
        return (String) getAttributeInternal(FILEDISCRIPTION);
    }

    /**
     * Sets <code>value</code> as the attribute value for FileDiscription.
     * @param value value to set the FileDiscription
     */
    public void setFileDiscription(String value) {
        setAttributeInternal(FILEDISCRIPTION, value);
    }

    /**
     * @param id key constituent

     * @return a Key object based on given key constituents.
     */
    public static Key createPrimaryKey(String id) {
        return new Key(new Object[] { id });
    }

}

