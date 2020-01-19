package com.nmh.crud.test;

import com.nmh.crud.service.ManagerService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class ManagerTest {

    @Autowired
    ManagerService managerService;

    @Test
    public void test() {
        boolean b = managerService.findUserByNameAndPassword("admin", "123456");
        System.out.println(b);
    }

}
