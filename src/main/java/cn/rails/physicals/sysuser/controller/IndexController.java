package cn.rails.physicals.sysuser.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * @Description:
 * @Author: pan zhenghui
 * @Date: 2021/1/26 17:09
 */
@Controller
public class IndexController {

    @GetMapping("/")
    public String login() {
        return "/login";
    }


}
