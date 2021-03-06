package CMTJavaClasses;

import CMTPersistence.Employees;
import java.util.List;
import java.util.ArrayList;
import CMTPersistence.NewHibernateUtil;
import org.hibernate.Hibernate;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;


/**
 *
 * @author arismrk
 */
public class ViewEmployeesProcessor {
    private List<Employees> employeeList;
    private String getEmployeesQuery;
    
    public ViewEmployeesProcessor() {
        employeeList = new ArrayList<>(); 
        getEmployeesQuery = "select e from Employees e";
    }
    
    public void populateEmployeesList() {
        Session session = NewHibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        
        try {
            tx = session.beginTransaction();
            List <Employees> employees  = session.createQuery(getEmployeesQuery).list();
            for (Employees employee : employees) {
                Hibernate.initialize(employee.getId());
                Hibernate.initialize(employee.getFirstname());
                Hibernate.initialize(employee.getSurname());
                Hibernate.initialize(employee.getStartDate());
                Hibernate.initialize(employee.getEndDate());
                Hibernate.initialize(employee.getUnitCost());
                Hibernate.initialize(employee.getSalary());
                Hibernate.initialize(employee.getEmployeeType());
                employeeList.add(employee);
            }
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }             
    }
    
    public List<Employees> getEmployeesList () {
        return this.employeeList;
        
        
        
    }
}