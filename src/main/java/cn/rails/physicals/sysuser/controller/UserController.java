package cn.rails.physicals.sysuser.controller;

import cn.rails.physicals.sysuser.service.UserService;
import cn.rails.physicals.vo.RespVo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
    public String loginHtml(){
        return "login";
    }


    @RequestMapping("/index")
    public String index(){
        return "/user/userManager";
    }

    @RequestMapping("/authIndex")
    public String authIndex(){
        return "/userAuthManager";
    }

    @RequestMapping("/doLogin")
    public RespVo login(@RequestParam("userName") String userName,
                        @RequestParam("password") String password, HttpServletRequest request, HttpServletResponse response) {
        return userService.login(userName,password,request,response);
    }



}
