package ua.divas.bean;

import java.math.BigDecimal;

import javax.el.ELContext;
import javax.el.ExpressionFactory;
import javax.el.ValueExpression;

import javax.faces.application.Application;
import javax.faces.application.FacesMessage;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.event.ActionEvent;
import javax.faces.event.ValueChangeEvent;

import javax.faces.validator.ValidatorException;

import oracle.adf.model.BindingContext;
import oracle.adf.model.binding.DCBindingContainer;
import oracle.adf.model.binding.DCIteratorBinding;

import oracle.binding.BindingContainer;
import oracle.binding.OperationBinding;

import oracle.jbo.Row;

public class ProfitJsfBean {
    public ProfitJsfBean() {
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

    public void onPayChange(ValueChangeEvent valueChangeEvent) {
        valueChangeEvent.getComponent().processUpdates(FacesContext.getCurrentInstance());
        //System.out.println(vce.getNewValue());
        String pId = getValueFrmExpression("#{row.bindings.PayId.attributeValue}");
        System.out.println(pId);
        DCBindingContainer bd = (DCBindingContainer) BindingContext.getCurrent().getCurrentBindingsEntry();
        DCIteratorBinding it = bd.findIteratorBinding("ProfitDistribTpView2Iterator");
        Row currRow = it.getCurrentRow();
        currRow.setAttribute("Summ", null);
        currRow.setAttribute("CalcId", null);
        currRow.setAttribute("Percent", null);

        BindingContainer binding = BindingContext.getCurrent().getCurrentBindingsEntry();
        OperationBinding ob = binding.getOperationBinding("retrieveSumma");

        if (ob != null) {
            ob.getParamsMap().put("pId", pId);
            BigDecimal summa = (BigDecimal) ob.execute();
            System.out.println(summa);
            currRow.setAttribute("Summ", summa);
        }

        ob = binding.getOperationBinding("retrieveCalcId");
        if (ob != null) {
            ob.getParamsMap().put("pId", pId);
            String cid = (String) ob.execute();
            System.out.println(cid);
            currRow.setAttribute("CalcId", cid);
        }

        ob = binding.getOperationBinding("retrieveStavka");
        if (ob != null) {
            ob.getParamsMap().put("pId", pId);
            BigDecimal summa = (BigDecimal) ob.execute();
            System.out.println(summa);
            currRow.setAttribute("Percent", summa);
            /* if (summa.intValue() != 0) {
                String TotalStr = getValueFrmExpression("#{bindings.TotalSumm.attributeValue}");
                //System.out.println(TotalStr);
                BigDecimal TotalSumm = new BigDecimal(TotalStr);
                BigDecimal res =
                    summa.divide(new BigDecimal(100)).multiply(TotalSumm).setScale(2, BigDecimal.ROUND_HALF_UP);
                currRow.setAttribute("Summ", res);
            } */
        }
    }

    public void onCalcChange(ValueChangeEvent valueChangeEvent) {
        valueChangeEvent.getComponent().processUpdates(FacesContext.getCurrentInstance());
        //System.out.println(vce.getNewValue());
        //String pId = getValueFrmExpression("#{row.bindings.CalcId.attributeValue}");
        //System.out.println(pId);
        DCBindingContainer bd = (DCBindingContainer) BindingContext.getCurrent().getCurrentBindingsEntry();
        DCIteratorBinding it = bd.findIteratorBinding("ProfitDistribTpView2Iterator");
        Row currRow = it.getCurrentRow();
        currRow.setAttribute("Summ", 0);
        currRow.setAttribute("Percent", 0);
    }

    public void onGetProfit(ActionEvent actionEvent) {
        actionEvent.getComponent().processUpdates(FacesContext.getCurrentInstance());

        DCBindingContainer bd = (DCBindingContainer) BindingContext.getCurrent().getCurrentBindingsEntry();
        DCIteratorBinding it = bd.findIteratorBinding("ProfitDistribView1Iterator");
        Row currRow = it.getCurrentRow();
        currRow.setAttribute("Summ", null);

        BindingContainer binding = BindingContext.getCurrent().getCurrentBindingsEntry();
        OperationBinding ob = binding.getOperationBinding("getProfitByDivision");
        if (ob != null) {
            BigDecimal summa = (BigDecimal) ob.execute();
            System.out.println(summa);
            currRow.setAttribute("Summ", summa);
        }
    }

    private boolean isDigit(String st) {
        char[] utu = st.toCharArray();
        boolean isDigit = true;
        for (int i = 0; i < st.length(); i++) {
            if (!Character.isDigit(utu[i])) {
                isDigit = false;
                break;
            }
        }
        return isDigit;
    }

    public void onSummValidate(FacesContext facesContext, UIComponent uIComponent, Object object) {
        //String clientId = uIComponent.getClientId(facesContext);
        boolean fatal = false;

        if ((object == null) || (object.toString().isEmpty())) {
            fatal = true;
       // } else if (!isDigit(object.toString())) {
       //     fatal = true;
        } else if (Integer.parseInt(object.toString()) <= 0) {
            fatal = true;
        }

        if (fatal) {
            /*  facesContext.addMessage(clientId,
                                    new FacesMessage(FacesMessage.SEVERITY_FATAL, "Ошибка",
                                                     "Заработная плата должна быть > 0")); */
            throw new ValidatorException(new FacesMessage(FacesMessage.SEVERITY_ERROR, "Ошибка валидации",
                                                          "Сумма должна быть > 0"));
        }

    }
}
