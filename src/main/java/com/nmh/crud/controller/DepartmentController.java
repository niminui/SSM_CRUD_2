package com.nmh.crud.controller;

import com.nmh.crud.bean.Department;
import com.nmh.crud.bean.Msg;
import com.nmh.crud.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class DepartmentController {

    @Autowired
    DepartmentService departmentService;

    @RequestMapping("/departments")
    @ResponseBody
    public Msg getDepartments () {
        List<Department> list = departmentService.getDepartments();
        return Msg.success().add("departments",list);
    }
}
