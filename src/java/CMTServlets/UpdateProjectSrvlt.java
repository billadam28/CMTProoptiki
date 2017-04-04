/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CMTServlets;

import CMTJavaClasses.ProjectProcessor;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.text.ParseException;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Thodoris
 */
public class UpdateProjectSrvlt extends HttpServlet {

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
                ProjectProcessor projectProcessor = new ProjectProcessor();
                String pId = request.getParameter("pId");
                int id = Integer.parseInt(pId);
                System.out.println("Project id:" + id);
  
                String pName = request.getParameter("pName");
                String pAcr = request.getParameter("pAcr");
                String pConNum = request.getParameter("pConNum");
                int connum = Integer.parseInt(pConNum);
                SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
                Date pSDate = format.parse(request.getParameter("pSDate"));
                Date pEDate = format.parse(request.getParameter("pEDate"));
         
                String pBud = request.getParameter("pBud");
                float bud = Float.parseFloat(pBud);
                String pTGrant = request.getParameter("pTGrant");
                float tgrant = Float.parseFloat(pTGrant);
                String pCMTBud = request.getParameter("pCMTBud");
                float cmtbud = Float.parseFloat(pCMTBud);
                String pTCMTGrant = request.getParameter("pTCMTGrant");
                float tcmtgrant = Float.parseFloat(pTCMTGrant);
                String pPaySch = request.getParameter("pPaySch");
                String pFirstPay = request.getParameter("pFirstPay");
                float firstpay = Float.parseFloat(pFirstPay);
                String pSecPay = request.getParameter("pSecPay");
                float secpay = Float.parseFloat(pSecPay);
                String pThirdPay = request.getParameter("pThirdPay");
                float thirdpay = Float.parseFloat(pThirdPay);
                String pFourthPay = request.getParameter("pFourthPay");
                float fourthpay = Float.parseFloat(pFourthPay);
                String pComments = request.getParameter("pComments");
                projectProcessor.updateProject(id,pName,pAcr,pSDate,pEDate,connum,bud,tgrant,cmtbud,tcmtgrant,pPaySch,firstpay,secpay,thirdpay,fourthpay,pComments);
                //request.setAttribute("projectId", id);
                
                request.setAttribute("revealSuccesMsg", "true");
                //request.setAttribute("projectProcessor", projectProcessor);
                this.getServletConfig().getServletContext().getRequestDispatcher("/pages/editproject.jsp").forward(request, response);
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
