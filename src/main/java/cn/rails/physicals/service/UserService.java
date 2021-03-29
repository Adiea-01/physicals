package cn.rails.physicals.service;

import cn.rails.physicals.entity.UserInfo;
import cn.rails.physicals.vo.PageDataVo;
import cn.rails.physicals.vo.RespVo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface UserService {

    RespVo login(String username, String password, HttpServletRequest request, HttpServletResponse response);

    PageDataVo<UserInfo> queryAll(Integer start,Integer length,HttpServletRequest request);

    int addUserInfo(UserInfo userInfo);

    UserInfo queryUserInfoById(Long id);

    int updateUserInfo(UserInfo userInfo);

    int updateUserInfoDelFlag(Long id,int delFlag);

    int resetPassword(Long id);

    void resetPasswordAll();

}
