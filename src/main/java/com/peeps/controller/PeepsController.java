package com.peeps.controller;

import com.peeps.model.Peeps;
import org.joda.time.DateTime;
import org.joda.time.format.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import java.util.ArrayList;
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
        List<Peeps> customers = new ArrayList<>();

        peeps.setFirstName("Jonny");
        peeps.setLastName("Stromberg");
        customers.add(peeps);

        peeps = new Peeps();
        peeps.setFirstName("Jonas");
        peeps.setLastName("Arnklint");
        customers.add(peeps);

        peeps = new Peeps();
        peeps.setFirstName("Dan");
        peeps.setLastName("Baker");
        customers.add(peeps);

        peeps = new Peeps();
        peeps.setFirstName("Alicia");
        peeps.setLastName("Baker");
        customers.add(peeps);

        model.addAttribute("peeps", customers);

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
        peeps.setFirstName(firstName);
        peeps.setLastName(lastName);
        peeps.setAddress1(address1);
        peeps.setAddress2(address2);
        peeps.setCity(city);
        peeps.setState(state);
        peeps.setZip(zip);
        peeps.setPhone(phone);
        try {
            String format = "dd-MM-yyyy";
            peeps.setStartDate(DateTime.parse(startDate, DateTimeFormat.forPattern(format)));
        } catch (IllegalArgumentException e) {
            peeps.setStartDate(null);
            e.printStackTrace();
        }

        boolean isSuccess = peeps.savePeep();

        model.addAttribute("isSuccess", isSuccess);
        return "addPeep";
    }
}
