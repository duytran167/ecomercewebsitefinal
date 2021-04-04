/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_mvc_project_final.entities;

import com.mycompany.spring_mvc_project_final.enums.CreditCardStatus;
import java.io.Serializable;
import java.time.LocalDate;
import java.util.Date;
import java.util.List;
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
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
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
    @Column(name = "CreditCardID")
    private int id;

    @Column(name = "CreditCardType")
    private String creditCardType;

    @Column(name = "CreditCardNumber")
    private String creditCardNumber;

    @Column(name = "CardholdersName")
    private String cardholdersName;

    @Column(name = "ExpirationDate")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate expirationDate;

    @Column(name = "Surplus")
    private Double surplus;

    @Column(name = "CVV")
    private String cvv;

    @OneToOne()
    @PrimaryKeyJoinColumn
    private UserEntity users;//(1) 

    //Setup relationshipss with Payment
    @OneToMany(mappedBy = "creditCard", fetch = FetchType.LAZY)
    List<OrderEntity> OrderList;

    public CreditCardEntity() {
    }
    
    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCreditCardType() {
        return creditCardType;
    }

    public void setCreditCardType(String creditCardType) {
        this.creditCardType = creditCardType;
    }

    public String getCreditCardNumber() {
        return creditCardNumber;
    }

    public void setCreditCardNumber(String creditCardNumber) {
        this.creditCardNumber = creditCardNumber;
    }

    public String getCardholdersName() {
        return cardholdersName;
    }

    public void setCardholdersName(String cardholdersName) {
        this.cardholdersName = cardholdersName;
    }

    public LocalDate getExpirationDate() {
        return expirationDate;
    }

    public void setExpirationDate(LocalDate expirationDate) {
        this.expirationDate = expirationDate;
    }

    public Double getSurplus() {
        return surplus;
    }

    public void setSurplus(Double surplus) {
        this.surplus = surplus;
    }

    public String getCvv() {
        return cvv;
    }

    public void setCvv(String cvv) {
        this.cvv = cvv;
    }

    public UserEntity getUsers() {
        return users;
    }

    public void setUsers(UserEntity users) {
        this.users = users;
    }

    

    public List<OrderEntity> getOrderList() {
        return OrderList;
    }

    public void setOrderList(List<OrderEntity> OrderList) {
        this.OrderList = OrderList;
    }
 
}
