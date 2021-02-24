package cn.rails.physicals.controller;

import cn.rails.physicals.entity.UserInfo;
import cn.rails.physicals.enums.RespCode;
import cn.rails.physicals.exception.MarsException;
import cn.rails.physicals.service.UserService;
import cn.rails.physicals.vo.RespVo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @Description: 用户管理
 * @Author: pan zhenghui
 * @Date: 2021/1/25 14:18
 */
@Controller
@RequestMapping("/user")
@Slf4j
public class UserController {


    @Autowired
    private UserService userService;


    @RequestMapping("/login")
    public String loginHtml() {
        return "login";
    }

    //登录校验
    @PostMapping(value = "/doLogin")
    @ResponseBody
    public RespVo login(@RequestParam("userName") String userName,
                        @RequestParam("password") String password, HttpServletRequest request, HttpServletResponse response) {
        return userService.login(userName, password, request, response);
    }

    /**
     * 用户列表
     *
     * @return
     */
    @RequestMapping("/index")
    public String userIndex() {
        return "user/userManager";
    }

    /**
     * 体检用户列表
     *
     * @param start
     * @param length
     * @return
     */
    @PostMapping(value = "/queryUserAll")
    @ResponseBody
    public RespVo queryUserAll(@RequestParam(defaultValue = "0") Integer start,
                               @RequestParam(defaultValue = "20") Integer length) {
        return RespVo.success(userService.queryAll(start, length));
    }


    /**
     * 添加用户
     *
     * @param userInfo
     * @return
     */
    @PostMapping(value = "/addUserInfo")
    @ResponseBody
    public RespVo addUserInfo(@RequestBody UserInfo userInfo) {
        int count = userService.addUserInfo(userInfo);
        if (count != 1) {
            throw new MarsException(RespCode.SAVE_ERROR);
        }
        return RespVo.success();
    }

    /**
     * @return
     */
    @PostMapping(value = "/queryUserInfoById")
    @ResponseBody
    public RespVo queryUserInfoById(@RequestParam("id") Long id) {
        return RespVo.success(userService.queryUserInfoById(id));
    }

    /**
     * 修改用户信息
     *
     * @param userInfo
     * @return
     */
    @PostMapping(value = "/updateUserInfo")
    @ResponseBody
    public RespVo updateUserInfo(@RequestBody UserInfo userInfo) {
        userService.updateUserInfo(userInfo);
        return RespVo.success();
    }

    /**
     * 删除用户
     * @param id
     * @return
     */
    @PostMapping(value = "/deleteUserInfoById")
    @ResponseBody
    public RespVo deleteUserInfoById(@RequestParam("id") Long id) {
        return RespVo.success(userService.deleteUserInfoById(id));
    }

    /**
     * 密码重置
     * @param id
     * @return
     */
    @PostMapping(value = "/resetPassword")
    @ResponseBody
    public RespVo resetPassword(@RequestParam("id") Long id) {
        userService.resetPassword(id);
        return RespVo.success();
    }

    /**
     * 模糊搜索
     * @param start
     * @param length
     * @param userInfo
     * @return
     */
    @PostMapping(value = "/searchUserInfoByRealName")
    @ResponseBody
    public RespVo searchUserInfoByRealName(@RequestParam(defaultValue = "0") Integer start,
                                           @RequestParam(defaultValue = "20") Integer length, @RequestBody UserInfo userInfo) {
        return RespVo.success(userService.searchUserInfoList(start, length, userInfo));
    }

}