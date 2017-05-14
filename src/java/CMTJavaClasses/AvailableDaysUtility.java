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
public class AvailableDaysUtility {
    
    private int employeeid;
    private String firstname;
    private String surname;
    private List<Integer> availDays;
    
    public AvailableDaysUtility () {
    
        availDays = new ArrayList<>();
    
    }
    
    public Integer getId() {
        return this.employeeid;
    }
    
    public void setId(Integer id) {
        this.employeeid = employeeid;
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
    
    public List<Integer> getAvailableDaysList () {
        return this.availDays;
    }
    
}
