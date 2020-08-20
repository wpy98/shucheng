package com.ujiuye.servlet;

import com.ujiuye.bean.Product;
import com.ujiuye.servier.productServier;
import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

@WebServlet("/BuyServlet")
public class BuyServlet extends HttpServlet {

    @Autowired
    private productServier ps;

    public productServier getPs() {
        return ps;
    }

    public void setPs(productServier ps) {
        this.ps = ps;
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            String method = request.getParameter("method");
            if("buy".equals(method)){
                buy(request,response);
            }else if("delete".equals(method)){
                delete(request,response);
            }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            this.doPost(request, response);
    }

    protected void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String id = request.getParameter("proid");

        Product p = ps.findProductById(Integer.parseInt(id));
        Product pp = null;
        Map<Product,Integer> cart = (Map<Product,Integer>)session.getAttribute("cart");
        Set<Product> set = cart.keySet();
        for(Product pd:set){
            if(pd.getPro_id()==Integer.parseInt(id)){
                pp=pd;
                break;
            }
        }
        cart.remove(pp);
        response.sendRedirect("jsp/cart.jsp");

    }

    private void buy(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
            HttpSession session = request.getSession();

            String id = request.getParameter("proid");
            int num =Integer.parseInt(request.getParameter("num"));
            Product p = ps.findProductById(Integer.parseInt(id));
            Map<Product,Integer> cart = (Map<Product,Integer>)session.getAttribute("cart");
            if(cart!=null){
                Set<Product> set = cart.keySet();
                boolean falg = false;
                Product pp = null;
                for(Product pd:set){
                    if(pd.getPro_id()==Integer.parseInt(id)){
                        falg = true;
                        pp = pd;
                        break;
                    }
                }
                if(falg){
                    Integer i = cart.get(pp);
                    cart.put(pp,num+i);
                }else{
                    cart.put(p,num);
                }
            }else {
                cart = new HashMap<>();
                cart.put(p,num);
                session.setAttribute("cart",cart);
            }
            response.sendRedirect(request.getContextPath()+"/jsp/cart.jsp");
    }
}
