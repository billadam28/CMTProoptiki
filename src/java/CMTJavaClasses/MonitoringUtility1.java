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
public class MonitoringUtility1 {
    private String firstName;
    private String surName;
    private String position;
    
    public MonitoringUtility1() {}
    
    public void setFirstname (String s) {
        this.firstName = s;
    }
    public void setSurname (String s) {
        this.surName = s;
    }
    public void setPosition (String s) {
        this.position = s;
    }
    public String getFirstname() {
        return this.firstName;
    }
    public String getSurname() {
        return this.surName;
    }
    public String getPosition() {
        return this.position;
    }
}
