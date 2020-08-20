package com.ujiuye.dao.impl;

import com.ujiuye.bean.user;
import com.ujiuye.dao.userDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowCallbackHandler;
import org.springframework.stereotype.Repository;


import java.sql.ResultSet;
import java.sql.SQLException;

@Repository
public class userDaoImpl implements userDao {

    @Autowired
    private JdbcTemplate jt;

    public JdbcTemplate getJt() {
        return jt;
    }

    public void setJt(JdbcTemplate jt) {
        this.jt = jt;
    }

    public int insertUser(user user) {
        String sql = "insert into user valuse(null,?,?,?,?,?,?)";
        int result = jt.update(sql,new Object[]{user.getUsername(),user.getPassword(),user.getEmail(),user.getName(),user.getSex(),user.getBrithday()});
        return result;
    }


    public user findUser(String username, String password) {
        String sql = "select * from user where username=? and password=?";
        final user u = new user();
        jt.query(sql, new RowCallbackHandler() {
            @Override
            public void processRow(ResultSet rs) throws SQLException {
                u.setId(rs.getInt("id"));
                u.setUsername(rs.getString("username"));
                u.setPassword(rs.getString("password"));
                u.setName(rs.getString("name"));
                u.setEmail(rs.getString("email"));
                u.setSex(rs.getString("sex"));
                u.setBrithday(rs.getDate("brithday"));
            }
        },username,password);

        return u;
    }
}
