package cn.rails.physicals.controller;

import cn.rails.physicals.enums.RespCode;
import cn.rails.physicals.exception.MarsException;
import cn.rails.physicals.service.PhysicalDataImportService;
import cn.rails.physicals.service.PhysicalReportService;
import cn.rails.physicals.vo.RespVo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

    @Autowired
    private PhysicalReportService physicalReportService;

    /**
     * 体检数据导入页面
     * @return
     */
    @RequestMapping("/excelIndex")
    public String excelIndex() {
        return "report/excelIndex";
    }

    /**
     * 管理员查看用户体检报告查询结果
     * @return
     */
    @RequestMapping("/reportIndex")
    public String reportIndex() {
        return "report/userViewReportRecord";
    }

    /**
     * 体检数据导入
     * @param multipartFile
     * @return
     */
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

    /**
     * 查询用户报告查询情况
     * @param start
     * @param length
     * @return
     */
    @PostMapping(value = "/queryViewReportAll")
    @ResponseBody
    public RespVo queryViewReportAll(@RequestParam(defaultValue = "0") Integer start,
                                      @RequestParam(defaultValue = "20") Integer length) {
        return RespVo.success(physicalReportService.queryViewReportAll(start, length));
    }

    /**
     * 用户体检报告查询列表
     * @return
     */
    @RequestMapping("/userReportQueryList")
    public String userReportQueryList() {
        return "report/userReportQueryList";
    }


    /**
     * 用户查询列表
     * @param start
     * @param length
     * @param request
     * @return
     */
    @PostMapping(value = "/queryReportList")
    @ResponseBody
    public RespVo queryReportList(@RequestParam(defaultValue = "0") Integer start,
                                  @RequestParam(defaultValue = "20") Integer length, HttpServletRequest request) {
        return RespVo.success(physicalReportService.queryReportList(request,start, length));
    }

    /**
     * 查看详情跳转
     * @return
     */
    @RequestMapping("/viewDetailsJump")
    public String viewDetailsJump() {
        return "report/medicalExaminationReportDetails";
    }

    /**
     * 用户查看体检报告详情
     * @param id
     * @param request
     * @return
     */
    @PostMapping(value = "/queryUserMedicalExaminationReport")
    @ResponseBody
    public RespVo queryUserMedicalExaminationReport(@RequestParam("id") Long id, HttpServletRequest request, HttpServletResponse response) {
//        response.setHeader("Access-Control-Allow-Origin", "*");
//        response.setHeader("Access-Control-Allow-Methods", "POST, GET, OPTIONS, DELETE");
//        response.setHeader("Access-Control-Max-Age", "3600");
//        response.setHeader("Access-Control-Allow-Headers", "x-requested-with");
        return RespVo.success(physicalReportService.queryUserMedicalExaminationReport(request,id));
    }

    @PostMapping("/reportDownload")
    @ResponseBody
    public RespVo reportDownload(Long id){
        physicalReportService.reportDownload(id);
        return RespVo.success();
    }



}
