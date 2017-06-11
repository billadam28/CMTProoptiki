/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CMTJavaClasses;

import CMTPersistence.Projects;
import CMTPersistence.Employees;
import CMTPersistence.NewHibernateUtil;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.sql.*;
import java.time.Period;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;
import org.hibernate.Hibernate;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import sun.misc.FloatingDecimal;

/**
 *
 * @author thodo
 */
public class ResourcesProcessor {
    
    private List<Employees> allocatedEmployeeList;
    private String getAllocatedEmployeesQuery;

    public ResourcesProcessor () {

        allocatedEmployeeList = new ArrayList<>(); 
        getAllocatedEmployeesQuery = "select e.id, e.firstname, e.surname " +
                            "from planning p, employees e where " +
                            "e.id = p.employee_id " +
                            "and p.project_id = :proj_id " +
                            "and p.allocated_days > 0 group by p.employee_id ";
    }

    public void populateAllocatedEmployeesList (int id) {

            Session session = NewHibernateUtil.getSessionFactory().openSession();
            Transaction tx = null;

            try {
                tx = session.beginTransaction();
                Query query = session.createSQLQuery(getAllocatedEmployeesQuery)
                    .setParameter("proj_id", id);
                List<Object[]> res = (List<Object[]>) query.list();
                
                for (Object[] obj : res) {
                    Employees empl = new Employees();
                    empl.setId((int) obj[0]);
                    empl.setFirstname(obj[1].toString());
                    empl.setSurname(obj[2].toString());
                    allocatedEmployeeList.add(empl);    
                }
   
            } catch (HibernateException e) {
                if (tx != null) {
                    tx.rollback();
                }
                e.printStackTrace();
            } finally {
                session.close();
            }
    }

    public List<Employees> getAllocatedEmployeesList () {
            return this.allocatedEmployeeList;   
    }

}
