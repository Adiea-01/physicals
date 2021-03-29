
//添加用户
var checkupItemAdd = function () {
    var a = $("#checkupItemAddForm").serializeJson();
    loading();
    $.ajax({
        url: "./checkupItem/addCheckupItem",
        type: "post",
        data: JSON.stringify(a),
        contentType: "application/json",
        dataType: "json",
        success: function (data) {
            loaded();
            if (data.code == "0") {
                $("#checkupItemAddModal").modal("hide");
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
    $("#checkupItemId").val(id);
    $('#checkupItemoDelModal').modal('show');
}

var checkupItemDel = function () {
    loading();
    $.ajax({
        url: "./user/deleteById",
        type: "post",
        data: {"id": $("#checkupItemId").val()},
        dataType: "json",
        success: function (data) {

            loaded();
            if (data.code == "0") {
                $('#checkupItemDelModal').modal('hide');
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

 function checkupItemEdit() {
     var a = $("#checkupItemEditForm").serializeJson();
    loading();
    $.ajax({
        url: "./checkupItem/updateCheckupItem",
        type: "post",
        data: JSON.stringify(a),
        contentType: "application/json",
        dataType: "json",
        success: function (data) {
            loaded();
            if (data.code == "0") {
                $("#checkupItemEditModal").modal("hide");
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

 function queryCheckupItemById(id) {
    loading();
    $.ajax({
        url: "./checkupItem/queryCheckupItemById",
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

            $("#checkupItemEditModal").modal("show");
            $("#editId").val(data.id);
            $("#editChineseName").val(data.chineseName);
            $("#editAbbreviation").val(data.abbreviation);
            $("#editClassification").val(data.classification);
            $("#editMiximum").val(data.miximum);
            $("#editMaximum").val(data.maximum);
            $("#editUnit").val(data.unit);
            $("#editReferenceDescription").val(data.referenceDescription);
            $("#checkupItemEditModal").modal("show");
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

//模糊搜索
function loadDataLikeItem(){
    var itemName=$("#itemName").val();
    if (itemName==null || itemName==''){
        alert("体检项目名称");
        return false;
    }
    loadData(itemName);
}

function add() {
    manager.loadRole("addRoleId");
    $("#checkupItemAddModal").modal("show");
}

function loadData(itemName) {

    $('#dataTables-checkupItem').dataTable().fnDestroy();
   var table = $('#dataTables-checkupItem').on('xhr.dt', function (e, settings, json, xhr) {
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
                url: "./checkupItem/queryCheckupItemAll",
                type: "post",
                dataType: "json",
                data: {'itemName':itemName}
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
                        return full.chineseName;
                    }
                },
                // {
                //     targets: 2, render: function (data, type, full, meta) {
                //         return full.fieldName;
                //     }
                // },
                {
                    targets: 2, render: function (data, type, full, meta) {
                        return full.abbreviation;
                    }
                },
                // {
                //     targets: 4, render: function (data, type, full, meta) {
                //         return full.chineseExplain;
                //     }
                // },
                {
                    targets: 3, render: function (data, type, full, meta) {
                        return full.classification;
                    }
                },
                {
                    targets: 4, render: function (data, type, full, meta) {
                        return full.miximum;
                    }
                },
                {
                    targets: 5, render: function (data, type, full, meta) {
                        return full.maximum;
                    }
                },
                {
                    targets: 6, render: function (data, type, full, meta) {
                        return full.unit;
                    }
                },
                {
                    targets: 7, render: function (data, type, full, meta) {
                        return full.referenceDescription;
                    }
                },
                // {
                //     targets: 2, render: function (data, type, full, meta) {
                //         if (full.status == "1") {
                //             return "开启";
                //         } else {
                //             return "停用";
                //         }
                //     }
                // },

                {
                    targets: 8, render: function (data, type, full, meta) {
                        // return '<a class="btn btn-success btn-" onclick="queryCheckupItemById(\'' + full.id + '\')"><i class="glyphicon glyphicon-edit"></i>修改</a> &nbsp;&nbsp;' +
                        //     '<a class="btn btn-warning btn-circle" onclick="showModal(\'' + full.id + '\')"> <i class="glyphicon glyphicon-trash"></i>删除</a>';
                        if (full.delFlag == 0) {
                            return '<div class="switch2"> \n' +
                                '  <div class="btn_fath clearfix on" onclick="checkupItemSwitch(this,\'' + full.id + '\')"> \n' +
                                '  <div class="move" data-state="on"></div> \n' +
                                '  <div class="btnSwitch btn1"><p class="success"></div> \n' +
                                '  <div class="btnSwitch btn2"> <p class="error"></p></div> \n' +
                                '  </div>';
                        } else {
                            return '<div class="switch2"> \n' +
                                '  <div class="btn_fath clearfix off" onclick="checkupItemSwitch(this,\'' + full.id + '\')"> \n' +
                                '  <div class="move" data-state="off"></div> \n' +
                                '  <div class="btnSwitch btn1"><p class="success"></div> \n' +
                                '  <div class="btnSwitch btn2"> <p class="error"></p></div> \n' +
                                '  </div>';
                        }
                    }
                }
            ]
        });

    $('#dataTables-checkupItem tbody').on( 'dblclick', 'tr', function (e) {
        // var index = $(this).context._DT_RowIndex; //行号
        var nTds = $('td', this);
        var id = $(nTds[0]).text();  //得到第1列的值
        queryCheckupItemById(id)
    } );

}


//项目开关
function checkupItemSwitch(th, id) {
    var switchData = switchButton(th, id, checkupItemStatus);
    // console.log(switchData)
}

function checkupItemStatus(switchData) {
    var id = switchData.get("id");
    var delFlag = switchData.get("delFlag");
    loading();
    $.ajax({
        url: "./checkupItem/updateCheckupItemDelFlag",
        type: "post",
        data: {"id": id, "delFlag": delFlag},
        dataType: "json",
        async: false,
        success: function (data) {
            loaded();
            if (data.code == "0") {
                $("#checkupItemEditModal").modal("hide");
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










