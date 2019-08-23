<#include '../common/cssJs.ftl'/>
<link href="${request.contextPath}/static/plugins/datatables/css/dataTables.bootstrap.css" rel="stylesheet">
<script src="${request.contextPath}/static/plugins/datatables/js/jquery.dataTables.js"></script>
<script src="${request.contextPath}/static/plugins/datatables/js/dataTables.bootstrap.js"></script>
<script src="${request.contextPath}/static/js/common.js"></script>
<!-- SELECT2 EXAMPLE -->
<div class="box box-default">
    <div class="box-header with-border">
        <h3 class="box-title">人员列表</h3>

        <div class="box-tools pull-right">
            <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
        <#--<button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button>-->
        </div>
    </div>
    <!-- /.box-header -->
    <div class="box-body">
        <button type="button" class="btn btn-success" onclick="employeeInfo.addOrEdit()">新增</button>
        <table class="table table-hover table-bordered" id="tb">
            <thead>
                <tr>
                    <th>人员姓名</th>
                    <th>联系方式</th>
                    <th>创建日期</th>
                    <th>操作</th>
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
                    url:contextPath + "/employee/listData",
                    method:'POST',
                    data: function (data) {
//                    data.status = $("#status").val();
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
                    { "data": "empName"},
                    { "data": "empTel"},
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
                    "render" : function(data, type, row) {
                        var oper = '<a href="javascript:void(0)" onclick="employeeInfo.addOrEdit(\''+ row.empId +'\')">修改</a> | ';
                        oper += ('<a href="javascript:void(0)" onclick="employeeInfo.del(\''+ row.empId +'\')">删除</a>');
                        return oper;
                    },
                    "targets" : 3
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
        
        this.addOrEdit = function (id) {
            var url = contextPath + '/employee/editPage';
            if(id){
                url += "?id=" + id;
            }
            window.location.href = url;
        }

        this.del = function(id){
            layer.confirm("确定要删除人员吗", function() {
                $.ajax({
                    url:contextPath + '/employee/del',
                    data:{id:id},
                    success:function (result) {
                        if(result && result.result_code == RESULT_CODE.SUCCESS){
                            layer.msg(result.result_msg);
                            employeeInfo.getDataList();
                        }else if(result){
                            layer.msg(result.result_msg);
                        }else{
                            layer.msg("操作异常");
                        }
                    }
                });
            });
        }

    }



</script>