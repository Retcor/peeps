package com.peeps.controller;

import com.peeps.service.PeepService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import java.util.Date;

/**
 * Created by danbaker on 9/3/14.
 */
@Controller
public class PeepsController {
    @Resource
    PeepService peepService;

    @RequestMapping("/addPeep")
    public String newEntry() {
        return "addPeep";
    }

    @RequestMapping("/viewAndEdit")
    public String viewAndEditPeep(Model model) {

        model.addAttribute("peeps",peepService.getPeeps());

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
                             @RequestParam(value = "startDate")Date startDate,
                             Model model) {

        model.addAttribute("isSuccess", peepService.createPeep(firstName,lastName,address1,address2,
                city,state,zip,phone,startDate));
        return "addPeep";
    }

    @RequestMapping(value = "/editPeep", method = RequestMethod.POST)
    public String editPeep(@RequestParam(value = "employeeId")int employeeId,
                           @RequestParam(value = "firstName")String firstName,
                           @RequestParam(value = "lastName")String lastName,
                           @RequestParam(value = "address1")String address1,
                           @RequestParam(value = "address2")String address2,
                           @RequestParam(value = "city")String city,
                           @RequestParam(value = "state")String state,
                           @RequestParam(value = "zip")String zip,
                           @RequestParam(value = "phone")String phone) {

        peepService.editPeep(firstName,lastName,address1,address2,city,state,zip,phone,employeeId);

        return "redirect:/viewAndEdit";
    }
}
