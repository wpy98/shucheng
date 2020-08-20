package com.ujiuye.filter;

import com.ujiuye.bean.user;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(urlPatterns = {"/BuyServlet","/jsp/cart.jsp","/PayServlet","/jsp/success.jsp"})
public class gwcFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest request = (HttpServletRequest)req;
        HttpServletResponse response = (HttpServletResponse)resp;
        HttpSession session = request.getSession();
        user u = (user) session.getAttribute("user");
        if(u!=null){
            chain.doFilter(req, resp);
        }else{
            response.sendRedirect(request.getContextPath()+"/jsp/login.jsp");
        }

    }

    public void init(FilterConfig config) throws ServletException {

    }

}
