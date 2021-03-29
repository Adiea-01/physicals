//查询所有用户
$(document).ready(function () {
    loadData();
});

function loadData() {
    $('#dataTables-userViewReport').dataTable().fnDestroy();
    var table = $('#dataTables-userViewReport').on('xhr.dt', function (e, settings, json, xhr) {
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
                url: "./report/queryViewReportAll",
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
            scrollY: 600, //滚动 固定高度
            scrollX: true, //滚动
            scrollCollapse: true, //滚动
            scroller: true, //滚动
            ordering:false,//排序图标
            fnDrawCallback:function(oSettings ){
                $(".table thead tr th").removeClass("sorting_asc");
            },
            columnDefs: [
                {
                    targets: 0, render: function (data, type, full, meta) {
                        if(full.id != null && full.id != ""){
                            return full.id;
                        }else {
                            return 0000
                        }
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
                        if (full.gender == 1) {
                            return "男";
                        } else {
                            return "女";
                        }
                    }
                },
                {
                    targets: 4, render: function (data, type, full, meta) {
                        return full.department;
                    }
                },
                {
                    targets: 5, render: function (data, type, full, meta) {
                        if (full.view) {
                            return '<a class="btn btn-success btn-sm"><i class="glyphicon glyphicon-comment"></i>已查看</a>';
                        } else {
                            return '<a class="btn btn-warning btn-sm""> <i class="glyphicon glyphicon-open-file"></i>未查看</a>';
                        }
                    }
                }
            ]
        });

}