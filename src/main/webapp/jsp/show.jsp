<%@ page import="java.util.List" %>
<%@ page import="com.ujiuye.bean.Product" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <table>
        <%
            List<Product> remen = (List<Product>)request.getAttribute("remen");
            List<Product> youxuan = (List<Product>)request.getAttribute("youxuan");
        %>

        <%
            for(Product p:remen) {
        %>

        <%=p.getPro_id()%>---<%=p.getPro_name()%>

        <%
            }
        %>
    </table>
</body>
</html>
