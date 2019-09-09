<%-- 
    Document   : register
    Created on : 2018-4-27, 12:22:10
    Author     : Lin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="${contextPath}/resources/css/base.css" rel="stylesheet" type="text/css" /> 
        <link href="${contextPath}/resources/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" /> 
        <style>
            #registerBox {
                width: 400px;
                margin: 0 auto;
                padding: 7px;
            }
        </style>
        <title>注册到《幻想西游online》</title>
    </head>
    <body>
        <div class="mainPage">
            <div class="container jumbotron" id="registerBox">
                <form id="registerForm"  method="post" class="form-horizontal" role="form" >
                    <div class="form-group">
                        <label for="username" class="col-sm-3 control-label">用户名</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="username"  name="username"
                                   placeholder="请输入用户名">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="password" class="col-sm-3 control-label">密码</label>
                        <div class="col-sm-9">
                            <input type="password" class="form-control" id="password"  name="password"
                                   placeholder="请输入密码">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="re-password" class="col-sm-3 control-label">确认密码</label>
                        <div class="col-sm-9">
                            <input type="password" class="form-control" id="rePassword" 
                                   placeholder="请确认密码">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-3 col-sm-5">
                            <button type="submit" class="btn btn-default">注册</button>
                        </div>
                    </div>
                    <div class="form-group">
                        <span style="color: red;margin-left: 10px;font-size: 20px;" id="errorInfo" ></span>
                    </div>
                </form>
            </div>
        </div>


        <button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">开始演示模态框</button>
        <!-- 模态框（Modal） -->
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title" id="myModalLabel">模态框（Modal）标题</h4>
                    </div>
                    <div class="modal-body">在这里添加一些文本</div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="button" class="btn btn-primary">提交更改</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal -->
        </div>

        <!-- bootstrap的js依赖与jquery -->
        <script src="${contextPath}/resources/bootstrap/js/jquery.js"></script>
        <script src="${contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>
        <script>
            $(document).ready(function () {
                
                $("#username").blur(function () {
                    var uname = this.value;
                    if (uname.length >= 6) {
                        $.ajax({
                            url: "${contextPath}/register/validateUsername.json",
                            data: {username: uname},
                            success: function (data) {
                                if (data.ifExisted) {
                                    $("#errorInfo").html("* 该用户名已被占用, 请换个用户名!");
                                } else {
                                    $("#errorInfo").html("");
                                }
                            }
                        });
                    }
                });

                $("#registerForm").submit(function () {
                    var username = $("#username").val().trim();
                    var pwd = $("#password").val().trim();
                    var rePwd = $("#rePassword").val().trim();
                    var $errorInfo = $("#errorInfo");

                    var infoValid = true;
                    var errorInfo = "";
                    $errorInfo.html(errorInfo);
                    if (username === '' || username.length < 6) {
                        infoValid = false;
                        errorInfo = "* 用户名必须不为空且长度不小于6";
                    } else if (pwd === '' || pwd.length < 6) {
                        infoValid = false;
                        errorInfo = "* 密码必须不为空且长度不小于6";
                    } else if (pwd !== rePwd) {
                        infoValid = false;
                        errorInfo = "* 确认密码与密码不一致";
                    }
                    $errorInfo.html(errorInfo);

                    if (infoValid) {
                        $.ajax({
                            url: "${contextPath}/register/doRegister.json",
                            type: "post",
                            data: {username: username, password: pwd},
                            success: function (data) {
                                if (data.ifSucceed) {
                                    alert("恭喜您成功注册到《幻想西游online》");
                                    location.href = "${contextPath}/login/ui.html";
                                } else {
                                    $errorInfo.html("* " + data.msg);
                                }
                            }
                        });
                    }
                    return false;
                });
            });
        </script>
    </body>
</html>
