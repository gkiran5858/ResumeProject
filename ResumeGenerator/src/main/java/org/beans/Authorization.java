/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.beans;

/**
 *
 * @author RS-Kiran
 */
public class Authorization {
   
    private String status;
    private String country;
    private String issuedBy;
    public enum VisaTypes {

        H1, H4, L1, L2, GC, CT
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getIssuedBy() {
        return issuedBy;
    }

    public void setIssuedBy(String issuedBy) {
        this.issuedBy = issuedBy;
    }
    
    @Override
    public String toString() {
        return "Authorization{" + "status=" + status + ", country=" + country + ", issuedBy=" + issuedBy + '}';
    }

    public Authorization(String status, String country, String issuedBy) {
        this.status = status;
        this.country = country;
        this.issuedBy = issuedBy;
    }
    
    public Authorization(){
        
    }
    
    
    
    
}
