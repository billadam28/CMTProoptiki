package CMTJavaClasses;

import CMTPersistence.Project;
import java.util.List;
import java.util.ArrayList;
import CMTPersistence.NewHibernateUtil;
import org.hibernate.Hibernate;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class ViewProjectProcessor {
    private List<Project> projectList;
    private final String getProjectsQuery;
    
    public ViewProjectProcessor() {
        projectList = new ArrayList<>(); 
        getProjectsQuery = "select * from Projects";
    }
    
    public void showProjectList() {
        Session session = NewHibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        
        try {
            tx = session.beginTransaction();
            List<Project> projects  = session.createQuery(getProjectsQuery).list();
            for (Project project : projects) {
                Hibernate.initialize(project.getAssignedVisitor());
                Hibernate.initialize(project.getSpecialty());
                Hibernate.initialize(project.getInstitution());
                Hibernate.initialize(project.getInstitution().getCity());
                Hibernate.initialize(project.getInstitution().getCity().getGeoArea());
                projectList.add(project);

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
    
    public List<Project> projectList () {
        return this.projectList;
    }
}