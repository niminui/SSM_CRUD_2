package com.nmh.crud.dao;

import org.apache.ibatis.annotations.Param;

public interface ManagerMapper {

    long findUserByNameAndPassword(@Param("username") String username,
                                   @Param("password") String password);
}
