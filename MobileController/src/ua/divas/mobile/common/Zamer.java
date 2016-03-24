package ua.divas.mobile.common;

import java.util.Map;

import oracle.adf.share.logging.ADFLogger;
import oracle.adf.view.rich.render.ClientEvent;

public class Zamer extends WorkbetterBaseBean {
    private static ADFLogger _logger = ADFLogger.createADFLogger(Zamer.class);
    private static final String HIDDEN_NAV_BUTTON = "h_navb2";
    
    public Zamer() {
        super();
    }

    public void doEditZamer(ClientEvent clientEvent) {
        if (!queueActionOnCommandComponmentById(HIDDEN_NAV_BUTTON)) {
            _logger.severe("Error: unable to locate hidden havigation component " + HIDDEN_NAV_BUTTON);
        }
    }
}
