/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_mvc_project_final.entities;

import com.mycompany.spring_mvc_project_final.enums.CreditCardStatus;
import java.io.Serializable;
import java.util.Date;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.springframework.format.annotation.DateTimeFormat;

/**
 *
 * @author PC
 */
@Entity
@Table(name="creditcard")
public class CreditCardEntity implements Serializable {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int Id;
    
    @Column(length = 50)
    private String name;
    
    @Temporal(TemporalType.DATE)
    @Column(name = "expDate")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date expDate;
    
    @Column(length = 3)
    private String cvcCode;
    
    @Column(name = "balance")
    private double balance;
    
    @Column(nullable = false)
    @Enumerated(EnumType.STRING)
    private CreditCardStatus status;
    
    

    public CreditCardEntity() {
    }

    public int getId() {
        return Id;
    }

    public void setId(int Id) {
        this.Id = Id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getExpDate() {
        return expDate;
    }

    public void setExpDate(Date expDate) {
        this.expDate = expDate;
    }

    public String getCvcCode() {
        return cvcCode;
    }

    public void setCvcCode(String cvcCode) {
        this.cvcCode = cvcCode;
    }

    public double getBalance() {
        return balance;
    }

    public void setBalance(double balance) {
        this.balance = balance;
    }

    public CreditCardStatus getStatus() {
        return status;
    }

    public void setStatus(CreditCardStatus status) {
        this.status = status;
    }
    
//    @OneToMany(mappedBy = "creditcard", fetch = FetchType.LAZY,
//            cascade = CascadeType.ALL)
//    private Set<PaymentEntity> payment;
//
//    public Set<PaymentEntity> getPayment() {
//        return payment;
//    }
//
//    public void setPayment(Set<PaymentEntity> payment) {
//        this.payment = payment;
//    }


    
    
    
    
   
    
    
    
}
