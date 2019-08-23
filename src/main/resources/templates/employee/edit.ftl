<#include '../common/cssJs.ftl'/>
<link href="${request.contextPath}/static/plugins/datatables/css/dataTables.bootstrap.css" rel="stylesheet">
<script src="${request.contextPath}/static/plugins/datatables/js/jquery.dataTables.js"></script>
<script src="${request.contextPath}/static/plugins/datatables/js/dataTables.bootstrap.js"></script>
<script src="${request.contextPath}/static/js/common.js"></script>
<script src="${request.contextPath}/static/plugins/vue/vue.min.js"></script>
<!-- SELECT2 EXAMPLE -->
<div class="box box-default">
    <div class="box-header with-border" id="header_title">
        <h3 class="box-title">{{title}}</h3>
        <div class="box-tools pull-right">
            <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
        </div>
    </div>
    <form class="form-horizontal" id="employeeInfoForm">
        <input type="hidden" name="empId" v-model="empId" >
        <!-- /.box-header -->
        <div class="box-body">
            <div class="form-group">
                <label class="col-sm-2 control-label">人员名称</label>
                <div class="col-sm-10">
                    <input type="text" v-model="empName" class="form-control" placeholder="人员名称">
                </div>
            </div>
            <!-- /.form-group -->
            <div class="form-group">
                <label class="col-sm-2 control-label">联系方式</label>
                <div class="col-sm-10">
                    <input type="number" v-model="empTel" class="form-control" placeholder="联系方式">
                </div>
            </div>
            <!-- /.form-group -->
            <div class="form-group text-center">
                <button type="button" class="btn btn-primary" onclick="submitForm()">保存</button>
                <button type="button" class="btn btn-default" onclick="goBack()">返回</button>

            </div>
            <!-- /.form-group -->
        </div>
        <!-- /.box-body -->
    </form>

<#--</div>-->
</div>
<!-- /.box -->

<script>

    var id = '${id!}';

    var formDataVue = new Vue({
        el:'#employeeInfoForm',
        data:{
            empId:'',
            empName:'',
            empTel:''
        },
        methods:{
            update:function(data){
                this.empId = data.empId;
                this.empName = data.empName;
                this.empTel = data.empTel;
            }
        }
    });
    var titleVue = new Vue({
        el:'#header_title',
        data:{
            title:'新增人员'
        },
        methods:{
            update:function(data){
                this.title = data;
            }
        }
    })


    //获取表单数据
    function getFormData(id){
        if(id){
            titleVue.update("修改人员");
            $.ajax({
                url: contextPath + '/employee/getById',
                data:{id:id},
                success:function (result) {
                    if(result){
                        formDataVue.update(result);
                    }
                }
            });
        }
    }
    getFormData(id);

    //表单提交
    function submitForm(){

        $.ajax({
            url:contextPath + '/employee/saveOrUpdate',
            type:'post',
            data:formDataVue.$data,
            success:function (result) {
                if(result && result.result_code == RESULT_CODE.SUCCESS){
                    layer.msg(result.result_msg);
                    setTimeout(function () {
                        goBack();
                    },500)
                }else if(result){
                    layer.msg(result.result_msg);
                }else{
                    layer.msg("操作异常");
                }
            }
        });

    }


</script>