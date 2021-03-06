/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_mvc_project_final.entities;

import com.mycompany.spring_mvc_project_final.enums.Gender;
import jakarta.validation.constraints.NotBlank;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.MappedSuperclass;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import javax.validation.constraints.Size;
import org.springframework.format.annotation.DateTimeFormat;

/**
 *
 * @author PC
 */
@MappedSuperclass
public class Personal {

    @Column(name = "full_name", length = 100)
    @NotBlank(message="This field is min 3 and max 100")
    @Size(min = 3, max = 100)
    private String fullName;
    
    @Column(unique = true, length = 100)
    private String email;
    
    @Column(name = "birth_date")
     @DateTimeFormat(pattern = "yyyy-MM-dd")
     @Temporal(TemporalType.DATE)
     private Date birthDate;
    
    @Column(name ="phone_number")
    private String phoneNumber;
    
    @Enumerated(EnumType.STRING)
    private Gender gender = Gender.MALE;
    
    
    @Column(name ="address")
     private String address;

    public Personal() {
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Date getBirthDate() {
        return birthDate;
    }

    public void setBirthDate(Date birthDate) {
        this.birthDate = birthDate;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public Gender getGender() {
        return gender;
    }

    public void setGender(Gender gender) {
        this.gender = gender;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }


    
    
}
