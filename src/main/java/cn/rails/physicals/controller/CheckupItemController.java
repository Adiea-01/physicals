package cn.rails.physicals.controller;

import cn.rails.physicals.service.CheckupItemService;
import cn.rails.physicals.vo.RespVo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @Description: 体检检查项目
 * @Author: pan zhenghui
 * @Date: 2021/2/19 9:18
 */
@Controller
@RequestMapping("/checkupItem")
@Slf4j
public class CheckupItemController {

    @Autowired
    private CheckupItemService checkupItemService;

    @RequestMapping("/index")
    public String checkupItemIndex() {
        return "checkupItem/index";
    }

    @PostMapping(value = "/queryCheckupItemAll")
    @ResponseBody
    public RespVo queryCheckupItemAll(@RequestParam(defaultValue = "0") Integer start,
                                      @RequestParam(defaultValue = "20") Integer length) {
        return RespVo.success(checkupItemService.queryAll(start, length));
    }
}
