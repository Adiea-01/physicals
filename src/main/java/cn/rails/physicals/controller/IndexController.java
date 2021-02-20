package cn.rails.physicals.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @Description:
 * @Author: pan zhenghui
 * @Date: 2021/1/26 17:09
 */
@Controller
public class IndexController {

    @GetMapping("/")
    public String login() {
        return "login";
    }

    //登录后页面
    @GetMapping("/index")
    public String index() {
        return "index";
    }

    @GetMapping("/control")
    public String control(){
        return "/control";
    }


}
