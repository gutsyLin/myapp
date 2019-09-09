<%-- 
    Document   : login
    Created on : 2018-4-25, 17:05:05
    Author     : Lin
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>

        <link href="${contextPath}/resources/css/base.css" rel="stylesheet" type="text/css" /> 
        <script src="${contextPath}/resources/js/jquery.js"></script>
        <!-- dependencies for layui -->
        <link rel="stylesheet" href="${contextPath}/resources/layui/css/layui.css"  media="all">
        <script src="${contextPath}/resources/layui/layui.js" charset="utf-8"></script>
    </head>
    <body>
        <div style="width: 960px;margin: 0 auto;" >
            <div style="margin: 5px 0;">
                <a href="${contextPath}/register/ui" >前往注册界面</a>
            </div>
            <form id="loginForm">
                姓名: <input type="text" name="username"  id="username"  /> <br/>
                密码: <input type="password" name="password"  id="password" /> <br />
                <input type="submit" value="提交" /> <br/>
                <span style="color:red;" id="message"></span>
            </form>
        </div>
        <script>
            $(document).ready(function () {
                console.log("page loadding finished!");

                $("#loginForm").submit(function () {
                    $("#errorInfo").html("");
                    var username = $("#username").val();
                    var password = $("#password").val();
                    
                    //利用ajax进行提交
                    $.ajax({
                        url: "${contextPath}/login/doLogin.json",
                        type: "POST",
                        dataType: "json",
                        data: {username: username, password: password},
                        success: function (data) {
                            if (data.isLogined) {
                                $("#message").html("欢迎您{" + data.user.username + "}, 3秒后将自动跳转!");
                                 $("#message").css("color", "blue");
                            } else {
                                $("#message").html("用户名或密码错误, 请重新填写!");
                                $("#message").css("color", "red");
                            }
                        }
                    });
                    
                    //返回false, 禁止传统form提交
                    return false;
                });
            });
        </script>
    </body>
</html>
