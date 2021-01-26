package cn.rails.physicals.sysuser.service.impl;

import cn.rails.physicals.enums.RespCode;
import cn.rails.physicals.exception.MarsException;
import cn.rails.physicals.sysuser.entity.UserInfo;
import cn.rails.physicals.sysuser.mapper.UserMapper;
import cn.rails.physicals.sysuser.service.UserService;
import cn.rails.physicals.util.PasswordUtils;
import cn.rails.physicals.vo.RespVo;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Timestamp;

/**
 * @Description:
 * @Author: pan zhenghui
 * @Date: 2021/1/25 14:20
 */
@Slf4j
@Service
public class UserServiceImpl implements UserService {

    @Resource
    private UserMapper userMapper;


    public RespVo login(String username, String password, HttpServletRequest request, HttpServletResponse response) {
        UserInfo userInfo = userMapper.selectOne(new QueryWrapper<UserInfo>().eq("username", username));
        if (userInfo == null) {
            throw new MarsException(RespCode.USER_OR_PASSWORD_IS_ERROR);
        }
        if (userInfo.getDelFlag() == 1) {
            throw new MarsException("用户已禁用");
        }
        String salt = userInfo.getSalt();
        String encryptPassword = PasswordUtils.encryptPassword(password, salt);
        if (!userInfo.getPassword().equals(encryptPassword)) {
            throw new MarsException(RespCode.USER_OR_PASSWORD_IS_ERROR);
        }
        userMapper.updateLastLoginTime(userInfo.getId(), new Timestamp(System.currentTimeMillis()));
        return RespVo.success();
    }

}
