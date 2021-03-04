package cn.rails.physicals.service;

import cn.rails.physicals.constant.MarsConst;
import cn.rails.physicals.enums.RespCode;
import cn.rails.physicals.exception.MarsException;
import cn.rails.physicals.model.LoginModel;
import cn.rails.physicals.util.CookieUtil;
import cn.rails.physicals.util.JwtTokenUtil;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;

@Service
public class UserLoginService {

    @Autowired
    private HttpServletRequest request;

    public LoginModel getLogin() {
        String token = CookieUtil.getCookieValue(request, MarsConst.AUTH_KEY, false);
        if (StringUtils.isEmpty(token)) {
            throw new MarsException(RespCode.SIGNATURE_MISMATCH);
        }
        return JwtTokenUtil.getLogin(token);
    }


}
