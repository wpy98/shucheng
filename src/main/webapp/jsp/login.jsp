<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <meta charset="UTF-8">
    <title></title>
    <!--css样式-->
    <style type="text/css">
        #imgId5{
            margin-left: 275px;
        }
        /*控制超链接下划线*/
        a{
            text-decoration: none;
        }
    </style>

    <!--js动态效果-->
    <script type="text/javascript">
        /*轮播图*/
        onload = function(){
            setInterval("qhimg()",2000);
        }
        var i = 8;
        function qhimg(){
            i++;
            var imgObj = document.getElementById("imgid");
            imgObj.src="${pageContext.request.contextPath}/HTML/img/img"+i+".jpg";

            if(i==9){
                i=7;
            }
        }
    </script>
</head>
<body bgcolor="#FCFCFC">
<table   width="100%">
    <!--第一行：存放logo信息   嵌套一个一行三列的表格 -->
    <tr>
        <td>
            <table   width="100%" >
                <tr>
                    <td>
                        <img src="${pageContext.request.contextPath}/HTML/img/logo.jpg" />
                    </td>
                    <td >
                        <img src="${pageContext.request.contextPath}/HTML/img/img5.jpg" id="imgId5"/>&nbsp;&nbsp;
                        <img src="${pageContext.request.contextPath}/HTML/img/img6.jpg" />&nbsp;&nbsp;
                        <img src="${pageContext.request.contextPath}/HTML/img/img7.jpg" />&nbsp;&nbsp;
                        <img src="${pageContext.request.contextPath}/HTML/img/img4.jpg" />
                    </td>
                    <td align="center">
                        <c:choose>
                            <c:when test="${sessionScope.user!=null}">
                                欢迎,${sessionScope.user.username}&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/productServlet?method=out&name=login"><font color="#337AB7">退出</font></a>&nbsp;
                            </c:when>
                            <c:otherwise>
                                <a href="${pageContext.request.contextPath}/jsp/login.jsp"><font color="#337AB7">登录</font></a>&nbsp;&nbsp;
                                <a href="${pageContext.request.contextPath}/jsp/register.jsp"><font color="#337AB7">注册</font></a>&nbsp;
                            </c:otherwise>
                        </c:choose>
                        <a href="${pageContext.request.contextPath}/jsp/cart.jsp"><font color="#337AB7">购物车</font></a>&nbsp;
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <!--第二行：存放菜单信息  背景黑色 超链接颜色为白色-->
    <tr bgcolor="#808080" height="50px">
        <td>
            <a href=""><font color="white">首页</font></a>&nbsp;&nbsp;&nbsp;
            <a href=""><font color="white">精品手机</font></a>&nbsp;&nbsp;&nbsp;
            <a href=""><font color="white">数码时尚</font></a>&nbsp;&nbsp;&nbsp;
            <a href=""><font color="white">办公设备</font></a>&nbsp;&nbsp;&nbsp;
            <a href=""><font color="white">主板显卡</font></a>&nbsp;&nbsp;&nbsp;
            <a href=""><font color="white">智能设备</font></a>&nbsp;&nbsp;&nbsp;
            <a href=""><font color="white">Macbook</font></a>&nbsp;&nbsp;&nbsp;
        </td>
    </tr>
    <!--第三行：存放登录主体-->
    <tr>
        <td>
            <table>
                <tr>
                    <td >
                        <p></p>
                        <img src="${pageContext.request.contextPath}/HTML/img/bgimg.png"/>
                    </td>
                    <td>
                        <form style="margin-left: 200px;" action="${pageContext.request.contextPath}/loginServlet">
                            <table style="background-color: white;width: 360px;height: 300px;border: 1px solid gray;text-align: center;">
                                <span style="color: red">
                                    <c:if test="${param.method=='loginerror'}">
                                        用户名或密码错误
                                    </c:if>
                                <%--<% String i = request.getParameter("method");
                                   if ("loginerror".equals(i)) {
                                %>
                                    用户名或密码错误
                                <%}%>--%>
                                    <c:if test="${sessionScope.user==null}">
                                        请登录
                                    </c:if>

                                </span>
                                <tr>
                                    <td>账号：</td>
                                    <td><input type="text" name="username" style="width: 180px;height: 30px;"/></td>
                                </tr>
                                <tr>
                                    <td>密码：</td>
                                    <td><input type="password" name="password" style="width: 180px;height: 30px;"/></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox"/><font size="2" color="#999999">自动登录</font></td>
                                    <td align="right"><font size="2" color="#999999" style="margin-right: 30px;">忘记密码</font></td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <input type="submit" style="width: 300px;height: 50px;background-color: red;" value="登录" />
                                    </td>
                                </tr>
                            </table>
                        </form>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <!--第四行：存放友情链接-->
    <tr>
        <td>
            <p align="center">
                <a href=""><font color="#337AB7">关于我们</font></a>&nbsp;&nbsp;
                <a href=""><font color="#337AB7">联系我们</font></a>&nbsp;&nbsp;
                <a href=""><font color="#337AB7">联系客服</font></a>&nbsp;&nbsp;
                <a href=""><font color="#337AB7">合作招商</font></a>&nbsp;&nbsp;
                <a href=""><font color="#337AB7">商家帮助</font></a>&nbsp;&nbsp;
                <a href=""><font color="#337AB7">营销中心</font></a>&nbsp;&nbsp;
                <a href=""><font color="#337AB7">手机帮助</font></a>&nbsp;&nbsp;
                <a href=""><font color="#337AB7">销售联盟</font></a>&nbsp;&nbsp;
            </p>
        </td>
    </tr>
    <!--第五行：存放版权信息-->
    <tr>
        <td align="center">
            © 2005-2020 东易买 版权所有，并保留所有权利
        </td>
    </tr>
</table>
</body>
</html>

