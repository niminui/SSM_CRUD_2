package com.nmh.crud.controller;

import com.nmh.crud.bean.Manager;
import com.nmh.crud.bean.Msg;
import com.nmh.crud.service.ManagerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@Controller
public class ManagerController {

    @Autowired
    ManagerService managerService;

    @RequestMapping("/loginIn")
    @ResponseBody
    public Msg loginIn(@RequestParam("username") String username,
                       @RequestParam("password") String password,
                       HttpSession session) {
        boolean b = managerService.findUserByNameAndPassword(username,password);
        if(b) {
            Manager manager = new Manager();
            manager.setUsername(username);
            manager.setPassword(password);
            session.setAttribute("manager_session",manager);
            return Msg.success().add("lo_msg","success");
        }
        return Msg.fail().add("lo_msg","error");
    }

    @RequestMapping("/success.do")
    public String success() {
        return "EmployeeList";
    }

    @RequestMapping("/exit")
    public void exit(HttpSession session, HttpServletResponse response) throws IOException {
        session.removeAttribute("manager_session");
        response.sendRedirect("index.jsp");
    }

}
