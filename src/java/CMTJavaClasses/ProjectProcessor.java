/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CMTJavaClasses;

import CMTPersistence.Projects;
import CMTPersistence.NewHibernateUtil;
import java.util.ArrayList;
import java.util.List;
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
    String nameOfProject;
    String acrOfProject;
    //private List<Visitor> visitorsList;
    //private List<Group> groupsList;
    //private List<Visitor> visitorsNoLeaderList;
    //private List<Group> groupsNoLeaderList;
    //private final String getVisitorsQuery;
    //private final String getGroupsQuery;
    //private final String getVisitorsNoLeaderQuery;
    
    
    /**
     * This method initializes the lists and declares the queries.
     */
    
    public ProjectProcessor() {
        project = new Projects();
        //visitorsList = new ArrayList<>();
        //groupsList= new ArrayList<>();
        //visitorsNoLeaderList = new ArrayList<>();
                
        //getVisitorsQuery = "select v from Visitor v where group = null";
        //getGroupsQuery = "from Group g order by g.name asc";
        //getVisitorsNoLeaderQuery = "from Visitor v where group != null";
    }

    /**
     * This method checks if the given name exists or not. 
     * @param nameOfGroup
     * @return True or False.
     */
    
    public void editProjectForm (int projectId) {
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
                
                //System.out.println(project.getId() + project.getAcronyme());
            
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
    
    /*public void updateProject(Date date, String name, boolean extra, String comments, int projectId, int traineeId) {
            Session session = NewHibernateUtil.getSessionFactory().openSession();
            Transaction tx = null;

            try {
                tx = session.beginTransaction();
                    Project project = (Project) session.get(Project.class, projectId);
                    project.setDate(date);
                    project.setStatus(status);
                    project.setExtraVisit(extra);
                    project.setComments(comments);
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
            
    } */
    
    public Projects getProject(){
        return this.project;
    }
    
    public void insertProject(){
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
        } finally {
            session.close();
        }
    }
    
}
