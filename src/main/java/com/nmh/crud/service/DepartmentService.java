package com.nmh.crud.service;

import com.nmh.crud.bean.Department;
import com.nmh.crud.dao.DepartmentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DepartmentService {

    @Autowired
    DepartmentMapper departmentMapper;


    public List<Department> getDepartments() {
        return departmentMapper.selectByExample(null);
    }
}
