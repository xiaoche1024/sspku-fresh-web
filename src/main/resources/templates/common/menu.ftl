<aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
        <!-- Sidebar user panel -->
        <div class="user-panel">
            <div class="pull-left image">
                <img src="${request.contextPath}/static/index_logo.png" class="img-circle" alt="User Image">
            </div>
            <div class="pull-left info">
                <p>${sysUser.realName!}</p>
                <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
            </div>
        </div>

        <!-- sidebar menu: : style can be found in sidebar.less -->
        <ul class="sidebar-menu" id="ul-menu">
            <li class="header">功能菜单</li>
            <li class="treeview">
                <a href="#">
                    <i class="fa fa-file-text-o"></i> <span>日常管理</span>
                    <span class="pull-right-container">
                      <i class="fa fa-angle-left pull-right"></i>
                    </span>
                </a>
                <ul class="treeview-menu">
                    <li><a onclick="clickMenu(this,'/norm/normData')" href="javascript:void(0)">
                        <i class="fa fa-circle-o"></i> 指标数据管理</a>
                    </li>
                    <li><a onclick="clickMenu(this,'/norm/normDoc')" href="javascript:void(0)">
                        <i class="fa fa-circle-o"></i> 指标文档管理</a>
                    </li>
                </ul>
            </li>

            <li class="treeview">
                <a href="#">
                    <i class="fa fa-file-text-o"></i> <span>系统管理</span>
                    <span class="pull-right-container">
                      <i class="fa fa-angle-left pull-right"></i>
                    </span>
                </a>
                <ul class="treeview-menu">
                    <li><a onclick="clickMenu(this,'/sysUser/listPage')" href="javascript:void(0)">
                        <i class="fa fa-circle-o"></i> 用户管理</a>
                    </li>
                    <li><a onclick="clickMenu(this,'/sysLog/listPage')" href="javascript:void(0)">
                        <i class="fa fa-circle-o"></i> 日志管理</a>
                    </li>
                </ul>
            </li>


        </ul>
    </section>
    <!-- /.sidebar -->
</aside>