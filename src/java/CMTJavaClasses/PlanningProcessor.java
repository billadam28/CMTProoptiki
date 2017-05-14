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
    private Integer startMonth;
    private Integer endMonth;
    private Integer startYear;
    private Integer endYear;
    private int diffMonth;
    private final String[] months = {"Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sept", "Oct", "Nov", "Dec"};
    private List<Employees> employeeList;
    private List<AllocateUtility> allocateUtilityList;
    private List<AvailableDaysUtility> availableDaysUtilityList;
    private String getEmployeesQuery;
    private String getAllocateUtilityQuery;
    private String getAvailableDaysUtilityQuery;
    private String allocateDays;
    private final Double WORKING_DAYS_PER_MONTH;
    
    public PlanningProcessor() {
        employeeList = new ArrayList<>(); 
        getEmployeesQuery = "select e from Employees e";
        allocateUtilityList = new ArrayList<>(); 
        availableDaysUtilityList = new ArrayList<>();
        getAllocateUtilityQuery = "select p.employee_id, e.firstname, e.surname, p.allocated_days, p.allocation_date " +
                            "from planning p, employees e where " +
                            "p.project_id = :proj_id " +
                            "and p.employee_id = e.id order by p.employee_id, p.allocation_date";
        getAvailableDaysUtilityQuery="select p.employee_id, e.firstname, e.surname, p.allocation_date, sum(p.allocated_days) " +
                            "from planning p, employees e " +
                            "where p.employee_id = e.id " +
                            "and p.allocation_date >= str_to_date(:start_date, \'%Y-%m\') " +
                            "and p.allocation_date <= str_to_date(:end_date, \'%Y-%m-%d\') " +
                            "group by p.employee_id, p.allocation_date " +
                            "order by p.employee_id, p.allocation_date";
        allocateDays = "insert into Planning (project_id,employee_id,allocation_date,allocated_days) "
                        + "VALUES (:project_id,:employee_id,str_to_date(:allocation_date,\'%Y-%m-%d\'),:allocated_days) "
                        + "ON DUPLICATE KEY UPDATE allocated_days=:allocated_days";
        
        WORKING_DAYS_PER_MONTH = 18.2;
    
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
            
            //System.out.printf("Duration:" + dur + " start month:" + startMonth + " end month:" + endMonth + " diff:" + diffMonth);        
        
    }
    
    public void populateAllocateUtilityList (int id) {
        
        Session session = NewHibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        
        try {
            tx = session.beginTransaction();
            Query query = session.createSQLQuery(getAllocateUtilityQuery)
                    .setParameter("proj_id", id);
            List<Object[]> res = (List<Object[]>) query.list();
            AllocateUtility util = new AllocateUtility();
            int previousEmplId = -1;
            
            if (!res.isEmpty()) {
                for (Object[] obj : res) {
                    if (previousEmplId != (int) obj[0]) {
                        if (previousEmplId != -1) {
                            allocateUtilityList.add(util);
                            util = new AllocateUtility();
                        }
                        previousEmplId = (int) obj[0];
                        util.setId((int) obj[0]);
                        util.setFirstname(obj[1].toString());
                        util.setSurname(obj[2].toString());
                        util.getAllocateUtilityList().add((Double) obj[3]);
                    } else {
                        util.getAllocateUtilityList().add((Double) obj[3]);
                    }      
                }
                // add the remainder utility object
                allocateUtilityList.add(util);
            } else {
                populateEmployeesList();
                for (Employees empl : employeeList) {
                    util.setId(empl.getId());
                    System.out.println(util.getId());
                    util.setFirstname(empl.getFirstname());
                    util.setSurname(empl.getSurname());
                    for (int i=0; i<=diffMonth; i++) {
                        util.getAllocateUtilityList().add(0.0);
                    }
                    allocateUtilityList.add(util);
                    util = new AllocateUtility();
                }
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
    
    public void populateAvailableDaysUtilityList () {
        
        Session session = NewHibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        
        try {
            tx = session.beginTransaction();
            Query query = session.createSQLQuery(getAvailableDaysUtilityQuery);
            Integer tmpStartmonth = startMonth + 1;
            Integer tmpEndmonth = endMonth + 1;
            query.setParameter("start_date", startYear.toString()+"-"+tmpStartmonth.toString());
            query.setParameter("end_date", endYear.toString()+"-"+tmpEndmonth.toString()+"-28");
            List<Object[]> res = (List<Object[]>) query.list();
            AvailableDaysUtility util = new AvailableDaysUtility();
            int previousEmplId = -1;
        
            if (!res.isEmpty()) {
                for (Object[] obj : res) {
                    if (previousEmplId != (int) obj[0]) {
                        if (previousEmplId != -1) {
                            availableDaysUtilityList.add(util);
                            util = new AvailableDaysUtility();
                        }
                        previousEmplId = (int) obj[0];
                        util.setId((int) obj[0]);
                        util.setFirstname(obj[1].toString());
                        util.setSurname(obj[2].toString());
                        util.getAvailableDaysList().add(WORKING_DAYS_PER_MONTH - (Double) obj[4]);
                    } else {
                        util.getAvailableDaysList().add(WORKING_DAYS_PER_MONTH - (Double) obj[4]);
                    }      
                }
                // add the remainder utility object
                availableDaysUtilityList.add(util);
            } else {
                populateEmployeesList();
                for (Employees empl : employeeList) {
                    util.setId(empl.getId());
                    util.setFirstname(empl.getFirstname());
                    util.setSurname(empl.getSurname());
                    for (int i=0; i<=diffMonth; i++) {
                        util.getAvailableDaysList().add(WORKING_DAYS_PER_MONTH);
                    }
                    availableDaysUtilityList.add(util);
                    util = new AvailableDaysUtility();
                }
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
        Integer month = this.startMonth+1;
        Integer year = this.startYear;
        for (String paramValue : paramValues) {
            
            //if a month has no allocated days then we insert zero in database.
            if (paramValue == null || paramValue.equals("")) {
                paramValue = "0";
            } 
            Double value = Double.parseDouble(paramValue);
            try {
                tx = session.beginTransaction();
                Query query = session.createSQLQuery(allocateDays);
                query.setParameter("project_id", projectId);
                query.setParameter("employee_id", employeeId);
                query.setParameter("allocation_date", year.toString()+"-"+month.toString()+"-01");
                query.setParameter("allocated_days", value);
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
    
    public List<AllocateUtility> getAllocateUtilityList () {
        return this.allocateUtilityList;   
    }
    
    public List<AvailableDaysUtility> getAvailableDaysUtilityList () {
        return this.availableDaysUtilityList;   
    }
    
}


