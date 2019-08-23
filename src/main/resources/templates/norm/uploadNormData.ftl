<#include '../common/cssJs.ftl'/>
<link href="${request.contextPath}/static/plugins/datatables/css/dataTables.bootstrap.css" rel="stylesheet">
<script src="${request.contextPath}/static/plugins/datatables/js/jquery.dataTables.js"></script>
<script src="${request.contextPath}/static/plugins/datatables/js/dataTables.bootstrap.js"></script>
<script src="${request.contextPath}/static/js/common.js"></script>
<script src="${request.contextPath}/static/plugins/vue/vue.min.js"></script>
<!-- SELECT2 EXAMPLE -->
<div class="box box-default">
    <div class="box-header with-border" id="header_title">
        <h3 class="box-title">软微入学助手管理系统Excel导入</h3>
        <div class="box-tools pull-right">
            <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
        </div>
    </div>


    <form enctype="multipart/form-data" id="batchUpload"  action="/norm/readNormDataExcel" method="post" class="form-horizontal">
        <input type="hidden" name="dataId" v-model="dataId" >
        <!-- /.box-header -->
        <div class="box-body">
            <div class="form-group">
                <label class="col-sm-2 control-label">excel文件</label>
                <div class="col-sm-10">
                    <button class="btn btn-success btn-xs" id="uploadEventBtn" style="height:26px;"  type="button" >选择文件</button>
                    <input type="file" name="excel"  style="width:0px;height:0px;" id="uploadEventFile">
                    <input id="uploadEventPath"  disabled="disabled"  type="text" placeholder="请择excel表" style="border: 1px solid #e6e6e6; height: 26px;width: 200px;" />
                </div>
            </div>
            <!-- /.form-group -->
        </div>
        <!-- /.box-body -->
    </form>

    <!-- /.form-group -->
    <div class="form-group text-center">
        <button type="button" class="btn btn-primary" onclick="uploadNormData.uploadBtn()">导入数据</button>
        <button type="button" class="btn btn-default" onclick="goBack()">返回</button>

    </div>
<#--</div>-->
</div>
<!-- /.box -->

<script type="text/javascript">
    var UploadNormData = function() {
        this.init = function() {
            //模拟上传excel
            $("#uploadEventBtn").unbind("click").bind("click", function() {
                $("#uploadEventFile").click();
            });
            $("#uploadEventFile").bind("change", function() {
                $("#uploadEventPath").attr("value",    $("#uploadEventFile").val());
            });
        };
        //点击上传钮
        this.uploadBtn = function() {
            var uploadEventFile = $("#uploadEventFile").val();
            if (uploadEventFile == '') {
                alert("请择excel,再上传");
            } else if (uploadEventFile.lastIndexOf(".xls") < 0) {//可判断以.xls和.xlsx结尾的excel
                alert("只能上传Excel文件");
            } else {
                var url = contextPath+"/norm/readNormDataExcel";
                var formData = new FormData($('form')[0]);
                uploadNormData.sendAjaxRequest(url, "POST", formData);
            }
        };
        this.sendAjaxRequest = function(url, type, data) {
            $.ajax({
                url : url,
                type : type,
                data : data,
                dataType : "json",
                success : function(result) {
                    layer.msg(result.result_msg);
                    window.location.href = contextPath + '/norm/listNormData';
                },
                error : function(result) {
                    layer.msg(result.result_msg);
                },
                cache : false,
                contentType : false,
                processData : false
            });
        };
    };
    var uploadNormData;
    $(function() {
        uploadNormData = new UploadNormData();
        uploadNormData.init();
    });
</script>