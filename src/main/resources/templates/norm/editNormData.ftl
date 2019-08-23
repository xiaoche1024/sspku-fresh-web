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
    <form class="form-horizontal" id="normDataForm">
        <input type="hidden" name="dataId" v-model="dataId" >
        <!-- /.box-header -->
        <div class="box-body">
            <div class="form-group">
                <label class="col-sm-2 control-label">中文名字</label>
                <div class="col-sm-10">
                    <input type="text" name="chineseName" v-model="chineseName" class="form-control" placeholder="中文名字">
                </div>
            </div>
            <!-- /.form-group -->
            <div class="form-group">
                <label class="col-sm-2 control-label">CAS号</label>
                <div class="col-sm-10">
                    <input type="text" name="cas" v-model="cas" class="form-control" placeholder="CAS号">
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">IARC</label>
                <div class="col-sm-10">
                    <input type="text" name="iarc" v-model="iarc" class="form-control" placeholder="IARC">
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">CMR1A1B</label>
                <div class="col-sm-10">
                    <input type="text" name="cmr1a1b" v-model="cmr1a1b" class="form-control" placeholder="CMR1A1B">
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">PBT</label>
                <div class="col-sm-10">
                    <input type="text" name="pbt" v-model="pbt" class="form-control" placeholder="PBT">
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">同时水急慢1</label>
                <div class="col-sm-10">
                    <input type="text" name="streamsSpeed" v-model="streamsSpeed" class="form-control" placeholder="同时水急慢1">
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-2 control-label">靶器官慢毒1</label>
                <div class="col-sm-10">
                    <input type="text" name="organStatus" v-model="organStatus" class="form-control" placeholder="靶器官慢毒1">
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">国外禁限</label>
                <div class="col-sm-10">
                    <input type="text" name="abroadLimit" v-model="abroadLimit" class="form-control" placeholder="国外禁限">
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">分类</label>
                <div class="col-sm-10">
                    <input type="text" name="classification" v-model="classification" class="form-control" placeholder="分类">
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
        el:'#normDataForm',
        data:{
            dataId:'',
            chineseName:'',
            cas:'',
            iarc:'',
            cmr1a1b:'',
            pbt:'',
            streamsSpeed:'',
            organStatus:'',
            abroadLimit:'',
            classification:''
        },
        methods:{
            update:function(data){
                this.dataId = data.dataId;
                this.chineseName = data.chineseName;
                this.cas = data.cas;
                this.iarc = data.iarc;
                this.cmr1a1b = data.cmr1a1b;
                this.pbt = data.pbt;
                this.streamsSpeed = data.streamsSpeed;
                this.organStatus = data.organStatus;
                this.abroadLimit = data.abroadLimit;
                this.classification = data.classification;
            }
        }
    });
    var titleVue = new Vue({
        el:'#header_title',
        data:{
            title:'新增指标数据'
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
            titleVue.update("修改指标数据");
            $.ajax({
                url: contextPath + '/norm/getNormDataById',
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
            url:contextPath + '/norm/saveOrUpdateNormData',
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