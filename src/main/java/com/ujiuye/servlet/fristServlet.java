package com.ujiuye.servlet;

import com.ujiuye.bean.user;
import com.ujiuye.servier.impl.userServierImpl;
import com.ujiuye.servier.userServier;
import com.ujiuye.utils.DateUtil;

import javax.servlet.annotation.WebServlet;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/com.ujiuye.servlet.fristServlet")
public class fristServlet extends javax.servlet.http.HttpServlet {
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String name = request.getParameter("name");
        String sex = request.getParameter("sex");
        String brithday = request.getParameter("brithday");

        user u = new user();
        userServier us = new userServierImpl();

        u.setUsername(username);
        u.setPassword(password);
        u.setEmail(email);
        u.setSex(sex);
        u.setName(name);
        u.setBrithday(DateUtil.stringToDate(brithday));


        int result = us.addUser(u);

        if(result>0){

            response.sendRedirect("HTML/login.html");
        }else{

            response.sendRedirect("HTML/erry.html");
        }

    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {

    }
}
