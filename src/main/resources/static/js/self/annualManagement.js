
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
                $("#yearEditModal").modal("hide");
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
            // deferRender: true, //滚动
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
                        // return '<a class="btn btn-success btn-" onclick="queryYearById(\'' + full.id + '\')"><i class="glyphicon glyphicon-edit"></i>修改</a> &nbsp;&nbsp;' +
                        //     '<a class="btn btn-warning btn-circle" onclick="showModal(\'' + full.id + '\')"> <i class="glyphicon glyphicon-trash"></i>删除</a>';
                        if (full.delFlag == 0) {
                            return '<div class="switch2"> \n' +
                                '  <div class="btn_fath clearfix on" onclick="yearSwitch(this,\'' + full.id + '\')"> \n' +
                                '  <div class="move" data-state="on"></div> \n' +
                                '  <div class="btnSwitch btn1"><p class="success"></div> \n' +
                                '  <div class="btnSwitch btn2"> <p class="error"></p></div> \n' +
                                '  </div>';
                        } else {
                            return '<div class="switch2"> \n' +
                                '  <div class="btn_fath clearfix off" onclick="yearSwitch(this,\'' + full.id + '\')"> \n' +
                                '  <div class="move" data-state="off"></div> \n' +
                                '  <div class="btnSwitch btn1"><p class="success"></div> \n' +
                                '  <div class="btnSwitch btn2"> <p class="error"></p></div> \n' +
                                '  </div>';
                        }
                    }
                },
                {
                    targets: 5, render: function (data, type, full, meta) {
                        if(full.yearFlag==0){
                            return '<a class="btn btn-primary btn-sm" onclick="setDefaultYear(\'' + full.id + '\')"><i class="glyphicon glyphicon-star-empty"></i>设为默认</a>';
                        }else {
                            return '<a class="btn btn-default btn-sm" disabled="disabled">默认</a>';
                        }
                    }
                }
            ]
        });


    $('#dataTables-year tbody').on( 'dblclick', 'tr', function (e) {
        // var index = $(this).context._DT_RowIndex; //行号
        var nTds = $('td', this);
        var id = $(nTds[0]).text();  //得到第1列的值
        queryYearById(id)
    } );
}


//年份开关
function yearSwitch(th, id) {
    var switchData = switchButton(th, id, yearStatus);
    // console.log(switchData)
}

function yearStatus(switchData) {
    var id = switchData.get("id");
    var delFlag = switchData.get("delFlag");
    loading();
    $.ajax({
        url: "./annualManagement/updateYearDelFlag",
        type: "post",
        data: {"id": id, "delFlag": delFlag},
        dataType: "json",
        async: false,
        success: function (data) {
            loaded();
            if (data.code == "0") {
                loadData();
                $("#yearEditModal").modal("hide");
                // alert(data.msg)
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

//设置默认年份
function setDefaultYear(id) {
    loading();
    $.ajax({
        url: "./annualManagement/updateDefaultYear",
        type: "post",
        data: {"id": id},
        dataType: "json",
        async: false,
        success: function (data) {
            loaded();
            if (data.code == "0") {
                $("#yearEditModal").modal("hide");
                loadData();
                // alert(data.msg)
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