package com.nmh.crud.test;

import com.nmh.crud.bean.Department;
import com.nmh.crud.bean.Employee;
import com.nmh.crud.dao.DepartmentMapper;
import com.nmh.crud.dao.EmployeeMapper;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.UUID;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class MapperTest {

    @Autowired
    DepartmentMapper departmentMapper;

    @Autowired
    EmployeeMapper employeeMapper;

    @Autowired
    SqlSession sqlSession;

    @Test
    public void testCRUD() {
        /*departmentMapper.insertSelective(new Department(null,"开发部"));
        departmentMapper.insertSelective(new Department(null,"测试部"));*/

        //employeeMapper.insertSelective(new Employee(null,"Jack","M","Jack@sina.com",1));
        EmployeeMapper mapper = sqlSession.getMapper(EmployeeMapper.class);
        for (int i = 0; i < 1500; i++) {
            String uid = UUID.randomUUID().toString().substring(0,5) + i;
            mapper.insertSelective(new Employee(null,uid,"M",uid + "@sina.com",1));
        }
    }

}
