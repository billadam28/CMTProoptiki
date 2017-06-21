/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CMTJavaClasses;

/**
 *
 * @author billadam
 */
public class MonitoringUtility2 {
    private String firstName;
    private String surName;
    private float unitCost;
    private double allocatedDays;
    private double sumCost;
    private double allocatedPersonMonths;
    
    public void setFirstname (String s) {
        this.firstName = s;
    }
    public void setSurname (String s) {
        this.surName = s;
    }
    public void setUnitCost (float c) {
        this.unitCost = c;
    }
    public void setAllocatedDays (double a) {
        this.allocatedDays = a;
    }
    public void setSumCost() {
        this.sumCost = this.allocatedDays * this.unitCost;
    }
    public void setAllocatedPersonMonths() {
        this.allocatedPersonMonths = this.allocatedDays / 18.3;
    }
    public String getFirstname() {
        return this.firstName;
    }
    public String getSurname() {
        return this.surName;
    }
    public float getUnitcost() {
        return this.unitCost;
    }
    public double getAllocatedDays() {
        return this.allocatedDays;
    }
    public double getSumCost() {
        return this.sumCost;
    }
    public double getAllocatedPersonMonths() {
        return this.allocatedPersonMonths;
    }
}
