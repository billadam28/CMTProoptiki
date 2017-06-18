package CMTServlets;

import CMTJavaClasses.EmployeesProcessor;
import CMTJavaClasses.ProjectBudgetProcessor;
import CMTJavaClasses.ProjectProcessor;
import CMTJavaClasses.ViewEmployeesProcessor;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author arismrk
 */
public class DeleteBudget extends HttpServlet {

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
        }
        else 
        {

            ProjectBudgetProcessor budgetProcessor = new ProjectBudgetProcessor();

            if (request.getParameterNames().hasMoreElements()) {

            String bId = request.getParameter("bId");
            int id = Integer.parseInt(bId);
            String ProjectId=request.getParameter("pId");
            int pId= Integer.parseInt(ProjectId);
            if(id != 0)
            {
                budgetProcessor.deleteBudget(id);
            }   
                request.setAttribute("revealSuccesMsg", "true");
                request.setAttribute("SuccesMsg", "Budget Deleted successfully !");
                request.setAttribute("FailedMsg", "Problem Occure While deleting budget");
                ProjectBudgetProcessor budgetProc = new ProjectBudgetProcessor();
                budgetProc.getBudgetEntries(pId);
                request.setAttribute("projectBudgetProcessor", budgetProc);
                ProjectProcessor projectProcessor = new ProjectProcessor();
                projectProcessor.getProjectDetails(pId);
                
                request.setAttribute("projectId", pId);
                request.setAttribute("projectName", projectProcessor.getProject().getProjectName());
            }

            this.getServletConfig().getServletContext().getRequestDispatcher("/pages/project_budget.jsp").forward(request, response);

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
