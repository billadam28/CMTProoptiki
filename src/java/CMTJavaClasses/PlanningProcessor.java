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

/**
 *
 * @author Thodoris
 */
public class PlanningProcessor {
    
    private int dur;
    private int startMonth;
    private int endMonth;
    private int startYear;
    private int endYear;
    private int diffMonth;
    private final String[] months = {"Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sept", "Oct", "Nov", "Dec"};
    private List<Employees> employeeList;
    private String getEmployeesQuery;
    
    public PlanningProcessor() {
        employeeList = new ArrayList<>(); 
        getEmployeesQuery = "select e from Employees e";
    }
    
    
    public void calculateProjectDuration (int projectId) {
            Session session = NewHibernateUtil.getSessionFactory().openSession();
 
            Query query = session.createQuery("select startDate from Projects where id = '"+projectId+"'");
            Query query2 = session.createQuery("select endDate from Projects where id = '"+projectId+"'");
            Date startDate;
            Date endDate;
            startDate = (Date) query.uniqueResult();
            endDate = (Date) query2.uniqueResult();  
             
            Calendar calendar = new GregorianCalendar();
            calendar.setTime(startDate);
            startYear = calendar.get(Calendar.YEAR);
            startMonth = calendar.get(Calendar.MONTH);
            
            calendar.setTime(endDate);
            endYear = calendar.get(Calendar.YEAR);
            endMonth = calendar.get(Calendar.MONTH);
            
            dur = endYear - startYear;
            diffMonth = (dur * 12) + endMonth - startMonth;
            
            System.out.printf("Duration:" + dur + " start month:" + startMonth + " end month:" + endMonth + " diff:" + diffMonth);        
        
    }
    
    public void populateEmployeesList () {
        
        Session session = NewHibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        
        try {
            tx = session.beginTransaction();
            List<Employees> employees  = session.createQuery(getEmployeesQuery).list();
            for (Employees empl : employees) {
                Hibernate.initialize(empl.getId());
                Hibernate.initialize(empl.getFirstname());
                Hibernate.initialize(empl.getSurname());
                Hibernate.initialize(empl.getStartDate());
                Hibernate.initialize(empl.getEndDate());
                Hibernate.initialize(empl.getUnitCost());
                Hibernate.initialize(empl.getSalary());
                Hibernate.initialize(empl.getEmployeeType());
                employeeList.add(empl);
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
    
    public void allocateDays (int projectId, int employeeId, String [] paramValues) throws ParseException {
        Session session = NewHibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        
        //System.out.println("project = " + projectId + "employee =" + employeeId);
        int month = this.startMonth+1;
        int year = this.startYear;
        for (String paramValue : paramValues) {
            int value = Integer.parseInt(paramValue);
            //System.out.println("ValuesToUpdate =" + paramValue);
            //SimpleDateFormat format = new SimpleDateFormat("yyyy-MM");
            Date date = null;
            //date = format.parse(year+"-"+month);
            //System.out.println("Date "+date);
            try {
                String tstdate="2017-09";
                tx = session.beginTransaction();
                String hql = "insert into Planning (project_id,employee_id,allocation_date,allocated_days) VALUES ('"+projectId+"','"+employeeId+"','2017-04-10','"+value+"')";
                Query query = session.createSQLQuery(hql);
                query.executeUpdate();
                tx.commit();
            } catch (HibernateException e) {
                if (tx != null) {
                    tx.rollback();
                }
            e.printStackTrace();
            } finally {
                //session.close();
            }
            
            month++;
            if (month >= 12) {
                year++;
                month=0;
            }
            
        }
    }
    
    public int getDur(){
        return this.dur;
    }
    
    public int getStartMonth() {
        return this.startMonth;
    }
    
    public int getEndMonth() {
        return this.endMonth;
    }
    
    public int getStartYear() {
        return this.startYear;
    }
    
    public int getEndYear() {
        return this.endYear;
    }  
    
    public int getDiffMonth () {
        return this.diffMonth;
    }
    
    public String [] getMonths () {
        return this.months;
        }
    
    public List<Employees> getEmployeesList () {
        return this.employeeList;   
    }
    
}


