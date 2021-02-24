


//添加用户
var userInfoAdd = function () {
    var a = $("#userInfoAddForm").serializeJson();
    loading();
    $.ajax({
        url: "./user/addUserInfo",
        type: "post",
        data: JSON.stringify(a),
        contentType: "application/json",
        dataType: "json",
        success: function (data) {
            loaded();
            if (data.code == "0") {
                $("#userInfoAddModal").modal("hide");
                $("input[type=reset]").trigger("click");
                location.reload();
            } else {
                alert(data.msg);
            }
        },
        error: function (e) {
            loaded();
            alert("网络错误，请重试！！");
        }
    });
}

function showModal(id) {
    $("#userInfoId").val(id);
    $('#userInfoDelModal').modal('show');
}

//删除用户
var userInfoDel = function () {
    loading();
    $.ajax({
        url: "./user/deleteUserInfoById",
        type: "post",
        data: {"id": $("#userInfoId").val()},
        dataType: "json",
        success: function (data) {

            loaded();
            if (data.code == "0") {
                $('#userInfoDelModal').modal('hide');
                loadData();
            } else {
                alert(data.msg);
            }
        },
        error: function (e) {
            loaded();
            alert("网络错误，请重试！！");
        }
    });
}

//修改用户
 function userInfoEdit() {
     var a = $("#userInfoEditForm").serializeJson();
    loading();
    $.ajax({
        url: "./user/updateUserInfo",
        type: "post",
        data: JSON.stringify(a),
        contentType: "application/json",
        dataType: "json",
        success: function (data) {
            loaded();
            if (data.code == "0") {
                $("#userInfoEditModal").modal("hide");
                loadData();
                //location.reload();
            } else {
                alert(data.msg);
            }
        },
        error: function (e) {
            loaded();
            alert("网络错误，请重试！！");
        }
    });
}

//模糊搜索
function loadDataLike(){
    var realName=$("#searchRealName").val();
    if (realName==null || realName==''){
        alert("请输入姓名");
        return false;
    }
    loadDataEnvAndApp(realName);
}

