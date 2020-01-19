package com.nmh.crud.service;

import com.nmh.crud.dao.ManagerMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ManagerService {

    @Autowired
    ManagerMapper managerMapper;

    public boolean findUserByNameAndPassword(String username,String password) {
        long count = managerMapper.findUserByNameAndPassword(username, password);
        return count == 1;
    }
}
