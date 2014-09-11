package com.peeps.model;

import lombok.Data;
import org.hibernate.annotations.GenericGenerator;
import org.springframework.stereotype.Repository;
import org.springframework.validation.annotation.Validated;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by danbaker on 9/5/14.
 *
 * @Data - Auto generates getters and setters
 * @Entity - This will ensure Hibernate will pick up this class and create a table in the
 *      Database if needed
 * @Repository - Allows Spring to recognize this class to allow for dependency injection
 * @Table - Tells Hibernate what table to look at / create
 */
@Data
@Entity
@Repository
@Table(name = "PEEPS")
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

    @Column(name = "START_DATE")
    private Date startDate;
}
