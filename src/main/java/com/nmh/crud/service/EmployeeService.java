package com.nmh.crud.service;

import com.nmh.crud.bean.Employee;
import com.nmh.crud.bean.EmployeeExample;
import com.nmh.crud.dao.EmployeeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EmployeeService {

    @Autowired
    EmployeeMapper employeeMapper;

    //查询所有
    public List<Employee> getAll() {
        List<Employee> employees = employeeMapper.selectByExampleWithDept(null);
        return employees;
    }

    //员工保存
    public void saveEmployees(Employee employee) {
        employeeMapper.insertSelective(employee);
    }

    public boolean checkUser(String empName) {
        EmployeeExample example = new EmployeeExample();
        EmployeeExample.Criteria criteria = example.createCriteria();
        criteria.andEmpNameEqualTo(empName);
        long count = employeeMapper.countByExample(example);
        return count == 0;
    }

    public Employee getEmp(Integer id) {
        return employeeMapper.selectByPrimaryKeyWithDept(id);
    }

    public void updateEmployee(Employee employee) {
        employeeMapper.updateByPrimaryKeySelective(employee);
    }

    public void deleteOneEmp(int id) {
        employeeMapper.deleteByPrimaryKey(id);
    }

    public void deleteBatchEmp(List<Integer> list) {
        EmployeeExample example = new EmployeeExample();
        EmployeeExample.Criteria criteria = example.createCriteria();
        criteria.andEmpIdIn(list);
        employeeMapper.deleteByExample(example);
    }
}
