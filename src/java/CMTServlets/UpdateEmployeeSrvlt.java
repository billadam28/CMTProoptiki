/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CMTServlets;

import CMTJavaClasses.EmployeesProcessor;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.*;
import java.util.*; 
import java.text.ParseException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author arismrk
 */
public class UpdateEmployeeSrvlt extends HttpServlet {

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
        //String trainee = "0";
        if ((session == null) || (session.getAttribute("userId") == null)) {
            this.getServletConfig().getServletContext().getRequestDispatcher("/index.jsp?noSession=1").forward(request, response);
        } else {
            
            
            try 
            {    
                EmployeesProcessor employeeProcessor = new EmployeesProcessor();
                String eId = request.getParameter("eId");
                int id = Integer.parseInt(eId);
                String eName = request.getParameter("eName");
                String esName = request.getParameter("esName");
                SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
                Date eSDate = format.parse(request.getParameter("eSDate"));
                Date eEDate = format.parse(request.getParameter("eEDate"));
                String suCost = request.getParameter("suCost");
                float ucost = Integer.parseInt(suCost);
                String eSalary = request.getParameter("eSalary");
                float salary = Float.parseFloat(eSalary);
                String eType = request.getParameter("eType");
                
                //EmployeesProcessor.updateEmployees(id,eName,esName,eSDate,eEDate,suCost,eSalary,eType);
                
                request.setAttribute("revealSuccesMsg", "true");
                //EmployeesProcessor.getEmployeesDetails(id);
                request.setAttribute("EmployeesProcessor", employeeProcessor);
                this.getServletConfig().getServletContext().getRequestDispatcher("/pages/editemployees.jsp").forward(request, response);
            }
            catch (Exception ex ){
            System.out.println(ex);
            }
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