function loadDataEnvAndApp(realName) {
    $('#dataTables-userInfo').dataTable().fnDestroy();
    var table = $('#dataTables-userInfo').on('xhr.dt', function (e, settings, json, xhr) {
        if (json.code == 0) {
            json.recordsTotal = json.data.itotalDisplayRecords;
            json.recordsFiltered = json.data.itotalDisplayRecords;
        } else {
            json.recordsTotal = 0;
            json.recordsFiltered = 0;
        }
    })
        .DataTable({
            ajax: {
                url: "./user/searchUserInfoByRealName",
                type: "post",
                dataType: "json",
                data: {}
                , dataSrc: function (result) {
                    if (result.code != 0) {
                        alert(result.msg);
                        return false;
                    }
                    if (result.data != null) {
                        return result.data.data;
                    }
                    return [];
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert("获取列表失败");
                }
            },
            dom: '<fB<t>ip>',
            stripeClasses: ["odd", "even"],
            paginationType: "full_numbers",
            serverSide: true,
            language: dataTable.language(),
            stateSave: true,
            searching: false,
            paging: true,
            info: true,
            bAutoWidth: false,
            lengthMenu: [[25, 50, 100, -1], [25, 50, 100, "All"]],
            // data: data,
            columnDefs: [
                {
                    targets: 0, render: function (data, type, full, meta) {
                        return full.id;
                    }
                },
                {
                    targets: 1, render: function (data, type, full, meta) {
                        return full.realName;
                    }
                },
                {
                    targets: 2, render: function (data, type, full, meta) {
                        return full.identityCard;
                    }
                },
                {
                    targets: 3, render: function (data, type, full, meta) {
                        return full.jobNumber;
                    }
                },
                {
                    targets: 4, render: function (data, type, full, meta) {
                        return full.phone;
                    }
                },
                {
                    targets: 5, render: function (data, type, full, meta) {
                        if (full.gender == 1) {
                            return "男";
                        } else {
                            return "女";
                        }
                    }
                },
                {
                    targets: 6, render: function (data, type, full, meta) {
                        return full.department;
                    }
                },
                {
                    targets: 7, render: function (data, type, full, meta) {
                        if (full.lastLoginTime == '' || full.lastLoginTime == null) {
                            return "";
                        }
                        return moment(full.lastLoginTime).format("YYYY-MM-DD HH:mm:ss");
                    }
                },
                {
                    targets: 8, render: function (data, type, full, meta) {
                        if (full.delFlag == "0") {
                            return "开启";
                        } else {
                            return "停用";
                        }
                    }
                },
                // {
                //     targets: 7, render: function (data, type, full, meta) {
                //         if (full.roleName != null) {
                //             return full.roleName;
                //         } else {
                //             if (full.superAdmin == "1") {
                //                 return "超级管理员";
                //             } else {
                //                 return "普通管理员";
                //             }
                //         }
                //     }
                // },
                {
                    targets: 9, render: function (data, type, full, meta) {
                        return '<a class="btn btn-success btn-" onclick="queryByUserId(\'' + full.id + '\')"><i class="glyphicon glyphicon-edit"></i>修改</a> &nbsp;&nbsp;' +
                            '<a class="btn btn-warning btn-circle" onclick="showModal(\'' + full.id + '\')"> <i class="glyphicon glyphicon-trash"></i>删除</a>';
                    }
                }
            ]
        });
}



 function queryByUserId(id) {
    loading();
    $.ajax({
        url: "./user/queryUserInfoById",
        type: "post",
        data: {"id": id},
        dataType: "json",
        success: function (result) {
            var data = result.data;
            loaded();
            if (result.code != 0) {
                alert(result.msg);
                return false;
            }

            $("#userInfoEditModal").modal("show");
            $("#editId").val(data.id);
            $("#editRealName").val(data.realName);
            $("#editIdentityCard").val(data.identityCard);
            $("#editJobNumber").val(data.jobNumber);
            $("#editPhone").val(data.phone);
            $("#editGender").val(data.gender);
            $("#editDepartment").val(data.department);
            // manager.loadRole("editRoleId");
            // $("#editRoleId").val(data.roleId);
            $("#userInfoEditModal").modal("show");
        },error: function (e) {
            loaded();
            alert("网络错误，请重试！！");
        }
    });

}
//查询所有用户
$(document).ready(function () {
    loadData();
});
function add() {
    manager.loadRole("addRoleId");
    $("#userInfoAddModal").modal("show");
}

