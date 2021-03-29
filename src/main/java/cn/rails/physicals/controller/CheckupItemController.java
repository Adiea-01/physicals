package cn.rails.physicals.controller;

import cn.rails.physicals.entity.CheckupItem;
import cn.rails.physicals.entity.UserInfo;
import cn.rails.physicals.enums.RespCode;
import cn.rails.physicals.exception.MarsException;
import cn.rails.physicals.service.CheckupItemService;
import cn.rails.physicals.vo.RespVo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

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

    /**
     * 查询体检项目列表
     * @param start
     * @param length
     * @return
     */
    @PostMapping(value = "/queryCheckupItemAll")
    @ResponseBody
    public RespVo queryCheckupItemAll(@RequestParam(defaultValue = "0") Integer start,
                                      @RequestParam(defaultValue = "20") Integer length,
                                      HttpServletRequest request) {
        return RespVo.success(checkupItemService.queryAll(start, length,request));
    }

    /**
     * 添加体检项目
     * @return
     */
    @PostMapping(value = "/addCheckupItem")
    @ResponseBody
    public RespVo addCheckupItem(@RequestBody CheckupItem checkupItem) {
        int count = checkupItemService.addCheckupItem(checkupItem);
        if (count != 1) {
            throw new MarsException(RespCode.SAVE_ERROR);
        }
        return RespVo.success();
    }

    /**
     * @return
     */
    @PostMapping(value = "/queryCheckupItemById")
    @ResponseBody
    public RespVo queryCheckupItemById(@RequestParam("id") Long id) {
        return RespVo.success(checkupItemService.queryCheckupItemById(id));
    }

    /**
     * 修改体检项目信息
     * @return
     */
    @PostMapping(value = "/updateCheckupItem")
    @ResponseBody
    public RespVo updateCheckupItem(@RequestBody CheckupItem checkupItem) {
        checkupItemService.updateCheckupItem(checkupItem);
        return RespVo.success();
    }

    /**
     * 修改启用状态
     * @param id
     * @return
     */
    @PostMapping(value = "/updateCheckupItemDelFlag")
    @ResponseBody
    public RespVo updateCheckupItemDelFlag(@RequestParam("id") Long id,@RequestParam("delFlag") int delFlag) {
        return RespVo.success(checkupItemService.updateCheckupItemDelFlag(id,delFlag));
    }



















}
