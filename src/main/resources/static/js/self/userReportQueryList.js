//查询所有用户
$(document).ready(function () {
    loadData();
});

function loadData() {
    $('#dataTables-userReportQueryList').dataTable().fnDestroy();
    var table = $('#dataTables-userReportQueryList').on('xhr.dt', function (e, settings, json, xhr) {
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
                url: "./report/queryReportList",
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
                        if (full.id != null && full.id != "") {
                            return full.id;
                        } else {
                            return "";
                        }
                    }
                },
                {
                    targets: 1, render: function (data, type, full, meta) {
                        return full.department;

                        // return full.realName;
                    }
                },
                {
                    targets: 2, render: function (data, type, full, meta) {
                        return full.realName;
                    }
                },
                {
                    targets: 3, render: function (data, type, full, meta) {
                        return full.identityCard;

                    }
                },
                {
                    targets: 4, render: function (data, type, full, meta) {
                        if (full.gender == 1) {
                            return "男";
                        } else {
                            return "女";
                        }
                    }
                },
                {
                    targets: 5, render: function (data, type, full, meta) {
                        return full.year+"体检报告";
                    }
                },
                {
                    targets: 6, render: function (data, type, full, meta) {
                        return '<a class="btn btn-warning btn-circle" onclick="viewDetails(\'' + full.id + '\')"><i class="glyphicon glyphicon-open-file"></i>查看详情</a>';
                    }
                }
            ]
        });
}



function viewDetails(id) {
    loading();
    $.ajax({
        url: "./report/updateUserInfoDelFlag",
        type: "post",
        data: {"id": id},
        dataType: "json",
        success: function (data) {
            loaded();
            if (data.code == "0") {
                loadData();
                // alert(data.msg)
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











