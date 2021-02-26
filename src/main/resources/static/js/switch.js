
function switchButton(th, id,fun) {
    var map = new Map();
    map.set("id", id);
    var delFlag;
    Swal.fire({
        type: 'warning', // 弹框类型
        title: '系统提示', //标题
        text: "是否确认修改状态？", //显示内容
        confirmButtonColor: '#3085d6',// 确定按钮的 颜色
        confirmButtonText: '确定',// 确定按钮的 文字
        showCancelButton: true, // 是否显示取消按钮
        cancelButtonColor: '#d33', // 取消按钮的 颜色
        cancelButtonText: "取消", // 取消按钮的 文字
        focusCancel: true, // 是否聚焦 取消按钮
        reverseButtons: false  // 是否 反转 两个按钮的位置 默认是  左边 确定  右边 取消
    }).then(function (isConfirm) {
        try {
            //判断 是否 点击的 确定按钮
            if (isConfirm.value) {
                Swal.fire("成功", "", "success");
                //如果是确认了，则修改状态
                var ele = $(th).children(".move");
                if (ele.attr("data-state") == "on") {
                    ele.animate({left: "0"}, 300, function () {
                        ele.attr("data-state", "off");
                        // alert("关！");
                        delFlag = 1;
                        map.set("delFlag", delFlag);
                        fun(map);
                        // console.log(map);
                        // return map;
                    });
                    $(th).removeClass("on").addClass("off");
                } else if (ele.attr("data-state") == "off") {
                    ele.animate({left: '26px'}, 300, function () {
                        $(this).attr("data-state", "on");
                        // alert("开！");
                        delFlag = 0;
                        map.set("delFlag", delFlag);
                        fun(map);
                        // console.log(map);
                        // return map;
                    });
                    $(th).removeClass("off").addClass("on");
                }

            } else {
                Swal.fire("已取消", "", "error");
            }
        } catch (e) {
            alert(e);
        }
    });
    return map;
}

















