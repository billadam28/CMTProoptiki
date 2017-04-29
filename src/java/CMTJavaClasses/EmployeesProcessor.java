package CMTJavaClasses;

import CMTPersistence.NewHibernateUtil;
import CMTPersistence.Employees;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.hibernate.Hibernate;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;


/**
 *
 * @author arismrk
 */
public class EmployeesProcessor {
    private Employees employee;
    
    /**
     * This method initializes the lists and declares the queries.
     */
    
    public EmployeesProcessor() {
        employee = new Employees();
    }

    
    
    public void getEmployeesDetails (int employeeId) {
        Session session = NewHibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        
        try {
            tx = session.beginTransaction();
            Query query = session.createQuery("select e from Employees e where id = '"+employeeId+"'");
                employee = (Employees) query.uniqueResult();
                Hibernate.initialize(employee.getId());
                Hibernate.initialize(employee.getFirstname());
                Hibernate.initialize(employee.getSurname());
                Hibernate.initialize(employee.getStartDate());
                Hibernate.initialize(employee.getEndDate());
                Hibernate.initialize(employee.getUnitCost());
                Hibernate.initialize(employee.getSalary());
                Hibernate.initialize(employee.getEmployeeType());
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
    
    public void updateEmployees(int id, String eName, String esName, Date eSDate, Date eEDate, float suCost, float eSalary, String eType) {
        Session session = NewHibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;

        try {
            tx = session.beginTransaction();
                Employees employee = (Employees) session.get(Employees.class, id);
                employee.setFirstname(eName);
                employee.setSurname(esName);
                employee.setStartDate(eSDate);
                employee.setEndDate(eEDate);
                employee.setUnitCost(suCost);
                employee.setSalary(eSalary);
                employee.setEmployeeType(eType);
                session.update(employee);

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
    
    public Employees getEmployees(){
        return this.employee;
    }
    
    public void insertEmployees(){
        Session session = NewHibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        
        try {
            tx = session.beginTransaction();
            session.save(this.employee); 
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
    
    public void deleteEmployees(int id) {
        Session session = NewHibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;

        try {
            tx = session.beginTransaction();
                Employees employee = (Employees) session.get(Employees.class, id);
                session.delete(employee);

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
    
}