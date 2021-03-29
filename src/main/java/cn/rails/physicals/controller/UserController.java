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
import java.util.Enumeration;

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

    //退出登录
    @RequestMapping(value = "/logout")
    public String logout(HttpServletRequest request, HttpServletResponse response) {
//        CookieUtil.deleteCookie(request,response);
        Enumeration em = request.getSession().getAttributeNames();
        while (em.hasMoreElements()) {
            request.getSession().removeAttribute(em.nextElement().toString());
        }
        return "login";
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
     * @param start
     * @param length
     * @return
     */
    @PostMapping(value = "/queryUserAll")
    @ResponseBody
    public RespVo queryUserAll(@RequestParam(defaultValue = "0") Integer start,
                               @RequestParam(defaultValue = "20") Integer length,
                               HttpServletRequest request) {
        return RespVo.success(userService.queryAll(start, length, request));
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
     * 禁用用户
     * @param id
     * @return
     */
    @PostMapping(value = "/updateUserInfoDelFlag")
    @ResponseBody
    public RespVo updateUserInfoDelFlag(@RequestParam("id") Long id,@RequestParam("delFlag") int delFlag) {
        return RespVo.success(userService.updateUserInfoDelFlag(id,delFlag));
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
     * 一键密码重置
     * @return
     */
    @PostMapping(value = "/resetPasswordAll")
    @ResponseBody
    public RespVo resetPasswordAll() {
        userService.resetPasswordAll();
        return RespVo.success();
    }



}
