package CMTServlets;

import CMTJavaClasses.EmployeesProcessor;
import CMTJavaClasses.ProjectBudgetProcessor;
import CMTJavaClasses.ProjectProcessor;
import CMTPersistence.Budget;
import CMTPersistence.Projects;
import java.io.IOException;
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
public class UpdateBudgetSrvlt extends HttpServlet {

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
        } else if ("1".equals(request.getSession().getAttribute("userId").toString().trim())) {

            try {
                ProjectBudgetProcessor budgetProcessor = new ProjectBudgetProcessor();

                int pid = 0;
                int bid = 0;
                String category = "";
                float dialyCost = 0, monthlyCost = 0, estimatedPersonMonths = 0;
                int estimatedPersonDays = 0;

                try {
                    String pId = request.getParameter("pId");
                    String bId = request.getParameter("bId");
                    pid = Integer.parseInt(pId);
                    bid = Integer.parseInt(bId);
                    category = request.getParameter("category") == null ? "" : request.getParameter("category");
                    if (request.getParameter("dialyCost") != null && request.getParameter("dialyCost") != "") {

                        dialyCost = Float.parseFloat(request.getParameter("dialyCost"));
                    }
                    if (request.getParameter("monthlyCost") != null && request.getParameter("monthlyCost") != "") {

                        monthlyCost = Float.parseFloat(request.getParameter("monthlyCost"));
                    }
                    if (request.getParameter("estimatedPersonMonths") != null && request.getParameter("estimatedPersonMonths") != "") {
                        estimatedPersonDays = Integer.parseInt(request.getParameter("estimatedPersonDays"));
                    }
                    if (request.getParameter("estimatedPersonMonths") != null && request.getParameter("estimatedPersonMonths") != "") {
                        estimatedPersonMonths = Float.parseFloat(request.getParameter("estimatedPersonMonths"));
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }

                Budget budget = new Budget();
                Projects project = new Projects();
                project.setId(pid);
                budget.setProject(project);
                budget.setCategory(category);
                budget.setDialyCost(dialyCost);
                budget.setMonthlyCost(monthlyCost);
                budget.setEstimatedPersonDays(estimatedPersonDays);
                budget.setEstimatedPersonMonths(estimatedPersonMonths);

                if (bid == 0) {
                    budgetProcessor.insertBudgets(budget);
                } else {
                    budget.setId(bid);
                    budgetProcessor.updateBudget(budget);
                }
                request.setAttribute("revealSuccesMsg", "true");
                request.setAttribute("SuccesMsg", "Budget Saved successfully !");
                request.setAttribute("FailedMsg", "Problem Occure While budget updating");
                ProjectBudgetProcessor budgetProc = new ProjectBudgetProcessor();
                budgetProc.getBudgetEntries(pid);
                request.setAttribute("projectBudgetProcessor", budgetProc);
                ProjectProcessor projectProcessor = new ProjectProcessor();
                projectProcessor.getProjectDetails(pid);

                request.setAttribute("projectId", pid);
                request.setAttribute("projectName", projectProcessor.getProject().getProjectName());
                this.getServletConfig().getServletContext().getRequestDispatcher("/pages/project_budget.jsp").forward(request, response);

            } catch (Exception ex) {
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
