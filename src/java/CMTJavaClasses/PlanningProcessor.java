/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CMTJavaClasses;

import CMTPersistence.Projects;
import CMTPersistence.NewHibernateUtil;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
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
    
    public PlanningProcessor() {
        
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
    
}


