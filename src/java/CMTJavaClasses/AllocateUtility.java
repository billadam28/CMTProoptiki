/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CMTJavaClasses;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Thodoris
 */
public class AllocateUtility {
    
    private int employeeid;
    private String firstname;
    private String surname;
    private List<Double> days;
    private List<Double> hours;
    private List<Double> cost;
    private float unitcost;
    
    public AllocateUtility () {
    
        days = new ArrayList<>();
        hours = new ArrayList<>();
        cost = new ArrayList<>();
        
    }
    
    public Integer getId() {
        return this.employeeid;
    }
    
    public void setId(Integer id) {
        this.employeeid = id;
    }
    public String getFirstname() {
        return this.firstname;
    }
    
    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }
    public String getSurname() {
        return this.surname;
    }
    
    public void setSurname(String surname) {
        this.surname = surname;
    }
    
    public float getUnitcost() {
        return this.unitcost;
    }
    
    public void setUnitcost(float unitcost) {
        this.unitcost = unitcost;
    }
    
    public List<Double> getAllocateUtilityList () {
        return this.days;
    }    
        
    public List<Double> getAllocateHoursList () {
        return this.hours;    
    }
    
    public List<Double> getAllocateCostList () {
        return this.cost;    
    }
    
   
    
    
}
