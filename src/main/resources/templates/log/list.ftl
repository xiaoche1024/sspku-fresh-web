<#include '../common/cssJs.ftl'/>
<link href="${request.contextPath}/static/plugins/datatables/css/dataTables.bootstrap.css" rel="stylesheet">
<script src="${request.contextPath}/static/plugins/datatables/js/jquery.dataTables.js"></script>
<script src="${request.contextPath}/static/plugins/datatables/js/dataTables.bootstrap.js"></script>
<script src="${request.contextPath}/static/js/common.js"></script>
<!-- SELECT2 EXAMPLE -->
<div class="box box-default">
    <div class="box-header with-border">
        <h3 class="box-title">日志列表</h3>

        <div class="box-tools pull-right">
            <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
        <#--<button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button>-->
        </div>
    </div>
    <!-- /.box-header -->
    <div class="box-body">
        <table class="table table-hover table-bordered" id="tb">
            <thead>
                <tr>
                    <th>编号</th>
                    <th>操作</th>
                    <th>操作人</th>
                    <th>操作IP</th>
                    <th>操作时间</th>
                </tr>
            </thead>

        </table>
    </div>
    <!-- /.box-body -->
<#--<div class="box-footer">-->

<#--</div>-->
</div>
<!-- /.box -->
<script>

    var _table;
    $(function(){
        employeeInfo.getDataList();
    });


    var employeeInfo = new function(){
        this.getDataList = function () {
            _table = $("#tb").dataTable({
                "iDisplayLength" : pageParams.pageSize,
                "bSort":false,
                "bLengthChange": false,
                "bFilter": false,
                "bProcessing": true,
                "bServerSide": true,
                "bAutoWidth":true,
                "bDestroy":true,
                ajax: {
                    url:contextPath + "/sysLog/listData",
                    method:'POST',
                    data: function (data) {
                        if(!_table || _table == undefined) {
                            data.pageNum = pageParams.pageNum;
                            data.pageSize = pageParams.pageSize;
                        } else {
                            var info = _table.DataTable().page.info();
                            data.pageNum = info.page + 1;
                            data.pageSize = info.length;
                        }
                    }
                },
                "fnServerParams": function (aoData,oSettings) {},
                "columns": [
                    { "data": "id"},
                    { "data": "descInfo"},
                    { "data": "operUserName"},
                    { "data": "ip"},
                    { "data": "createTime",
                        render:function(value){
                            if(isNull(value)){
                                return '';
                            }
                            return getLocalTime(value);
                        }
                    }
                ],
                "columnDefs" : [{
                    "targets" : 4
                }],
                "sPaginationType": "full_numbers",
                "oLanguage": {
                    "oPaginate": {
                        "sFirst": "首页",
                        "sLast": "尾页",
                        "sNext": "下一页",
                        "sPrevious": "上一页"
                    },
                    "sProcessing": "正在获取数据，请稍等",
                    "sLengthMenu": "每页显示 _MENU_ 数据",
                    "sZeroRecords": "未检索到符合条件的数据",
                    "sInfo": "显示 第_START_ 到 _END_ 条数据 共 _TOTAL_ 数据",
                    "sInfoEmpty": "未检索到符合条件的数据",
                    "sInfoFiltered": "(共 _MAX_ 条数据)"
                }
            });
        }

    }



</script>