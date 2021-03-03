/*自动加载截取id_token*/
$(document).ready(function () {
    var URL = window.location.href
    var str1 = URL.split("?id_token=")[1];
    var id_token
    if (str1) {
        id_token = str1.split("#/")[0];
        if (id_token) {
            $.ajax({
                url: "./jwt/pcLogin",//请求的url地址
                dataType: "json",   //返回格式为json
                type: "POST",   //请求方式
                async: false,
                data: {
                    "id_token": id_token
                },
                success: function (data) {
                    console.log(data)
                    if (data.code == "0") {
                        location.href = './index';
                    } else {
                        alert(data.msg);
                    }
                },
                error: function (e) {
                    alert("失败：" + e)
                    console.log(e)
                    //请求出错处理
                }
            })
        }
    }
});