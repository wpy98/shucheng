package com.ujiuye.dao;

import com.ujiuye.bean.user;

public interface userDao {
    public int insertUser(user user);
    public user findUser(String username, String password);
}
