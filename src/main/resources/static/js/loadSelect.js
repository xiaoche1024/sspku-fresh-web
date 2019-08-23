//加载收入类型 以及 收入项目
var LoadBaseData = new function(){
    this.getExpendType = function (id) {
        $.ajax({
            url: contextPath + '/expendType/getAllType',
            async:false,
            success:function (result) {
                if(result && result.length > 0){
                    var optionText = '<option value="">请选择</option>';
                    for(var i = 0; i< result.length; i++){
                        optionText += ("<option value='"+ result[i].expTypeId +"'>"+ result[i].expName +"</option>")
                    }
                    $("#"+id).html(optionText);
                }
            }
        })
    };

    this.getEarningType = function (id) {
        $.ajax({
            url: contextPath + '/earningsType/getAllType',
            async:false,
            success:function (result) {
                if(result && result.length > 0){
                    var optionText = '<option value="">请选择</option>';
                    for(var i = 0; i< result.length; i++){
                        optionText += ("<option value='"+ result[i].earnTypeId +"'>"+ result[i].earnName +"</option>")
                    }
                    $("#"+id).html(optionText);
                }
            }
        })
    };

    this.getProjectSelect = function (id) {
        $.ajax({
            url: contextPath + '/projectInfo/getAll',
            async:false,
            success:function (result) {
                if(result && result.length > 0){
                    var optionText = '<option value="">请选择</option>';
                    for(var i = 0; i< result.length; i++){
                        optionText += ("<option value='"+ result[i].proId +"'>"+ result[i].proName +"</option>")
                    }
                    $("#"+id).html(optionText);
                }
            }
        })
    };

    this.getEmployeeSelect = function (id) {
        $.ajax({
            url: contextPath + '/employee/getAll',
            async:false,
            success:function (result) {
                if(result && result.length > 0){
                    var optionText = '<option value="">请选择</option>';
                    for(var i = 0; i< result.length; i++){
                        optionText += ("<option value='"+ result[i].empId +"'>"+ result[i].empName +"</option>")
                    }
                    $("#"+id).html(optionText);
                }
            }
        })
    }
}
