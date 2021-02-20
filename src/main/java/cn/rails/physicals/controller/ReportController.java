package cn.rails.physicals.controller;

import cn.rails.physicals.enums.RespCode;
import cn.rails.physicals.exception.MarsException;
import cn.rails.physicals.service.PhysicalDataImportService;
import cn.rails.physicals.vo.RespVo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

/**
 * @Description: 体检报告&体检数据导入
 * @Author: pan zhenghui
 * @Date: 2021/2/19 10:42
 */
@Controller
@RequestMapping("/report")
@Slf4j
public class ReportController {

    @Autowired
    private PhysicalDataImportService physicalDataImportService;

    @RequestMapping("/excelIndex")
    public String excelIndex() {
        return "report/excelIndex";
    }

    @RequestMapping("/reportIndex")
    public String reportIndex() {
        return "report/reportIndex";
    }


    @PostMapping(value = "/uploadExcel")
    @ResponseBody
    private RespVo importExcel(@RequestParam(value = "excelFile", required = false) MultipartFile multipartFile) {

        if (multipartFile == null) {
            throw new MarsException("请先选择要导入的excel文件");
        }
        if (multipartFile.isEmpty()) {
            throw new MarsException(RespCode.FILE_NOT_EXIST);
        }
        physicalDataImportService.importPhysicalData(multipartFile);
        return RespVo.success();


    }




}
