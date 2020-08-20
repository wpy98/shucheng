<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/HTML/css/registercss.css">

    <script>
        function checkForm(){

            if(checkUsername() && checkPassword() && checkRepwd() && checkEmail() && checkName()){
                return true;
            }else{
                return false;
            }
        }

        function checkUsername(){
            var usernameReg = /^[\w]{4,10}$/;
            var username = document.getElementById('username').value;

            if(usernameReg.test(username)){
                document.getElementById('usernameMessage').style.color="green";
                document.getElementById('usernameMessage').innerHTML="√";
                return true;
            }else{
                document.getElementById('usernameMessage').style.color="red";
                document.getElementById('usernameMessage').innerHTML="× 用户名格式不正确";
                return false;
            }
        }


        function checkPassword(){
            var passwordReg = /^[a-zA-Z0-9]{6,20}$/;
            var password = document.getElementById('password').value;

            if(passwordReg.test(password)){
                document.getElementById('passwordMessage').style.color="green";
                document.getElementById('passwordMessage').innerHTML="√";
                return true;
            }else{
                document.getElementById('passwordMessage').style.color="red";
                document.getElementById('passwordMessage').innerHTML="× 密码格式不正确";
                return false;
            }
        }

        function checkRepwd(){
            var password = document.getElementById('password').value;
            var repwd = document.getElementById('repwd').value;

            if(password==repwd){
                document.getElementById('repwdMessage').style.color="green";
                document.getElementById('repwdMessage').innerHTML="√";
                return true;
            }else{
                document.getElementById('repwdMessage').style.color="red";
                document.getElementById('repwdMessage').innerHTML="× 两次密码不一致";
                return false;
            }

        }

        function checkEmail(){
            var emailReg = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;


            var email = document.getElementById('email').value;

            if(emailReg.test(email)){
                document.getElementById('emailMessage').style.color="green";
                document.getElementById('emailMessage').innerHTML="√";
                return true;
            }else{
                document.getElementById('emailMessage').style.color="red";
                document.getElementById('emailMessage').innerHTML="× 邮箱格式不正确";
                return false;
            }
        }

        function checkName(){
            var nameReg = /^[a-zA-Z]{3,10}$/;
            var name = document.getElementById('name').value;

            if(nameReg.test(name)){
                document.getElementById('nameMessage').style.color="green";
                document.getElementById('nameMessage').innerHTML="√";
                return true;
            }else{
                document.getElementById('nameMessage').style.color="red";
                document.getElementById('nameMessage').innerHTML="× 姓名格式不正确";
                return false;
            }
        }

        function logout() {
            var flg = confirm("确认退出嘛？");
            if(flg){
                location="${pageContext.request.contextPath}/logoutServlet?name=index";
            }

        }
    </script>

</head>
<body>

<div>
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
                                欢迎,${sessionScope.user.username}&nbsp;&nbsp;<a href="javascript:logout()"><font color="#337AB7">退出</font></a>&nbsp;
                            </c:when>
                            <c:otherwise>
                                <a href="${pageContext.request.contextPath}/jsp/login.jsp"><font color="#337AB7">登录</font></a>&nbsp;&nbsp;
                                <a href="${pageContext.request.contextPath}/jsp/register.jsp"><font color="#337AB7">注册</font></a>&nbsp;
                            </c:otherwise>
                        </c:choose>
                        <a href="${pageContext.request.contextPath}/jsp/cart.jsp"><font color="#337AB7">购物车</font></a>
                    </td>
                </tr>
            </table>
        </td>
    </tr>

</div>

<div style="width:100%;background-image:url('${pageContext.request.contextPath}/HTML/image/registerBack.jpg'); background-size: cover;">


    <form action="${pageContext.request.contextPath}/productServlet?method=register" method="post" class="bootstrap-frm" onsubmit="return checkForm()">

        <h1>会员注册
            <span>USER REGISTER.</span>
        </h1>

        <label>
            <span>用户名</span>
            <input id="username" type="text" name="username" placeholder="请输入用户名" onblur="checkUsername()" /><strong id="usernameMessage"></strong>
        </label>

        <label>
            <span>密  码</span>
            <input type="password" id="password" name="password" placeholder="请输入密码" onblur="checkPassword()"/><strong id="passwordMessage"></strong>
        </label>

        <label>
            <span>确认密码</span>
            <input type="password" id="repwd" name="repwd" placeholder="请输入确认密码" onblur="checkRepwd()" /><strong id="repwdMessage"></strong>
        </label>

        <label>
            <span>Email</span>
            <input type="email" id="email" name="email" placeholder="Email" onblur="checkEmail()"/><strong id="emailMessage"></strong>
        </label>

        <label>
            <span>姓  名</span>
            <input type="text" id="name" name="name" placeholder="请输入姓名" onblur="checkName()"/><strong id="nameMessage"></strong>
        </label>




        <label>
            <span>性  别</span>
            <select name="sex">
                <option value="男">男</option>
                <option value="女">女</option>
            </select>
        </label>

        <label>
            <span>出生日期</span>
            <input id="name" type="text" name="brithday" placeholder="年/月/日" />
        </label>


        <label>
            <span>&nbsp;</span>
            <input type="submit"  width="100" value="注册" name="submit" border="0"
                   style="background: url('${pageContext.request.contextPath}/HTML/image/register.gif') no-repeat scroll 0 0 rgba(0, 0, 0, 0);
				    height:35px;width:100px;color:white;">
        </label>
    </form>

</div>

<div align="center">

    <!--第八行：存放友情链接-->
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
    <!--第九行：存放版权信息-->
    <tr>
        <td align="center">
            © 2005-2020 东易买 版权所有，并保留所有权利
        </td>
    </tr>

</div>

</body>


</html>