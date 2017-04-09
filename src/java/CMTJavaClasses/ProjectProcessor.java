/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CMTJavaClasses;

import CMTPersistence.Projects;
import CMTPersistence.NewHibernateUtil;
import java.util.Date;
import org.hibernate.Hibernate;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author thodo
 */
public class ProjectProcessor {
    private Projects project;
    
    /**
     * This method initializes the lists and declares the queries.
     */
    
    public ProjectProcessor() {
        project = new Projects();
    }

    
    
    public void getProjectDetails (int projectId) {
        Session session = NewHibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        
        try {
            tx = session.beginTransaction();
            Query query = session.createQuery("select p from Projects p where id = '"+projectId+"'");
                project = (Projects) query.uniqueResult();
                Hibernate.initialize(project.getId());
                Hibernate.initialize(project.getProjectName());
                Hibernate.initialize(project.getAcronyme());
                Hibernate.initialize(project.getContractNumber());
                Hibernate.initialize(project.getStartDate());
                Hibernate.initialize(project.getEndDate());
                Hibernate.initialize(project.getBudget());
                Hibernate.initialize(project.getTotalProjectGrant());
                Hibernate.initialize(project.getCmtBudget());
                Hibernate.initialize(project.getTotalCmtGrant());
                Hibernate.initialize(project.getPaymentsScheme());
                Hibernate.initialize(project.getFirstPayment());
                Hibernate.initialize(project.getSecondPayment());
                Hibernate.initialize(project.getThirdPayment());
                Hibernate.initialize(project.getFourthPayment());
                Hibernate.initialize(project.getComments());
            
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
    
    public void updateProject(int id, String pName, String pAcr, Date pSDate, Date pEDate, int connum, float bud, float tgrant, float cmtbud, float tcmtgrant, String pPaySch, float firstpay, float secpay, float thirdpay, float fourthpay, String pComments) {
        Session session = NewHibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;

        try {
            tx = session.beginTransaction();
                Projects project = (Projects) session.get(Projects.class, id);
                project.setProjectName(pName);
                project.setAcronyme(pAcr);
                project.setStartDate(pSDate);
                project.setEndDate(pEDate);
                project.setContractNumber(connum);
                project.setBudget(bud);
                project.setTotalProjectGrant(tgrant);
                project.setCmtBudget(cmtbud);
                project.setTotalCmtGrant(tcmtgrant);
                project.setPaymentsScheme(pPaySch);
                project.setFirstPayment(firstpay);
                project.setSecondPayment(secpay);
                project.setThirdPayment(thirdpay);
                project.setFourthPayment(fourthpay);
                project.setComments(pComments);
                session.update(project);

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
    
    public Projects getProject(){
        return this.project;
    }
    
    public void insertProject() throws HibernateException {
        Session session = NewHibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        
        try {
            tx = session.beginTransaction();
            session.save(this.project); 
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
            throw e;
        } finally {
            session.close();
        }
    }
    
    public void deleteProject(int id) {
        Session session = NewHibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;

        try {
            tx = session.beginTransaction();
                Projects project = (Projects) session.get(Projects.class, id);
                session.delete(project);

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
