/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CMTServlets;

import CMTJavaClasses.ProjectProcessor;
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
import org.hibernate.HibernateException;

/**
 *
 * @author adamopoulo
 */
public class InsertNewProject extends HttpServlet {

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
        } else {
            ProjectProcessor projectProc = new ProjectProcessor();
            
            if (request.getParameterNames().hasMoreElements()) {
                SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
                
                projectProc.getProject().setProjectName(request.getParameter("pName"));
                projectProc.getProject().setAcronyme(request.getParameter("pAcr"));
                
                if (!"".equals(request.getParameter("pConNum")))
                    projectProc.getProject().setContractNumber(Integer.parseInt(request.getParameter("pConNum")));
                
                if (!"".equals(request.getParameter("pSDate")))
                    projectProc.getProject().setStartDate(format.parse(request.getParameter("pSDate")));
                
                if (!"".equals(request.getParameter("pEDate")))
                    projectProc.getProject().setEndDate(format.parse(request.getParameter("pEDate")));
                
                if (!"".equals(request.getParameter("pBud")))
                    projectProc.getProject().setBudget(Float.parseFloat(request.getParameter("pBud")));
                
                if (!"".equals(request.getParameter("pCMTBud")))
                    projectProc.getProject().setCmtBudget(Float.parseFloat(request.getParameter("pCMTBud")));
                
                if (!"".equals(request.getParameter("pTCMTGrant")))
                    projectProc.getProject().setTotalCmtGrant(Float.parseFloat(request.getParameter("pTCMTGrant")));
                
                if (!"".equals(request.getParameter("pTGrant")))
                    projectProc.getProject().setTotalProjectGrant(Float.parseFloat(request.getParameter("pTGrant")));
                
                if (!"".equals(request.getParameter("pPaySch")))
                    projectProc.getProject().setPaymentsScheme(request.getParameter("pPaySch"));
                
                if (!"".equals(request.getParameter("pFirstPay")))
                    projectProc.getProject().setFirstPayment(Float.parseFloat(request.getParameter("pFirstPay")));
                
                if (!"".equals(request.getParameter("pSecPay")))
                    projectProc.getProject().setSecondPayment(Float.parseFloat(request.getParameter("pSecPay")));
                
                if (!"".equals(request.getParameter("pThirdPay")))
                    projectProc.getProject().setThirdPayment(Float.parseFloat(request.getParameter("pThirdPay")));              
                
                if (!"".equals(request.getParameter("pFourthPay")))
                    projectProc.getProject().setFourthPayment(Float.parseFloat(request.getParameter("pFourthPay")));
                
                if (!"".equals(request.getParameter("pComments")))
                    projectProc.getProject().setComments(request.getParameter("pComments"));
     
                try {
                    projectProc.insertProject();
                    request.setAttribute("revealSuccesMsg", "true");
                } catch (HibernateException e) {
                  request.setAttribute("revealSuccesMsg", "false"); 
                }
            }
            
            this.getServletConfig().getServletContext().getRequestDispatcher("/pages/create_project_form.jsp").forward(request, response);
            
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
