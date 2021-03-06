/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CMTServlets;

import CMTPersistence.Employees;
import CMTPersistence.NewHibernateUtil;
import CMTJavaClasses.EmployeesProcessor;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.Hibernate;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author arismrk
 */
public class EditEmployeeSrvlt extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession(false);

        if ((session == null) || (session.getAttribute("userId") == null)) {
            this.getServletConfig().getServletContext().getRequestDispatcher("/index.jsp?noSession=1").forward(request, response);
        } else if ("1".equals(request.getSession().getAttribute("userId").toString().trim())) {  
            EmployeesProcessor employeesProcessor = new EmployeesProcessor();

            String eId = request.getParameter("eId");
            int id = Integer.parseInt(eId);

            employeesProcessor.getEmployeesDetails(id);
            request.setAttribute("employeesProcessor", employeesProcessor);

            //System.out.println(employeesProcessor.getEmployees().getFirstname());
            //System.out.println(employeesProcessor.getEmployees().getSalary());
            request.setAttribute("eId", id);

            this.getServletConfig().getServletContext().getRequestDispatcher("/pages/editemployees.jsp").forward(request, response);
        } 
        else {

            EmployeesProcessor employeesProcessor = new EmployeesProcessor();

            String eId = request.getParameter("eId");
            int id = Integer.parseInt(eId);

            employeesProcessor.getEmployeesDetails(id);
            request.setAttribute("employeesProcessor", employeesProcessor);

            //System.out.println(employeesProcessor.getEmployees().getFirstname());
            //System.out.println(employeesProcessor.getEmployees().getSalary());
            request.setAttribute("eId", id);

            this.getServletConfig().getServletContext().getRequestDispatcher("/pages/editemployees_op.jsp").forward(request, response);
        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
