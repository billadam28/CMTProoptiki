/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CMTServlets;

import CMTJavaClasses.EmployeesProcessor;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author arismrk
 */
public class InsertNewEmployee extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws java.text.ParseException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ParseException {
        response.setContentType("text/html;charset=UTF-8");
        
        HttpSession session = request.getSession(false);
        
        if ((session == null) || (session.getAttribute("userId") == null)) {
            this.getServletConfig().getServletContext().getRequestDispatcher("/index.jsp?noSession=1").forward(request, response);
        } else if ("1".equals(request.getSession().getAttribute("userId").toString().trim())) {  
            
            EmployeesProcessor employeesProc = new EmployeesProcessor();
            
            if (request.getParameterNames().hasMoreElements()) {
                SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
                
                employeesProc.getEmployees().setFirstname(request.getParameter("eFirstname"));
                employeesProc.getEmployees().setSurname(request.getParameter("eLastname"));
                
                if (!"".equals(request.getParameter("eStartdate")))
                    employeesProc.getEmployees().setStartDate(format.parse(request.getParameter("eStartdate")));
                
                if (!"".equals(request.getParameter("eEnddate")))
                    employeesProc.getEmployees().setEndDate(format.parse(request.getParameter("eEnddate")));
                
                if (!"".equals(request.getParameter("eUcost")))
                    employeesProc.getEmployees().setUnitCost(Float.parseFloat(request.getParameter("eUcost")));
                
                if (!"".equals(request.getParameter("eSalary")))
                    employeesProc.getEmployees().setSalary(Float.parseFloat(request.getParameter("eSalary")));
                
                employeesProc.getEmployees().setEmployeeType(request.getParameter("eType"));
     
                employeesProc.insertEmployees();
                request.setAttribute("revealSuccesMsg", "true");
    
            }
            
            this.getServletConfig().getServletContext().getRequestDispatcher("/pages/create_employee_form.jsp").forward(request, response);
            
        }
        
        else {
            
            EmployeesProcessor employeesProc = new EmployeesProcessor();
            
            if (request.getParameterNames().hasMoreElements()) {
                SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
                
                employeesProc.getEmployees().setFirstname(request.getParameter("eFirstname"));
                employeesProc.getEmployees().setSurname(request.getParameter("eLastname"));
                
                if (!"".equals(request.getParameter("eStartdate")))
                    employeesProc.getEmployees().setStartDate(format.parse(request.getParameter("eStartdate")));
                
                if (!"".equals(request.getParameter("eEnddate")))
                    employeesProc.getEmployees().setEndDate(format.parse(request.getParameter("eEnddate")));
                
                if (!"".equals(request.getParameter("eUcost")))
                    employeesProc.getEmployees().setUnitCost(Float.parseFloat(request.getParameter("eUcost")));
                
                if (!"".equals(request.getParameter("eSalary")))
                    employeesProc.getEmployees().setSalary(Float.parseFloat(request.getParameter("eSalary")));
                
                employeesProc.getEmployees().setEmployeeType(request.getParameter("eType"));
     
                employeesProc.insertEmployees();
                request.setAttribute("revealSuccesMsg", "true");
    
            }
            
            this.getServletConfig().getServletContext().getRequestDispatcher("/pages/create_employee_form_op.jsp").forward(request, response);
            
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
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(InsertNewProject.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(InsertNewProject.class.getName()).log(Level.SEVERE, null, ex);
        }
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
