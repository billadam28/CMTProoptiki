/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CMTServlets;

import CMTJavaClasses.PlanningProcessor;
import CMTJavaClasses.ProjectProcessor;
import CMTPersistence.Projects;
import CMTPersistence.Employees;
import CMTPersistence.Users;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.util.Enumeration;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Thodoris
 */
public class UpdatePlanningSrvlt extends HttpServlet {

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
            throws ServletException, IOException, ParseException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession(false);
        
        if ((session == null) || (session.getAttribute("userId") == null)) {
            this.getServletConfig().getServletContext().getRequestDispatcher("/index.jsp?noSession=1").forward(request, response);
        } else {
            
            String pId = request.getParameter("pId");
            int projectId = Integer.parseInt(pId);
            //String eId = request.getParameter("eId");
            //int employeeId = Integer.parseInt(eId);
           // System.out.println("Project id = "+projectId);
            //System.out.println("Employee id = "+employeeId);
            PlanningProcessor projectPlan = new PlanningProcessor();
            projectPlan.calculateProjectDuration(projectId); 
            projectPlan.populateEmployeesList();
            request.setAttribute("projectPlan", projectPlan);
            ProjectProcessor projectProcessor = new ProjectProcessor();
            projectProcessor.getProjectDetails(projectId);
            request.setAttribute("projectId", projectId);
            request.setAttribute("projectName", projectProcessor.getProject().getProjectName());
            
            Enumeration paramNames = request.getParameterNames();
            while(paramNames.hasMoreElements()) {
                String paramName = (String)paramNames.nextElement();
                if (paramName.equals("pId")) {
                    continue;
                }
                String[] paramValues = request.getParameterValues(paramName);
                System.out.println("Employee = " + paramName);
                //ystem.out.println("Months= " + paramValues);
                projectPlan.allocateDays(projectId, 1, paramValues);
            }
            
            this.getServletConfig().getServletContext().getRequestDispatcher("/pages/project_planning.jsp").forward(request, response);
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
            Logger.getLogger(UpdatePlanningSrvlt.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(UpdatePlanningSrvlt.class.getName()).log(Level.SEVERE, null, ex);
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
