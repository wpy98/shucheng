package com.ujiuye.servlet;

import com.ujiuye.bean.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Map;
import java.util.Set;

@WebServlet("/PayServlet")
public class PayServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Map<Product,Integer> map = (Map<Product,Integer>)session.getAttribute("cart");
        double sum = 0;
        Set<Map.Entry<Product,Integer>> set =  map.entrySet();
        for(Map.Entry<Product,Integer> p :set){
            sum = sum+p.getValue()*p.getKey().getShop_price();
        }
        request.setAttribute("sum",sum);
        request.getRequestDispatcher("jsp/pay.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            this.doPost(request,response);
    }
}
