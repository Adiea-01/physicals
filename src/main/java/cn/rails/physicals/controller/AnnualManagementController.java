package cn.rails.physicals.controller;

import cn.rails.physicals.service.AnnualManagementService;
import cn.rails.physicals.vo.RespVo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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


}
