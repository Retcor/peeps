package com.peeps.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * Created by danbaker on 9/3/14.
 */
@Controller
public class PeepsController {
    @RequestMapping("/addPeep")
    public String newEntry() {
        return "addPeep";
    }

    @RequestMapping("/viewAndEdit")
    public String viewAndEditPeep() {
        return "viewUpdatePeeps";
    }

    @RequestMapping(value = "/createPeep", method = RequestMethod.POST)
    public String createPeep(@RequestParam(value = "firstName")String firstName, Model model) {
        if (!"".equalsIgnoreCase(firstName)) {
            model.addAttribute("firstName", firstName);
        }
        return "addPeep";
    }
}
