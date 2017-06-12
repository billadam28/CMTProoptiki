/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CMTJavaClasses;

import CMTPersistence.Budget;
import CMTPersistence.Employees;
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

    public ProjectBudgetProcessor() {
        budgetEntries = new ArrayList<>();
        budgetQuery = "Select b from Budget b";
    }

    public void getBudgetEntries(Integer projectId) {
        Session session = NewHibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;

        try {
            tx = session.beginTransaction();
            Query query;
            query = session.createQuery(budgetQuery);
            List<Budget> res = (List<Budget>) query.list();
            for (Budget bgt : res) {
                Hibernate.initialize(bgt.getProject());
                Hibernate.initialize(bgt.getCategory());
                Hibernate.initialize(bgt.getDialyCost());
                Hibernate.initialize(bgt.getMonthlyCost());
                Hibernate.initialize(bgt.getEstimatedPersonDays());
                Hibernate.initialize(bgt.getEstimatedPersonMonths());
                if (bgt.getProject().getId() == projectId) {
                    budgetEntries.add(bgt);
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

    public List<Budget> getBudgetList() {
        return this.budgetEntries;
    }

    public void insertBudgets(Budget budget) {
        Session session = NewHibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;

        try {
            tx = session.beginTransaction();
            session.save(budget);
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

    public void updateBudget(Budget b) {
        Session session = NewHibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;

        try {
            tx = session.beginTransaction();
            Budget budget = (Budget) session.get(Budget.class, b.getId());
            budget.setCategory(b.getCategory());
            budget.setDialyCost(b.getDialyCost());
            budget.setMonthlyCost(b.getMonthlyCost());
            budget.setEstimatedPersonDays(b.getEstimatedPersonDays());
            budget.setEstimatedPersonMonths(b.getEstimatedPersonMonths());
            session.update(budget);
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

    public void deleteBudget(int id) {
        Session session = NewHibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;

        try {
            tx = session.beginTransaction();
            Budget budget = (Budget) session.get(Budget.class, id);
            session.delete(budget);

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

    public void getBudgetDetails(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
