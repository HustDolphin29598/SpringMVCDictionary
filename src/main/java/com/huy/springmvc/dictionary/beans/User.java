package com.huy.springmvc.dictionary.beans;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotBlank;


@Entity(name = "users")
public class User {
    private int id;
    private boolean isAdmin;
    private String username;
    private String password;

    public User() {
        
    }
    
    
    public User(int id, Boolean isAdmin, String userName, String password) {
        super();
        this.id = id;
        this.isAdmin = isAdmin;
        this.username = userName;
        this.password = password;
    }


    public User(Boolean isAdmin, String userName, String password) {
        super();
        this.isAdmin = isAdmin;
        this.username = userName;
        this.password = password;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "isAdmin")
    public boolean isAdmin() {
        return isAdmin;
    }

    public void setAdmin(boolean isAdmin) {
        this.isAdmin = isAdmin;
    }
    
    @Basic
    @NotBlank
    @NotNull
    @Size(min = 4, max = 30)
    @Column(name = "username", nullable = false, length = 30, unique = true)
    public String getUsername() {
        return username;
    }

    public void setUsername(String userName) {
        this.username = userName;
    }

    @Basic
    @NotBlank
    @NotNull
    @Size(min = 6, max = 30)
    @Column(name = "password", nullable = false, length = 30)
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

}
