<#include "common/cssJs.ftl">
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>软微入学助手管理系统</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <script src="${request.contextPath}/static/js/common.js"></script>
</head>
<body class="hold-transition login-page">
<div class="login-box">
    <div class="login-logo">
        <a href="login.html"><b>软微入学助手管理系统</b></a>
    </div>
    <!-- /.login-logo -->
    <div class="login-box-body">
        <p class="login-box-msg">请输入你的账户和密码</p>

        <form id="loginForm" method="post">
            <div class="form-group has-feedback">
                <input name="loginName" type="text" autofocus class="form-control" placeholder="请输入账户" autofocus>
                <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <input name="pwd" type="password" class="form-control" placeholder="请输入密码">
                <span class="glyphicon glyphicon-lock form-control-feedback"></span>
            </div>
            <div class="row">

                <div class="col-xs-4 col-md-offset-4">
                    <button type="button" onclick="login()" class="btn btn-primary btn-block btn-flat">登录</button>
                </div>
                <!-- /.col -->
            </div>
        </form>

        <!--<div class="social-auth-links text-center">-->
        <!--<p>- OR -</p>-->
        <!--<a href="#" class="btn btn-block btn-social btn-facebook btn-flat"><i class="fa fa-facebook"></i> Sign in using-->
        <!--Facebook</a>-->
        <!--<a href="#" class="btn btn-block btn-social btn-google btn-flat"><i class="fa fa-google-plus"></i> Sign in using-->
        <!--Google+</a>-->
        <!--</div>-->
        <!-- /.social-auth-links -->

        <#--<a href="changePwd.html">忘记密码？</a><br>-->
        <!--<a href="register.html" class="text-center">注册账号</a>-->

    </div>
    <!-- /.login-box-body -->
</div>
<!-- /.login-box -->

<script>
    $(function () {
//        $('input').iCheck({
//            checkboxClass: 'icheckbox_square-blue',
//            radioClass: 'iradio_square-blue',
//            increaseArea: '20%' // optional
//        });

        //登陆页跳出
        if(top.window.location.href && top.window.location.href != window.location.href){
            top.window.location.href = window.location.href;
        }
    });


    function login(){
        var params = $("#loginForm").serialize();
        var lo1 = layer.load();
        $.ajax({
            url : contextPath + "/validLogin",
            data:params,
            success:function (result) {
                layer.close(lo1);
                if(result && result.result_code == RESULT_CODE.SUCCESS){
                    window.location.href = contextPath ;
                }else if(result){
                    layer.msg(result.result_msg,{icon:0});
                }else{
                    layer.msg("操作异常！",{icon:0});
                }
            }
        });

    }

    document.onkeydown=function(event){
        //回车键的键值为13
        var e = event ? event :(window.event ? window.event : null);
        if (e.keyCode==13){
            login();  //调用登录按钮的登录事件
        }
    }

</script>
</body>
</html>
