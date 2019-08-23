<#include '../common/cssJs.ftl'/>
<link href="${request.contextPath}/static/plugins/datatables/css/dataTables.bootstrap.css" rel="stylesheet">
<script src="${request.contextPath}/static/plugins/datatables/js/jquery.dataTables.js"></script>
<script src="${request.contextPath}/static/plugins/datatables/js/dataTables.bootstrap.js"></script>
<script src="${request.contextPath}/static/plugins/select2/select2.full.min.js"></script>
<script src="${request.contextPath}/static/js/common.js"></script>
<!-- SELECT2 EXAMPLE -->
<div class="box box-default">
    <div class="box-header with-border">
        <h3 class="box-title">软微入学助手管理系统</h3>

        <div class="box-tools pull-right">
            <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
        <#--<button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button>-->
        </div>
    </div>
    <!-- /.box-header -->
    <div class="box-body">

        <div class="row">
            <div class="col-sm-4">
                <div class="form-group">
                    <input type="text" id="chineseName" class="form-control" placeholder="数据名称">
                </div>
            </div>
            <#--<div class="col-sm-4">-->
                <#--<div class="form-group">-->
                    <#--&lt;#&ndash;multiple="multiple"&ndash;&gt;-->
                    <#--<select class="form-control select2" id="type"  data-placeholder="类型" >-->
                        <#--<option value="1">类型1</option>-->
                        <#--<option value="2">类型2</option>-->
                    <#--</select>-->
                <#--</div>-->
            <#--</div>-->
            <div class="col-sm-4">
                <button type="button" class="btn btn-primary" onclick="submitSelect()">查询</button>
                <button type="button" class="btn btn-primary" onclick="resetSelect();">重置</button>
            </div>
        </div>

        <button type="button" class="btn btn-success" onclick="norm.addOrEdit()">添加数据</button>
        <button type="button" class="btn btn-success" onclick="norm.del()">删除数据</button>
        <button type="button" class="btn btn-success" onclick="norm.uploadNormData()">Excel导入数据</button>
        <button type="button" class="btn btn-success" onclick="norm.downNormDataTemplate()">下载模板</button>
        <button type="button" class="btn btn-success" onclick="norm.downNormData()">导出数据</button>

        <table class="table table-hover table-bordered" id="tb">
            <thead>
                <tr>
                    <th></th>
                    <th>编号</th>
                    <th>中文名字</th>
                    <th>CAS号</th>
                    <th>IARC</th>
                    <th>CMR1A1B</th>
                    <th>PBT</th>
                    <th>同时水急慢1</th>
                    <th>靶器官慢毒1</th>
                    <th>国外禁限</th>
                    <th>分类</th>
                    <th>添加时间</th>
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
        $(".select2").select2({allowClear: true});
        norm.getDataList();
    });

    //查询
    function submitSelect() {
        //执行查询
        norm.getDataList();
    }

    //查询
    function resetSelect() {
        $("#chineseName").val("");
    }

    var norm = new function(){
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
                    url:contextPath + "/norm/listNormData",
                    method:'POST',
                    data: function (data) {
                        var chineseName=$("#chineseName").val();;
                        if(chineseName){
                            data.chineseName = chineseName;
                        }
                        //data.type = $("#type").val();
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
                    { "data": "dataId",
                        render:function (value) {
                            return "<input type='checkbox' name='id' value='" + value + "'>";
                        }
                    },
                    { "data": "dataId"},
                    { "data": "chineseName"},
                    { "data": "cas"},
                    { "data": "iarc"},
                    { "data": "cmr1a1b"},
                    { "data": "pbt"},
                    { "data": "streamsSpeed"},
                    { "data": "organStatus"},
                    { "data": "abroadLimit"},
                    { "data": "classification"},
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
                        var oper = '<a href="javascript:void(0)" onclick="norm.addOrEdit(\''+ row.dataId +'\')">修改</a> ';
                        return oper;
                    },
                    "targets" : 12
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
            var url = contextPath + '/norm/editNormDataPage';
            if(id){
                url += "?id=" + id;
            }
            window.location.href = url;
        }
        this.uploadNormData = function () {
            var url = contextPath + '/norm/uploadNormData';
            window.location.href = url;
        }
        this.downNormDataTemplate = function () {
            var url = contextPath + '/norm/downNormDataTemplate';
            window.location.href = url;
        }
        this.downNormData = function () {
            var url = contextPath + '/norm/downNormData';
            window.location.href = url;
        }

        //删除数据
        this.del = function(){

            var chkObj = $("input[name='id']:checked");
            var checkBoxValue = "";
            chkObj.each(function(){
                checkBoxValue += $(this).val()+",";
            });
            checkBoxValue = checkBoxValue.substring(0, checkBoxValue.length - 1);
            if(!checkBoxValue){
                layer.msg("请选择记录！");
                return;
            }

            layer.confirm("确定要删除分析指标数据吗", function() {
                $.ajax({
                    url:contextPath + '/norm/bathDelNormData',
                    data:{ids:checkBoxValue},
                    success:function (result) {
                        if(result && result.result_code == RESULT_CODE.SUCCESS){
                            layer.msg(result.result_msg);
                            norm.getDataList();
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