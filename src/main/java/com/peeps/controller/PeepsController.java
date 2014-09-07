package com.peeps.controller;

import com.peeps.model.Peeps;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

/**
 * Created by danbaker on 9/3/14.
 */
@Controller
public class PeepsController {
    @Resource
    Peeps peeps;

    @RequestMapping("/addPeep")
    public String newEntry() {
        return "addPeep";
    }

    @RequestMapping("/viewAndEdit")
    public String viewAndEditPeep(Model model) {
        SessionFactory sessionFactory = new AnnotationConfiguration().configure().buildSessionFactory();
        Session session = sessionFactory.openSession();
        session.beginTransaction();

        Query query = session.createQuery("from Peeps");
        List peeps = query.list();
        session.close();

        model.addAttribute("peeps",peeps);

        return "viewUpdatePeeps";
    }

    @RequestMapping(value = "/createPeep", method = RequestMethod.POST)
    public String createPeep(@RequestParam(value = "firstName")String firstName,
                             @RequestParam(value = "lastName")String lastName,
                             @RequestParam(value = "address1")String address1,
                             @RequestParam(value = "address2")String address2,
                             @RequestParam(value = "city")String city,
                             @RequestParam(value = "state")String state,
                             @RequestParam(value = "zip")String zip,
                             @RequestParam(value = "phone")String phone,
                             @RequestParam(value = "startDate")String startDate,
                             Model model) {
        boolean isSuccess = true;
//        SimpleDateFormat format = new SimpleDateFormat()

        peeps.setFirstName(firstName);
        peeps.setLastName(lastName);
        peeps.setAddress1(address1);
        peeps.setAddress2(address2);
        peeps.setCity(city);
        peeps.setState(state);
        peeps.setZip(zip);
        peeps.setPhone(phone);
//        peeps.setStartDate(new Date(startDate));

        // TODO: This all needs to be in a Try/catch/finally block
        SessionFactory sessionFactory = new AnnotationConfiguration().configure().buildSessionFactory();
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        session.save(peeps);
        session.getTransaction().commit();
        session.close();

        model.addAttribute("isSuccess", isSuccess);
        return "addPeep";
    }
}
