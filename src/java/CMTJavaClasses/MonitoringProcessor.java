/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CMTJavaClasses;

import CMTPersistence.Budget;
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
 * @author billadam
 */
public class MonitoringProcessor {
    
    private List<MonitoringUtility1> monitoringUtilList1;
    private List<MonitoringUtility2> monitoringUtilList2;
    private String getMonitoringUtil1Query;
    private String getMonitoringUtil2Query;


    public MonitoringProcessor () {

        monitoringUtilList1 = new ArrayList<>(); 
        monitoringUtilList2 = new ArrayList<>();
        getMonitoringUtil1Query = "select b.category, e.firstname, e.surname " +
                            "from budget b, employees e where " +
                            "e.id = b.employee_id " +
                            "and b.project_id = :proj_id";
        getMonitoringUtil2Query = "select e.firstname, e.surname, e.unit_cost, sum(p.allocated_days) from planning p , employees e " +
                                  "where p.employee_id = e.id " +
                                  "and project_id = :proj_id group by p.employee_id";
    }

    public void populateMonitoringUtilList1 (int id) {

            Session session = NewHibernateUtil.getSessionFactory().openSession();
            Transaction tx = null;

            try {
                tx = session.beginTransaction();
                Query query = session.createSQLQuery(getMonitoringUtil1Query)
                    .setParameter("proj_id", id);
                List<Object[]> res = (List<Object[]>) query.list();
                
                for (Object[] obj : res) {
                    MonitoringUtility1 mUtil1 = new MonitoringUtility1();
                    mUtil1.setPosition(obj[0].toString());
                    mUtil1.setFirstname(obj[1].toString());
                    mUtil1.setSurname(obj[2].toString());
                    monitoringUtilList1.add(mUtil1);    
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
    
    public void populateMonitoringUtilList2 (int id) {

        Session session = NewHibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;

        try {
            tx = session.beginTransaction();
            Query query = session.createSQLQuery(getMonitoringUtil2Query)
                .setParameter("proj_id", id);
            List<Object[]> res = (List<Object[]>) query.list();

            for (Object[] obj : res) {
                MonitoringUtility2 mUtil2 = new MonitoringUtility2();
                mUtil2.setFirstname(obj[0].toString());
                mUtil2.setSurname(obj[1].toString());
                mUtil2.setUnitCost((float)obj[2]);
                mUtil2.setAllocatedDays((double)obj[3]);
                mUtil2.setSumCost();
                mUtil2.setAllocatedPersonMonths();
                monitoringUtilList2.add(mUtil2);    
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

    public List<MonitoringUtility1> getMonitoringList1 () {
        return this.monitoringUtilList1;   
    }
    
    public List<MonitoringUtility2> getMonitoringList2 () {
        return this.monitoringUtilList2;   
    }

}
