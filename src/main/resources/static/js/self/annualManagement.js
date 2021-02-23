
//添加用户
var yearAdd = function () {
    var a = $("#yearAddForm").serializeJson();
    loading();
    $.ajax({
        url: "./annualManagement/addYear",
        type: "post",
        data: JSON.stringify(a),
        contentType: "application/json",
        dataType: "json",
        success: function (data) {
            loaded();
            if (data.code == "0") {
                $("#yearAddModal").modal("hide");
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
    $("#yearId").val(id);
    $('#yearDelModal').modal('show');
}

var yearDel = function () {
    loading();
    $.ajax({
        url: "./annualManagement/deleteYearById",
        type: "post",
        data: {"id": $("#yearId").val()},
        dataType: "json",
        success: function (data) {
            loaded();
            if (data.code == "0") {
                $('#yearDelModal').modal('hide');
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

function yearEdit() {
    var a = $("#yearEditForm").serializeJson();
    loading();
    $.ajax({
        url: "./annualManagement/updateYear",
        type: "post",
        data: JSON.stringify(a),
        contentType: "application/json",
        dataType: "json",
        success: function (data) {
            loaded();
            if (data.code == "0") {
                $("#yearoEditModal").modal("hide");
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

$("#editSuperAdmin").on("change",function () {
    var a =$("#editSuperAdmin").val();
    if (a==1){
        $("#editRoleIdDiv").hide();
    }else{
        $("#editRoleIdDiv").show();
    }
})
$("#superAdmin").on("change",function () {
    var a =$("#superAdmin").val();
    if (a==1){
        $("#addRoleIdDiv").hide();
    }else{
        $("#addRoleIdDiv").show();
    }
})

 function queryYearById(id) {
    loading();
    $.ajax({
        url: "./annualManagement/queryYearById",
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
            $("#yearEditModal").modal("show");
            $("#editId").val(data.id);
            $("#editYear").val(data.year);
            manager.loadRole("editRoleId");
            $("#editRoleId").val(data.roleId);
            $("#yearEditModal").modal("show");
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
    $("#yearAddModal").modal("show");
}

function loadData() {

    $('#dataTables-year').dataTable().fnDestroy();
    var table = $('#dataTables-year').on('xhr.dt', function (e, settings, json, xhr) {
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
                url: "./annualManagement/queryYearAll",
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
                        return full.year;
                    }
                },
                {
                    targets: 2, render: function (data, type, full, meta) {
                        return full.yearUuid;
                    }
                },
                {
                    targets: 3, render: function (data, type, full, meta) {
                        if (full.createDate == '' || full.createDate == null) {
                            return "";
                        }
                        return moment(full.createDate).format("YYYY-MM-DD HH:mm:ss");
                    }
                },

                {
                    targets: 4, render: function (data, type, full, meta) {
                        return '<a class="btn btn-success btn-" onclick="queryYearById(\'' + full.id + '\')"><i class="glyphicon glyphicon-edit"></i>修改</a> &nbsp;&nbsp;' +
                            '<a class="btn btn-warning btn-circle" onclick="showModal(\'' + full.id + '\')"> <i class="glyphicon glyphicon-trash"></i>删除</a>';
                    }
                }
            ]
        });

}