<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>EmployeeSystem</title>
    <% pageContext.setAttribute("APP_PATH",request.getContextPath()); %>

    <!-- 引入JQuery -->
    <script type="text/javascript" src="${APP_PATH}/static/js/jquery-3.3.1.min.js"></script>
    <!-- 引入bootstrap样式 -->
    <link href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- 引入js文件 -->
    <script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

    <style>
        .row_top {
            margin-top: 70px;
            margin-bottom: 70px;
        }
    </style>
</head>
<body style="background:#E6E6E6">

    <div class="container row_top">

        <form class="form-horizontal" id="loginList">
            <h1 class="col-md-offset-4">Please sign in</h1>
            <div class="row">
                <div class="form-group">
                    <label for="login_name" class="col-sm-2 control-label"></label>
                    <div class="col-sm-3 col-md-offset-2">
                        <input type="text" class="form-control input-lg" id="login_name" placeholder="Your name" aoto>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="form-group">
                    <label for="login_password" class="col-sm-2 control-label"></label>
                    <div class="col-sm-3 col-md-offset-2">
                        <input type="password" class="form-control input-lg" id="login_password" placeholder="Password">
                        <span class="help-block">

                        </span>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="form-group">
                    <div class="col-sm-3 col-sm-offset-4">
                        <button type="button" class="col-sm-12 btn btn btn-primary btn-lg" id="sign_in_btn">Sign in</button>
                    </div>
                </div>
            </div>

        </form>
    </div>

    <script type="text/javascript">
        window.onload = function() {
            var oInput = document.getElementById("login_name");
            oInput.focus();
        };


        $(function () {
            $("#sign_in_btn").click(function () {
                var username = $("#login_name").val();
                var password = $("#login_password").val();
                $.ajax({
                    url:"${APP_PATH}/loginIn",
                    type:"POST",
                    data:{username:username,password:password},
                    success:function (result) {
                        if(result.extend.lo_msg == "success") {
                            window.location.href="${APP_PATH}/success.do";
                        } else if (result.extend.lo_msg == "error") {

                            $(" #login_password").next("span").text("");
                            $(" #login_password").next("span").text("用户名或密码错误！");
                        }
                    }
                });
            });
        });



    </script>
</body>
</html>
