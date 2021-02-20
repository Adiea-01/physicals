package cn.rails.physicals.service.impl;

import cn.rails.physicals.entity.UserInfo;
import cn.rails.physicals.enums.RespCode;
import cn.rails.physicals.exception.MarsException;
import cn.rails.physicals.mapper.UserMapper;
import cn.rails.physicals.service.UserService;
import cn.rails.physicals.util.PasswordUtils;
import cn.rails.physicals.vo.PageDataVo;
import cn.rails.physicals.vo.RespVo;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Timestamp;
import java.util.List;

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

    /**
     * 登录验证
     * @param username
     * @param password
     * @param request
     * @param response
     * @return
     */
    public RespVo login(String username, String password, HttpServletRequest request, HttpServletResponse response) {
        UserInfo userInfo = userMapper.selectOne(new QueryWrapper<UserInfo>().eq("phone", username));
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

    @Override
    public PageDataVo<UserInfo> queryAll(Integer start, Integer length) {
        Page page = PageHelper.startPage((start/length)+1, length);
        List<UserInfo> userInfoList=userMapper.queryAll();
        PageDataVo<UserInfo> pageData = new PageDataVo<>();
        pageData.setData(userInfoList);
        pageData.setITotal(page.getTotal());
        pageData.setITotalDisplayRecords(page.getTotal());
        pageData.setFnRecordsTotal(page.getTotal());
        return pageData;
    }
}
