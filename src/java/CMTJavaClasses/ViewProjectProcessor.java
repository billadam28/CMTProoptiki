package CMTJavaClasses;

import CMTPersistence.Projects;
import java.util.List;
import java.util.ArrayList;
import CMTPersistence.NewHibernateUtil;
import org.hibernate.Hibernate;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class ViewProjectProcessor {
    final List<Projects> projectList;
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
            List<Projects> projects  = session.createQuery(getProjectsQuery).list();
            for (Projects project : projects) {
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
    
    public List<Projects> projectList () {
        return this.projectList;
        
        
        
    }
}