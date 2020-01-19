package com.nmh.crud.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PageController {

    @RequestMapping("/employeeList")
    public String EmployeeList() {
        return "EmployeeList";
    }

}
