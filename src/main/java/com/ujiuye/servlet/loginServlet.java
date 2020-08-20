package com.ujiuye.servlet;

import com.ujiuye.bean.user;
import com.ujiuye.servier.userServier;
import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {

    @Autowired
    private userServier us;

    public userServier getUs() {
        return us;
    }

    public void setUs(userServier us) {
        this.us = us;
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        user u = us.findUser(username,password);
        if(u.getName() != null){
            HttpSession session = request.getSession();
            session.setAttribute("user",u);
            response.sendRedirect("productServlet?method=login");
        }else{
            response.sendRedirect("jsp/login.jsp?method=loginerror");
        }


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            this.doPost(request, response);
    }
}
