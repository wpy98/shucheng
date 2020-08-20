package com.ujiuye.servier.impl;

import com.ujiuye.bean.user;
import com.ujiuye.dao.impl.userDaoImpl;
import com.ujiuye.dao.userDao;
import com.ujiuye.servier.userServier;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class userServierImpl implements userServier {

    @Autowired
    private userDao userDao;

    public com.ujiuye.dao.userDao getUserDao() {
        return userDao;
    }

    public void setUserDao(com.ujiuye.dao.userDao userDao) {
        this.userDao = userDao;
    }

    @Override
    public int addUser(user u) {

        return userDao.insertUser(u);
    }

    @Override
    public user findUser(String username, String password) {
        return userDao.findUser(username, password);
    }
}
