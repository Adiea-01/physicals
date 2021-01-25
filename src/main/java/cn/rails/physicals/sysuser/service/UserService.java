package cn.rails.physicals.sysuser.service;

import cn.rails.physicals.vo.RespVo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface UserService {

    RespVo login(String username, String password, HttpServletRequest request, HttpServletResponse response);


}
