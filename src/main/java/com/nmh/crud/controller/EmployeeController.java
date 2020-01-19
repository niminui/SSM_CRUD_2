package com.nmh.crud.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.nmh.crud.bean.Employee;
import com.nmh.crud.bean.Msg;
import com.nmh.crud.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class EmployeeController {

    @Autowired
    EmployeeService employeeService;

    //删除员工(单个 + 批量)
    @ResponseBody
    @RequestMapping(value = "/deleteEmp/{id}",method = RequestMethod.DELETE)
    public Msg deleteEmp(@PathVariable("id") String ids) {
        if(ids.contains("-")) {
            List<Integer> del_ids = new ArrayList<>();
            String[] str_ids = ids.split("-");
            for(String id : str_ids) {
                del_ids.add(Integer.parseInt(id));
                employeeService.deleteBatchEmp(del_ids);
            }
        } else {
            employeeService.deleteOneEmp(Integer.parseInt(ids));
        }
        return Msg.success();
    }

    //更新员工
    //hiddenHttpMethodFilter--REST风格的URI
    //httpPutFormContentFilter--将PUT转换为POST，否则tomcat不会将数据封装进request.getParameter中的map
    @ResponseBody
    @RequestMapping(value = "/updateEmployee/{empId}", method = RequestMethod.PUT)
    public Msg updateEmployee(Employee employee) {
        employeeService.updateEmployee(employee);
        return Msg.success();
    }

    //根据id查询员工
    @ResponseBody
    @RequestMapping(value = "/emp/{id}",method = RequestMethod.GET)
    public Msg getEmp(@PathVariable("id") Integer id) {
        Employee employee = employeeService.getEmp(id);
        return Msg.success().add("emp",employee);
    }

    //新增 -- 保存员工信息
    @RequestMapping(value = "/saveEmployee", method = RequestMethod.POST)
    @ResponseBody
    public Msg saveEmployee(@Valid Employee employee, BindingResult result) {
        if(result.hasErrors()) {
            //校验失败，返回失败信息，在模态框中显示校验失败的错误信息
            Map<String,Object> map = new HashMap<>();
            List<FieldError> errors = result.getFieldErrors();
            for(FieldError fieldError : errors) {
                map.put(fieldError.getField(),fieldError.getDefaultMessage());
            }
            return Msg.fail().add("errorFields",map);
        } else {
            employeeService.saveEmployees(employee);
            return Msg.success();
        }
    }

    //检查用户名是否重复
    @RequestMapping(value = "/checkUser")
    @ResponseBody
    public Msg checkUser(@RequestParam("empName") String empName) {
        String regx = "(^[a-zA-Z0-9_-]{6,16}$)|(^[\\u2E80-\\u9FFF]{2,5})";
        if(!empName.matches(regx)) {
            return Msg.fail().add("va_msg","用户名必须是6-16位英文和数组的组合，或者2-5位中文");
        }
        boolean b = employeeService.checkUser(empName);
        if(b) {
            return Msg.success();
        } else {
            return Msg.fail().add("va_msg","用户名已存在");
        }
    }

    //查询所有员工并返回第一页的记录(每页5条记录，连续显示5页)
    @RequestMapping("/employees")
    @ResponseBody
    public Msg getEmployeesWithJson(@RequestParam(value = "pn",defaultValue = "1") Integer pn) {
        PageHelper.startPage(pn,5);
        List<Employee> list = employeeService.getAll();
        PageInfo<Employee> page = new PageInfo<>(list,5);
        return Msg.success().add("pageInfo",page);
    }

    //用于测试
    //@RequestMapping("/employees")
    public String getEmployees(@RequestParam(value = "pn",defaultValue = "1") Integer pn,
                               Model model) {
        //这不是一个分页查询
        //引入PageHelper分页插件
        //在查询之前只需要调用startPage方法，插入页码以及每页显示数量
        PageHelper.startPage(pn,5);
        //startPage后面紧跟的这个查询就是一个分页查询
        List<Employee> lists = employeeService.getAll();

        //使用pageInfo包装查询后的结果，只需要将pageInfo交给页面就行了
        //封装了详细的分页信息，包括有我们查询出来的数据，可以传入连续显示的页数(5)
        PageInfo<Employee> page = new PageInfo(lists,5);
        model.addAttribute("pageInfo",page);

        return "list";
    }
}
