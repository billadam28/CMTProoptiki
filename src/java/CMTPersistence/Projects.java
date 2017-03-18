package CMTPersistence;
// Generated Mar 18, 2017 6:00:56 PM by Hibernate Tools 4.3.1


import java.util.Date;

/**
 * Projects generated by hbm2java
 */
public class Projects  implements java.io.Serializable {


     private Integer id;
     private String projectName;
     private String acronyme;
     private int contractNumber;
     private Date startDate;
     private Date endDate;
     private Float budget;
     private Float totalProjectGrant;
     private Float cmtBudget;
     private Float totalCmtGrant;
     private String paymentsScheme;
     private Float firstPayment;
     private Float secondPayment;
     private Float thirdPayment;
     private Float fourthPayment;
     private String comments;

    public Projects() {
    }

	
    public Projects(String projectName, String acronyme, int contractNumber) {
        this.projectName = projectName;
        this.acronyme = acronyme;
        this.contractNumber = contractNumber;
    }
    public Projects(String projectName, String acronyme, int contractNumber, Date startDate, Date endDate, Float budget, Float totalProjectGrant, Float cmtBudget, Float totalCmtGrant, String paymentsScheme, Float firstPayment, Float secondPayment, Float thirdPayment, Float fourthPayment, String comments) {
       this.projectName = projectName;
       this.acronyme = acronyme;
       this.contractNumber = contractNumber;
       this.startDate = startDate;
       this.endDate = endDate;
       this.budget = budget;
       this.totalProjectGrant = totalProjectGrant;
       this.cmtBudget = cmtBudget;
       this.totalCmtGrant = totalCmtGrant;
       this.paymentsScheme = paymentsScheme;
       this.firstPayment = firstPayment;
       this.secondPayment = secondPayment;
       this.thirdPayment = thirdPayment;
       this.fourthPayment = fourthPayment;
       this.comments = comments;
    }
   
    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
    public String getProjectName() {
        return this.projectName;
    }
    
    public void setProjectName(String projectName) {
        this.projectName = projectName;
    }
    public String getAcronyme() {
        return this.acronyme;
    }
    
    public void setAcronyme(String acronyme) {
        this.acronyme = acronyme;
    }
    public int getContractNumber() {
        return this.contractNumber;
    }
    
    public void setContractNumber(int contractNumber) {
        this.contractNumber = contractNumber;
    }
    public Date getStartDate() {
        return this.startDate;
    }
    
    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }
    public Date getEndDate() {
        return this.endDate;
    }
    
    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }
    public Float getBudget() {
        return this.budget;
    }
    
    public void setBudget(Float budget) {
        this.budget = budget;
    }
    public Float getTotalProjectGrant() {
        return this.totalProjectGrant;
    }
    
    public void setTotalProjectGrant(Float totalProjectGrant) {
        this.totalProjectGrant = totalProjectGrant;
    }
    public Float getCmtBudget() {
        return this.cmtBudget;
    }
    
    public void setCmtBudget(Float cmtBudget) {
        this.cmtBudget = cmtBudget;
    }
    public Float getTotalCmtGrant() {
        return this.totalCmtGrant;
    }
    
    public void setTotalCmtGrant(Float totalCmtGrant) {
        this.totalCmtGrant = totalCmtGrant;
    }
    public String getPaymentsScheme() {
        return this.paymentsScheme;
    }
    
    public void setPaymentsScheme(String paymentsScheme) {
        this.paymentsScheme = paymentsScheme;
    }
    public Float getFirstPayment() {
        return this.firstPayment;
    }
    
    public void setFirstPayment(Float firstPayment) {
        this.firstPayment = firstPayment;
    }
    public Float getSecondPayment() {
        return this.secondPayment;
    }
    
    public void setSecondPayment(Float secondPayment) {
        this.secondPayment = secondPayment;
    }
    public Float getThirdPayment() {
        return this.thirdPayment;
    }
    
    public void setThirdPayment(Float thirdPayment) {
        this.thirdPayment = thirdPayment;
    }
    public Float getFourthPayment() {
        return this.fourthPayment;
    }
    
    public void setFourthPayment(Float fourthPayment) {
        this.fourthPayment = fourthPayment;
    }
    public String getComments() {
        return this.comments;
    }
    
    public void setComments(String comments) {
        this.comments = comments;
    }




}


