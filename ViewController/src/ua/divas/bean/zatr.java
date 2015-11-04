package ua.divas.bean;

import java.util.Calendar;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;

import java.util.Map;

import java.util.Set;

import javax.el.ELContext;

import javax.el.ExpressionFactory;

import javax.el.MethodExpression;

import javax.faces.context.FacesContext;
import javax.faces.event.ActionEvent;

import oracle.adf.model.BindingContext;
import oracle.adf.model.binding.DCBindingContainer;
import oracle.adf.view.rich.component.rich.data.RichTable;
import oracle.adf.view.rich.event.QueryEvent;
import oracle.adf.view.rich.model.AttributeCriterion;
import oracle.adf.view.rich.model.ConjunctionCriterion;
import oracle.adf.view.rich.model.Criterion;
import oracle.adf.view.rich.model.FilterableQueryDescriptor;

import oracle.binding.OperationBinding;

public class zatr {
    private RichTable tb;

    public zatr() {
    }

    public void setTb(RichTable tb) {
        this.tb = tb;
    }

    public RichTable getTb() {
        return tb;
    }

    public void resetTableFilter(ActionEvent actionEvent) {
        FilterableQueryDescriptor queryDescriptor = (FilterableQueryDescriptor) getTb().getFilterModel();
        if (queryDescriptor != null && queryDescriptor.getFilterConjunctionCriterion() != null) {
            ConjunctionCriterion cc = queryDescriptor.getFilterConjunctionCriterion();
            List<Criterion> lc = cc.getCriterionList();
            for (Criterion c : lc) {
                if (c instanceof AttributeCriterion) {
                    AttributeCriterion ac = (AttributeCriterion) c;
                    ac.setValue(null);
                }
            }
            getTb().queueEvent(new QueryEvent(getTb(), queryDescriptor));
        }
    }

    public void onZatratyQuery(QueryEvent queryEvent) {
        FilterableQueryDescriptor des = (FilterableQueryDescriptor)getTb().getFilterModel();
        Map<String, Object> _criteriaMap = des.getFilterCriteria();
        Set<FilterableQueryDescriptor.FilterFeature> featureSet =
            new HashSet<FilterableQueryDescriptor.FilterFeature>();
        featureSet.add(FilterableQueryDescriptor.FilterFeature.CASE_INSENSITIVE);
        Iterator criteriaIter = _criteriaMap.keySet().iterator();
        Map<String, Set<FilterableQueryDescriptor.FilterFeature>> _filterFeatures =
            new HashMap<String, Set<FilterableQueryDescriptor.FilterFeature>>();
        while (criteriaIter != null && criteriaIter.hasNext()) {
            String keyCr = (String)criteriaIter.next();
            ((HashMap)_filterFeatures).put(keyCr, featureSet);


        }

        FilterableQueryDescriptor fqd = (FilterableQueryDescriptor)queryEvent.getDescriptor();
        Map map = fqd.getFilterCriteria();
        BindingContext bctx = BindingContext.getCurrent();
        DCBindingContainer bindings = (DCBindingContainer)bctx.getCurrentBindingsEntry();


        OperationBinding rangeStartOperationBinding = bindings.getOperationBinding("setStartDate");
        OperationBinding rangeEndOperationBinding = bindings.getOperationBinding("setEndDate");
        //get the temporary, transient attributes from the filter map.
        //Note that the attributes exist no-where in the business service
        //but only in the map that represents the filter criteria
        Object hireStartRange = map.get("StartDate");
        Object hireEndRange = map.get("EndDate");
        if (hireStartRange == null) {
            hireStartRange = new oracle.jbo.domain.Date();
        }
        ;

        if (hireEndRange == null) {
            Calendar calendar = Calendar.getInstance();
            calendar.set(Calendar.DAY_OF_YEAR,
                         calendar.getActualMaximum(Calendar.DAY_OF_YEAR)); // это будет конец месяца
            java.util.Date pDate = calendar.getTime();
            hireEndRange = new oracle.jbo.domain.Date(new java.sql.Date(pDate.getTime()));
        }
        ;
        //set the start and end date of the range to search. If the attribute
        //values are not set then NULL is passed to the biding variables, which
        //more or less resets the View Criteria to allow all data to be queried
        rangeStartOperationBinding.getParamsMap().put("value", hireStartRange);
        rangeEndOperationBinding.getParamsMap().put("value", hireEndRange);
        //remove temporary attributes as they don't exist in the
        //business service and would cause a NPE if passed with
        //the query.
        map.remove("StartDate");
        map.remove("EndDate");
        //set bind variable on the business service. Note that this does not
        //yet query the View Object
        rangeStartOperationBinding.execute();
        rangeEndOperationBinding.execute();

        des.setFilterFeatures(_filterFeatures);
        invokeMethod("#{bindings.VwZatraty1Query.processQuery}", QueryEvent.class, queryEvent);
        map.put("StartDate", hireStartRange);
        map.put("EndDate", hireEndRange);

    }

    public static Object invokeMethod(String expr, Class[] paramTypes, Object[] params) {
        FacesContext fc = FacesContext.getCurrentInstance();
        ELContext elc = fc.getELContext();
        ExpressionFactory ef = fc.getApplication().getExpressionFactory();
        MethodExpression me = ef.createMethodExpression(elc, expr, Object.class, paramTypes);
        return me.invoke(elc, params);
    }

    public static Object invokeMethod(String expr, Class paramType, Object param) {
        return invokeMethod(expr, new Class[] { paramType }, new Object[] { param });
    }
}
