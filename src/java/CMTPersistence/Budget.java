package CMTPersistence;
// Generated Apr 29, 2017 4:03:27 PM by Hibernate Tools 4.3.1



/**
 * Budget generated by hbm2java
 */
public class Budget  implements java.io.Serializable {


     private Integer id;
     private Projects project;
     private String category;
     private Float dialyCost;
     private Float monthlyCost;
     private Integer estimatedPersonDays;
     private Float estimatedPersonMonths;

    public Budget() {
    }

	
    public Budget(Projects project, String category) {
        this.project = project;
        this.category = category;
    }
    public Budget(Projects project, String category, Float dialyCost, Float monthlyCost, Integer estimatedPersonDays, Float estimatedPersonMonths) {
       this.project = project;
       this.category = category;
       this.dialyCost = dialyCost;
       this.monthlyCost = monthlyCost;
       this.estimatedPersonDays = estimatedPersonDays;
       this.estimatedPersonMonths = estimatedPersonMonths;
    }
   
    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
    public Projects getProject() {
        return this.project;
    }
    
    public void setProject(Projects project) {
        this.project = project;
    }
    public String getCategory() {
        return this.category;
    }
    
    public void setCategory(String category) {
        this.category = category;
    }
    public Float getDialyCost() {
        return this.dialyCost;
    }
    
    public void setDialyCost(Float dialyCost) {
        this.dialyCost = dialyCost;
    }
    public Float getMonthlyCost() {
        return this.monthlyCost;
    }
    
    public void setMonthlyCost(Float monthlyCost) {
        this.monthlyCost = monthlyCost;
    }
    public Integer getEstimatedPersonDays() {
        return this.estimatedPersonDays;
    }
    
    public void setEstimatedPersonDays(Integer estimatedPersonDays) {
        this.estimatedPersonDays = estimatedPersonDays;
    }
    public Float getEstimatedPersonMonths() {
        return this.estimatedPersonMonths;
    }
    
    public void setEstimatedPersonMonths(Float estimatedPersonMonths) {
        this.estimatedPersonMonths = estimatedPersonMonths;
    }




}


