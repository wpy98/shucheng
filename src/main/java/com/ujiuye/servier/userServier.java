package com.ujiuye.servier;

import com.ujiuye.bean.user;

public interface userServier {
    public int addUser(user u);
    public user findUser(String username, String password);
}