function loadData() {

    $('#dataTables-userInfo').dataTable().fnDestroy();
    var table = $('#dataTables-userInfo').on('xhr.dt', function (e, settings, json, xhr) {
            if (json.code == 0) {
                json.recordsTotal = json.data.itotalDisplayRecords;
                json.recordsFiltered = json.data.itotalDisplayRecords;
            } else {
                json.recordsTotal = 0;
                json.recordsFiltered = 0;
            }
        })
        .DataTable({
            ajax: {
                url: "./user/queryUserAll",
                type: "post",
                dataType: "json",
                data: {}
                , dataSrc: function (result) {
                    if (result.code != 0) {
                        alert(result.msg);
                        return false;
                    }
                    if (result.data != null) {
                        return result.data.data;
                    }
                    return [];
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert("获取列表失败");
                }
            },
            dom: '<fB<t>ip>',
            stripeClasses: ["odd", "even"],
            paginationType: "full_numbers",
            serverSide: true,
            language: dataTable.language(),
            stateSave: true,
            searching: false,
            paging: true,
            info: true,
            bAutoWidth: false,
            lengthMenu: [[25, 50, 100, -1], [25, 50, 100, "All"]],
            // data: data,
            deferRender: true, //滚动
            scrollY: 600, //滚动 固定高度
            scrollX: true, //滚动
            scrollCollapse: true, //滚动
            scroller: true, //滚动
            ordering:false,//排序图标
            fnDrawCallback:function(oSettings ){
                $(".table  thead tr th").removeClass("sorting_asc");
            },
            columnDefs: [
                {
                    targets: 0, render: function (data, type, full, meta) {
                        return full.id;
                    }
                },
                {
                    targets: 1, render: function (data, type, full, meta) {
                        return full.realName;
                        // return '<span  ondblclick="queryByUserId(\'' + full.id + '\')">'+full.realName+'</span>';
                    }
                },
                {
                    targets: 2, render: function (data, type, full, meta) {
                        return full.identityCard;
                    }
                },
                {
                    targets: 3, render: function (data, type, full, meta) {
                        return full.jobNumber;
                    }
                },
                {
                    targets: 4, render: function (data, type, full, meta) {
                        return full.phone;
                    }
                },
                {
                    targets: 5, render: function (data, type, full, meta) {
                        if (full.gender == 1) {
                            return "男";
                        } else {
                            return "女";
                        }
                    }
                },
                {
                    targets: 6, render: function (data, type, full, meta) {
                        return full.department;
                    }
                },

                {
                    targets: 7, render: function (data, type, full, meta) {
                        if (full.lastLoginTime == '' || full.lastLoginTime == null) {
                            return "";
                        }
                        return moment(full.lastLoginTime).format("YYYY-MM-DD HH:mm:ss");
                    }
                },
                {
                    targets: 8, render: function (data, type, full, meta) {
                        if (full.delFlag == 0) {
                            return '<div class="switch2"> \n' +
                                '  <div class="btn_fath clearfix on" onclick="toogle(this)"> \n' +
                                '  <div class="move" data-state="on"></div> \n' +
                                '  <div class="btnSwitch btn1"><p class="success"></div> \n' +
                                '  <div class="btnSwitch btn2"> <p class="error"></p></div> \n' +
                                '  </div>';
                        } else {
                            return '<div class="switch2"> \n' +
                                '  <div class="btn_fath clearfix off" onclick="toogle(this)"> \n' +
                                '  <div class="move" data-state="off"></div> \n' +
                                '  <div class="btnSwitch btn1"><p class="success"></div> \n' +
                                '  <div class="btnSwitch btn2"> <p class="error"></p></div> \n' +
                                '  </div>';
                            // return '<a class="btn btn-warning">停用</a>';
                        }
                    }
                },
                // {
                //     targets: 7, render: function (data, type, full, meta) {
                //         if (full.roleName != null) {
                //             return full.roleName;
                //         } else {
                //             if (full.superAdmin == "1") {
                //                 return "超级管理员";
                //             } else {
                //                 return "普通管理员";
                //             }
                //         }
                //     }
                // },
                {
                    targets: 9, render: function (data, type, full, meta) {
                        // return '<a class="btn btn-success btn-" onclick="queryByUserId(\'' + full.id + '\')"><i class="glyphicon glyphicon-edit"></i>修改</a> &nbsp;&nbsp;' +
                        //     '<a class="btn btn-warning btn-circle" onclick="showModal(\'' + full.id + '\')"> <i class="glyphicon glyphicon-trash"></i>删除</a>';
                        return '<a class="btn btn-danger" onclick="resetPassword(\'' + full.id + '\')"><i class="glyphicon glyphicon-lock"></i>重置密码</a>';
                    }
                }
            ],

        });


    $('#dataTables-userInfo tbody').on( 'dblclick', 'tr', function (e) {
        // var index = $(this).context._DT_RowIndex; //行号
        var nTds = $('td', this);
        var id = $(nTds[0]).text();  //得到第1列的值
        queryByUserId(id)
    } );


}


//密码重置
function resetPassword(id) {
    var resetPasswordMsg = confirm("是否确定密码重置？");
    if(resetPasswordMsg){
        loading();
        $.ajax({
            url: "./user/resetPassword",
            type: "post",
            data: {"id": id},
            dataType: "json",
            success: function (data) {
                loaded();
                if (data.code == "0") {
                    $("#userInfoEditModal").modal("hide");
                    loadData();
                    alert(data.msg)
                    //location.reload();
                } else {
                    alert(data.msg);
                }
            },
            error: function (e) {
                loaded();
                alert("网络错误，请重试！！");
            }
        });
    }

}