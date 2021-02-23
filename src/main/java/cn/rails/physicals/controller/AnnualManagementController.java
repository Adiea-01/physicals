package cn.rails.physicals.controller;

import cn.rails.physicals.entity.AnnualManagement;
import cn.rails.physicals.entity.UserInfo;
import cn.rails.physicals.enums.RespCode;
import cn.rails.physicals.exception.MarsException;
import cn.rails.physicals.service.AnnualManagementService;
import cn.rails.physicals.vo.RespVo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

/**
 * @Description: 年度管理
 * @Author: pan zhenghui
 * @Date: 2021/2/19 10:46
 */
@Controller
@RequestMapping("/annualManagement")
@Slf4j
public class AnnualManagementController {

    @Autowired
    private AnnualManagementService annualManagementService;

    @RequestMapping("/index")
    public String index() {
        return "annualManagement/index";
    }

    @PostMapping(value = "/queryYearAll")
    @ResponseBody
    public RespVo queryYearAll(@RequestParam(defaultValue = "0") Integer start,
                               @RequestParam(defaultValue = "20") Integer length) {
        return RespVo.success(annualManagementService.queryAll(start, length));
    }


    /**
     * 添加年份
     * @param annualManagement
     * @return
     */
    @PostMapping(value = "/addYear")
    @ResponseBody
    public RespVo addYear(@RequestBody AnnualManagement annualManagement) {
        int count = annualManagementService.addYear(annualManagement);
        if (count != 1) {
            throw new MarsException(RespCode.SAVE_ERROR);
        }
        return RespVo.success();
    }

    /**
     * 查询年份
     * @return
     */
    @PostMapping(value = "/queryYearById")
    @ResponseBody
    public RespVo queryYearById(@RequestParam("id") Long id) {
        return RespVo.success(annualManagementService.queryYearById(id));
    }

    /**
     * 修改年
     * @return
     */
    @PostMapping(value = "/updateYear")
    @ResponseBody
    public RespVo updateYear(@RequestBody AnnualManagement annualManagement) {
        annualManagementService.updateYear(annualManagement);
        return RespVo.success();
    }

    /**
     * 删除年
     * @param id
     * @return
     */
    @PostMapping(value = "/deleteYearById")
    @ResponseBody
    public RespVo deleteYearById(@RequestParam("id") Long id) {
        return RespVo.success(annualManagementService.deleteYearById(id));
    }








}
