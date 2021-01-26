$("#toLogin").on("click", function () {
    toLogin();
})

function toLogin() {
    var userName = $("#phone").val();
    if (userName == null || userName == '') {
        alert("请输入账户");
        return false;
    }
    var password = $("#password").val();
    if (password == null || password == '') {
        alert("请输入密码");
        return false;
    }

    $.ajax({
        url: "./user/doLogin",
        type: "post",
        data: {"userName": userName, "password": password},
        dataType: "json",
        success: function (data) {
            console.log(data)
            if (data.code == "0") {
                location.href = './index';
            } else {
                alert(data.msg);
            }
        }
    });
}



















