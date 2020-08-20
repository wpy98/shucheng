package com.ujiuye.servlet;

import com.ujiuye.bean.Product;
import com.ujiuye.bean.user;
import com.ujiuye.servier.productServier;
import com.ujiuye.servier.userServier;
import com.ujiuye.utils.DateUtil;
import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet( "/productServlet")
public class productServlet extends HttpServlet {

    @Autowired
    private productServier ps;

    public productServier getPs() {
        return ps;
    }

    public void setPs(productServier ps) {
        this.ps = ps;
    }

    @Autowired
    private userServier us;

    public userServier getUs() {
        return us;
    }

    public void setUs(userServier us) {
        this.us = us;
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        String method = request.getParameter("method");
        if("login".equals(method)){
            login(request, response);
        }else if("findById".equals(method)){
            findById(request, response);
        }else if("register".equals(method)){
            register(request,response);
        }/*else if("out".equals(method)){
            out(request,response);
        }*/
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
    /*protected void out(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.removeAttribute("user");
        String name = request.getParameter("name");
        if("index".equals(name)){
            response.sendRedirect("productServlet?method=login");
        }else if("login".equals(name)){
            response.sendRedirect("jsp/login.jsp");
        }else if("cart".equals(name)){
            response.sendRedirect("jsp/cart.jsp");
        }
    }*/
    //注册
    protected void register(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String name = request.getParameter("name");
        String sex = request.getParameter("sex");
        String brithday = request.getParameter("brithday");

        user u = new user();

        u.setUsername(username);
        u.setPassword(password);
        u.setEmail(email);
        u.setSex(sex);
        u.setName(name);
        u.setBrithday(DateUtil.stringToDate(brithday));


        int result = us.addUser(u);

        if(result>0){

            response.sendRedirect("productServlet?method=login");
        }else{

            response.sendRedirect("HTML/erry.html");
        }
    }
    //主页
    protected void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        List<Product> remen = ps.findProduct(1);
        List<Product> youxuan = ps.findProduct(2);

        request.setAttribute("remen",remen);
        request.setAttribute("youxuan",youxuan);

        request.getRequestDispatcher("jsp/index.jsp").forward(request,response);
    }
    //查询
    protected void findById(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String id = request.getParameter("proId");
        Product p = ps.findProductById(Integer.parseInt(id));
        System.out.println(p);

        request.setAttribute("p",p);

        request.getRequestDispatcher("jsp/product_info.jsp").forward(request,response);
    }
}
