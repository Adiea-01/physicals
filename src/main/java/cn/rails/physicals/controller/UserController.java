package cn.rails.physicals.controller;

import cn.rails.physicals.service.UserService;
import cn.rails.physicals.vo.RespVo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
                               @RequestParam(defaultValue = "20") Integer length) {
        return RespVo.success(userService.queryAll(start, length));
    }


    @RequestMapping("/authIndex")
    public String authIndex() {
        return "userAuthManager";
    }

}
