<#include "common/cssJs.ftl">
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>软微入学助手管理系统</title>
    <link rel="icon" type="image/x-icon" href="${request.contextPath}/static/favicon.ico">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <script src="${request.contextPath}/static/js/common.js"></script>

</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

    <header class="main-header">
        <!-- Logo -->
        <a href="" class="logo">
            <!-- mini logo for sidebar mini 50x50 pixels -->
            <#--<span class="logo-mini"><b>高关注化学物分析指标数据库</b></span>-->
            <!-- logo for regular state and mobile devices -->
            <span class="logo-lg"><b>U谷签约数据</b></span>
        </a>
        <!-- Header Navbar: style can be found in header.less -->
        <nav class="navbar navbar-static-top">
            <!-- Sidebar toggle button-->
            <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </a>

            <button type="button" onclick="logout()"
                    class="btn btn-danger pull-right" style="margin-top: 8px;margin-right: 7px;">
                退出登陆
            </button>
            <button type="button" onclick="setPwd()"
                    class="btn btn-success pull-right" style="margin-top: 8px;margin-right: 7px;">
                修改密码
            </button>
        </nav>
    </header>
    <!-- Left side column. contains the logo and sidebar -->
    <#include "common/menu.ftl">

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">

        <!-- Main content -->
        <section class="content">

            <iframe id="mainIframe" style="width: 100%;" src="sysIdx" frameborder="0" scrolling="yes" ></iframe>

        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->
    <footer class="main-footer">
        <div class="pull-right hidden-xs">
            <b>Version</b> 1.0.0
        </div>
        <strong>Copyright &copy; 2019</strong>U谷
    </footer>

    <!-- /.control-sidebar -->
    <!-- Add the sidebar's background. This div must be placed
         immediately after the control sidebar -->
    <div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->

</body>

    <script>

        //菜单点击
        function clickMenu(obj,url){
            $("#mainIframe").attr("src",contextPath + url);
            $("#ul-menu li").removeClass("active");
            $(obj).parent().addClass("active");
            $(obj).parent().parent().parent().addClass("active");
        }

        function setIframe(iframe){
            if (iframe) {
                iframe.height = document.body.clientHeight - 140;
            }
        }
        var iframe = document.getElementById('mainIframe');
        setIframe(iframe);
        $(document).ready(function(){
            $(window).resize(function() {

                setIframe(iframe)

            });
        });

        function logout(){
            $.ajax({
                url:contextPath + "/logout",
                success:function (result) {
                    if(result && result.result_code == RESULT_CODE.SUCCESS){
                        window.location.href = contextPath + '/login';
                    }else if(result){
                        layer.msg(result.result_msg);
                    }else{
                        layer.msg("操作异常");
                    }
                }
            })
        }

        function setPwd(){
            window.location.href = contextPath + "/sysUser/setPwdPage";
        }
    </script>

</html>
