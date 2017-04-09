/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CMTJavaClasses;

import CMTPersistence.Budget;
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
 * @author adamopoulo
 */
public class ProjectBudgetProcessor {
    
    private List<Budget> budgetEntries;
    private final String budgetQuery;
    
    public ProjectBudgetProcessor(){
        
        budgetEntries = new ArrayList<>();
        budgetQuery = "Select b from Budget b where b.projectId = :id";
    }
    
    public void getBudgetEntries(Integer projectId){
        Session session = NewHibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;

        try {
            tx = session.beginTransaction();
            Query query;
            query = session.createQuery(budgetQuery)
                    .setParameter("id", projectId);
            List<Budget> res = (List<Budget>) query.list();
            for (Budget bgt : res) {
                // we get lazy initialization exception, so we need to 
                // initialize the child objects in order to access them in 
                // the jsp page after we close the session.
                //Hibernate.initialize(bgt.getAssignedVisitor());
                //Hibernate.initialize(bgt.getSpecialty());
                //Hibernate.initialize(bgt.getInstitution());
                //Hibernate.initialize(bgt.getInstitution().getCity());
                //Hibernate.initialize(bgt.getInstitution().getCity().getGeoArea());
                budgetEntries.add(bgt);
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
    
    public List<Budget> getBudgetList(){
        return this.budgetEntries;
    }
    
}


