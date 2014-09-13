package com.peeps.service;

import com.peeps.model.Peeps;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Created by danbaker on 9/8/14.
 */
@Service
public class PeepService {
    @Resource
    Peeps peeps;

    public List getPeeps() {
        SessionFactory sessionFactory = new AnnotationConfiguration().configure().buildSessionFactory();
        Session session = sessionFactory.openSession();
        session.beginTransaction();

        Query query = session.createQuery("from Peeps");
        List peeps = query.list();
        session.close();

        return peeps;
    }

    public boolean createPeep(String firstName,String lastName,String address1,String address2,String city,
                              String state,String zip,String phone,String startDate) {
        boolean isSuccess = true;
        try {
            Date parsedStartDate = new SimpleDateFormat("MM/dd/yyyy").parse(startDate);
            peeps.setFirstName(firstName);
            peeps.setLastName(lastName);
            peeps.setAddress1(address1);
            peeps.setAddress2(address2);
            peeps.setCity(city);
            peeps.setState(state);
            peeps.setZip(zip);
            peeps.setPhone(phone);
            peeps.setStartDate(parsedStartDate);
        } catch (ParseException e) {
            e.printStackTrace();
        }

        try {
            SessionFactory sessionFactory = new AnnotationConfiguration().configure().buildSessionFactory();
            Session session = sessionFactory.openSession();
            session.beginTransaction();
            session.save(peeps);
            session.getTransaction().commit();
            session.close();
        } catch (Exception e) {
            e.printStackTrace();
            isSuccess = false;
        }

        return isSuccess;
    }

    public void editPeep(String firstName,String lastName,String address1,String address2,String city,
                         String state,String zip,String phone,int employeeId) {
        boolean editRecieved = false;
        if (!"".equalsIgnoreCase(firstName)) {
            peeps.setFirstName(firstName);
            editRecieved = true;
        }
        if (!"".equalsIgnoreCase(lastName)) {
            peeps.setLastName(lastName);
            editRecieved = true;
        }
        if (!"".equalsIgnoreCase(address1)) {
            peeps.setAddress1(address1);
            editRecieved = true;
        }
        if (!"".equalsIgnoreCase(address2)) {
            peeps.setAddress2(address2);
            editRecieved = true;
        }
        if (!"".equalsIgnoreCase(city)) {
            peeps.setCity(city);
            editRecieved = true;
        }
        if (!"".equalsIgnoreCase(state)) {
            peeps.setState(state);
            editRecieved = true;
        }
        if (!"".equalsIgnoreCase(zip)) {
            peeps.setZip(zip);
            editRecieved = true;
        }
        if (!"".equalsIgnoreCase(phone)) {
            peeps.setPhone(phone);
            editRecieved = true;
        }

        if (editRecieved) {
            peeps.setEmployeeId(employeeId);
            SessionFactory sessionFactory = new AnnotationConfiguration().configure().buildSessionFactory();
            Session session = sessionFactory.openSession();
            session.beginTransaction();
            session.update(peeps);
            session.getTransaction().commit();
            session.close();
        }
    }
}
