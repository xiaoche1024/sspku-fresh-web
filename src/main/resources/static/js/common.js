//分页参数
var pageParams = {
    pageNum :1,
    pageSize :10
}

//返回code
var RESULT_CODE = {
    SUCCESS:'SUCCESS',
    FAIL:'FAIL'
}

//时间戳转化时间
function add0(m){return m<10?'0'+m:m }
function getLocalTime(nS,fmt) {
    var time = new Date(nS);
    var y = time.getFullYear();
    var m = time.getMonth()+1;
    var d = time.getDate();
    var h = time.getHours();
    var mm = time.getMinutes();
    var s = time.getSeconds();
    if(fmt == 'ymd'){
        return y+'-'+add0(m)+'-'+add0(d);
    }
    return y+'-'+add0(m)+'-'+add0(d)+' '+add0(h)+':'+add0(mm)+':'+add0(s);//2016/12/31 0:0:0
}

function getCurrTime(fmt) {
    var time = new Date();
    var y = time.getFullYear();
    var m = time.getMonth()+1;
    var d = time.getDate();
    var h = time.getHours();
    var mm = time.getMinutes();
    var s = time.getSeconds();
    if(fmt == 'ymd'){
        return y+'-'+add0(m)+'-'+add0(d);
    }
    return y+'-'+add0(m)+'-'+add0(d)+' '+add0(h)+':'+add0(mm)+':'+add0(s);//2016/12/31 0:0:0
}

//判断字符是否为空
function isNull(data){
    if(null == data || "" == data || typeof (data) == "undefined" || data.length == 0 ){
        return true;
    }
    return false;
}

//返回
function goBack(){
    history.back(-1);
}

//转换json格式数据
function syntaxHighlight(json) {
    if (typeof json != 'string') {
        json = JSON.stringify(json, undefined, 2);
    }
    json = json.replace(/&/g, '&').replace(/</g, '<').replace(/>/g, '>');
    return json.replace(/("(\\u[a-zA-Z0-9]{4}|\\[^u]|[^\\"])*"(\s*:)?|\b(true|false|null)\b|-?\d+(?:\.\d*)?(?:[eE][+\-]?\d+)?)/g, function (match) {
        var cls = 'number';
        if (/^"/.test(match)) {
            if (/:$/.test(match)) {
                cls = 'key';
            } else {
                cls = 'string';
            }
        } else if (/true|false/.test(match)) {
            cls = 'boolean';
        } else if (/null/.test(match)) {
            cls = 'null';
        }
        return '<span class="' + cls + '">' + match + '</span>';
    });
}

//设置文本框可读
function readOnly(){
    $("input[type='text']").attr("readOnly","readOnly");
    $("input[type='number']").attr("readOnly","readOnly");
    $("select").attr("disabled","disabled");
}