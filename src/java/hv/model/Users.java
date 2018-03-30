/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hv.model;

/**
 *
 * @author HoaiVu
 */
public class Users {
    private String user;
    private String pass;
    private String last;
    private String role;
    private String email;
    private String addres;
    private String phone;
    
    
    public Users(){}
    
    public Users(String last ) {
        this.user = null;
        this.pass = null;
        this.last = last;        
    }
    
    public Users(String user, String pass) {
        this.user = user;
        this.pass = pass;
        this.role = null;
        this.email = null;
    }

    public Users(String user, String pass, String last, String role, String email, String addres, String phone) {
        this.user = user;
        this.pass = pass;
        this.last = last;
        this.role = role;
        this.email = email;
        this.addres = addres;
        this.phone = phone;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public String getLast() {
        return last;
    }

    public void setLast(String last) {
        this.last = last;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddres() {
        return addres;
    }

    public void setAddres(String addres) {
        this.addres = addres;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    
    
}
