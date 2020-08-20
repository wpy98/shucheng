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
        function logout() {
            var flg = confirm("确认退出嘛？");
            if(flg){
                location="logoutServlet?name=index";
            }

        }
    </script>
</head>
<body>
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
                                欢迎,${sessionScope.user.username}&nbsp;&nbsp;<a href="javascript:logout()"><font color="#337AB7">退出</font></a>&nbsp;
                            </c:when>
                            <c:otherwise>
                                <a href="${pageContext.request.contextPath}/jsp/login.jsp"><font color="#337AB7">登录</font></a>&nbsp;&nbsp;
                                <a href="${pageContext.request.contextPath}/jsp/register.jsp"><font color="#337AB7">注册</font></a>&nbsp;
                            </c:otherwise>
                        </c:choose>
                        <a href="${pageContext.request.contextPath}/jsp/cart.jsp"><font color="#337AB7">购物车</font></a>&nbsp;&nbsp;
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
    <!--第三行：存放轮播图信息-->
    <tr>
        <td>
            <p></p>
            <img id="imgid" src="${pageContext.request.contextPath}/HTML/img/img8.jpg" width="100%" height="350px"/>
        </td>
    </tr>
    <!--第四行：存放热门商品信息  需要嵌套一个三行七列的表格  涉及到行列合并-->
    <tr>
        <td>
            <table width="100%">
                <tr>
                    <td colspan="5">
                        <font size="5">热门商品</font>
                        <img src="${pageContext.request.contextPath}/HTML/img/title2.jpg" />
                    </td>
                </tr>

                <tr align="center">

                    <c:forEach items="${requestScope.remen}" var="p" begin="0" end="4">
                        <td>
                            <a href="${pageContext.request.contextPath}/productServlet?method=findById&proId=${p.pro_id}">
                                <img src="${pageContext.request.contextPath}/HTML/${p.pro_min_img}" width="70%"/>
                                 <br />
                                <font color="red">￥：${p.shop_price}</font>
                                 <br />
                                 <span>${p.pro_name}</span>
                            </a>
                        </td>
                    </c:forEach>
                </tr>
                <tr align="center">
                    <c:forEach items="${requestScope.remen}" var="p" begin="10" end="14">
                        <td>
                            <a href="${pageContext.request.contextPath}/productServlet?method=findById&proId=${p.pro_id}">
                                <img src="${pageContext.request.contextPath}/HTML/${p.pro_min_img}" width="70%"/>
                                <br />
                                <font color="red">￥：${p.shop_price}</font>
                                <br />
                                <span>${p.pro_name}</span>
                            </a>
                        </td>
                    </c:forEach>
                </tr>
                <tr align="center">
                    <c:forEach items="${requestScope.remen}" var="p" begin="0" end="4">
                        <td>
                            <a href="${pageContext.request.contextPath}/productServlet?method=findById&proId=${p.pro_id}">
                                <img src="${pageContext.request.contextPath}/HTML/${p.pro_min_img}" width="70%"/>
                                <br />
                                <font color="red">￥：${p.shop_price}</font>
                                <br />
                                <span>${p.pro_name}</span>
                            </a>
                        </td>
                    </c:forEach>
                </tr>
            </table>
        </td>
    </tr>
    <!--第五行：存放图片信息-->
    <tr>
        <td>
            <img src="${pageContext.request.contextPath}/HTML/img/img2.webp" width="100%" />
        </td>
    </tr>
    <!--第六行：存放优选商品信息  需要嵌套一个三行七列的表格  涉及到行列合并-->
    <tr>
        <td>
            <table width="100%">
                <tr>
                    <td colspan="5">
                        <font size="5">优选商品</font>
                        <img src="${pageContext.request.contextPath}/HTML/img/title2.jpg" />
                    </td>
                </tr>

                <tr align="center">
                    <c:forEach items="${requestScope.youxuan}" var="p" begin="0" end="4">
                        <td>
                            <a href="${pageContext.request.contextPath}/productServlet?method=findById&proId=${p.pro_id}">
                                <img src="${pageContext.request.contextPath}/HTML/${p.pro_min_img}" width="70%"/>
                                <br />
                                <font color="red">￥：${p.shop_price}</font>
                                <br />
                                <span>${p.pro_name}</span>
                            </a>
                        </td>
                    </c:forEach>
                </tr>
                <tr align="center">
                    <c:forEach items="${requestScope.youxuan}" var="p" begin="0" end="4">
                        <td>
                            <a href="${pageContext.request.contextPath}/productServlet?method=findById&proId=${p.pro_id}">
                                <img src="${pageContext.request.contextPath}/HTML/${p.pro_min_img}" width="70%"/>
                                <br />
                                <font color="red">￥：${p.shop_price}</font>
                                <br />
                                <span>${p.pro_name}</span>
                            </a>
                        </td>
                    </c:forEach>
                </tr>
            </table>
        </td>
    </tr>
    <!--第七行：存放一张图片-->
    <tr>
        <td>
            <p></p>
            <p></p>
            <img src="${pageContext.request.contextPath}/HTML/img/img1.webp" width="100%"/>
        </td>
    </tr>
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
</table>
</body>
</html>


