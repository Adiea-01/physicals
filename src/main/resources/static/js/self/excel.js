

function queryGlyphicon() {
    // var formData = new FormData(document.querySelector("#excelFile"));//获取form值
    var formData = new FormData();//获取form值
    formData.append("excelFile", $("#excelFile")[0].files[0]);
    console.log(formData)
    console.log($('#excelFile')[0])
    $.ajax({
        url: "./report/uploadExcel",
        type: "POST",
        data: formData,
        processData: false,  // 不处理数据
        contentType: false,   // 不设置内容类型
        success:function(data){
            alert(data.msg);
        }
    });

}
