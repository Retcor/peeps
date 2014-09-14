package com.peeps.model;

import lombok.Data;
import org.hibernate.annotations.*;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Repository;

import javax.persistence.*;
import javax.persistence.Entity;
import javax.persistence.Table;
import java.util.Date;

/**
 * Created by danbaker on 9/5/14.
 *
 * @Data - Auto generates getters and setters
 * @Entity - This will ensure Hibernate will pick up this class and create a table in the
 *      Database if needed
 * @Repository - Allows Spring to recognize this class to allow for dependency injection
 * @Table - Tells Hibernate what table to look at / create
 * @org.hibernate.annotations.Entity - Setting dynamicUpdate to true will ensure that fields
 *      that haven't been set won't be updated
 */
@Data
@Entity
@Repository
@Table(name = "PEEPS")
@org.hibernate.annotations.Entity(dynamicUpdate = true)
public class Peeps {
    @Id
    @GenericGenerator(name = "peep_seq", strategy = "increment")
    @GeneratedValue(generator = "peep_seq")
    @Column(name = "EMPLOYEE_ID")
    private int employeeId;

    @Column(name = "FIRST_NAME")
    private String firstName;

    @Column(name = "LAST_NAME")
    private String lastName;

    @Column(name = "ADDRESS_1")
    private String address1;

    @Column(name = "ADDRESS_2")
    private String address2;

    @Column(name = "CITY")
    private String city;

    @Column(name = "STATE")
    private String state;

    @Column(name = "ZIP")
    private String zip;

    @Column(name = "PHONE")
    private String phone;

    @Column(name = "START_DATE",updatable = false)
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "MM/dd/yyyy")
    private Date startDate;
}
