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
        <a href="javascript:void(0)"><b>软微入学助手管理系统-修改密码</b></a>
    </div>
    <!-- /.login-logo -->
    <div class="login-box-body">
        <p class="login-box-msg">请输入您的账号和密码！</p>

        <form id="loginForm" method="post">
            <div class="form-group has-feedback">
                <input id="loginName" name="loginName" type="text" class="form-control" placeholder="账号">
                <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <input id="pwd" name="pwd" type="password" class="form-control" placeholder="旧密码">
                <span class="glyphicon glyphicon-lock form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <input id="newPwd" name="newPwd" type="password" class="form-control" placeholder="新密码">
                <span class="glyphicon glyphicon-lock form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <input id="reNewPwd" name="reNewPwd" type="password" class="form-control" placeholder="确认新密码">
                <span class="glyphicon glyphicon-lock form-control-feedback"></span>
            </div>
            <div class="row">
                <div class="col-xs-4 col-md-offset-2">
                    <button type="button" onclick="changePwd()" class="btn btn-primary btn-block btn-flat">修改密码</button>
                </div>
                <div class="col-xs-4 ">
                    <button type="button" onclick="goBack()" class="btn btn-primary btn-block btn-flat">返回</button>
                </div>
                <!-- /.col -->
            </div>
        </form>

        <#--<a href="javascript:void(0)" class="text-center" onclick="goBack()">返回</a><br>-->
        <!--<a href="register.html" class="text-center">注册账号</a>-->

    </div>
    <!-- /.login-box-body -->
</div>
<!-- /.login-box -->

<script>

    function changePwd(){
        var loginName = $("#loginName").val();
        if(isNull(loginName)){
            $("#loginName").focus();
            layer.msg("请输入登陆账号！");
            return;
        }
        var pwd = $("#pwd").val();
        if(isNull(pwd)){
            $("#pwd").focus();
            layer.msg("请输入旧密码！");
            return;
        }
        var newPwd = $("#newPwd").val();
        var reNewPwd = $("#reNewPwd").val();
        if(isNull(newPwd)){
            $("#newPwd").focus();
            layer.msg("请输入新密码！");
            return;
        }
        if(newPwd != reNewPwd){
            $("#newPwd").focus();
            layer.msg("俩次输入新密码不一致！");
            return;
        }

        var params = $("#loginForm").serialize();
        $.ajax({
            url : contextPath + "/sysUser/setPwd",
            data:params,
            success:function (result) {
                if(result && result.result_code == RESULT_CODE.SUCCESS){
                    layer.msg("修改成功！",{icon:1});
                    setTimeout(function () {
                        window.location.href = contextPath + '/login';
                    },1000);

                }else if(result){
                    layer.msg(result.result_msg,{icon:0});
                }else{
                    layer.msg("操作异常！",{icon:0});
                }
            }
        });

    }

</script>
</body>
</html>
