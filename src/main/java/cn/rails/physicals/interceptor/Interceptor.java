package cn.rails.physicals.interceptor;

import cn.rails.physicals.constant.MarsConst;
import cn.rails.physicals.entity.UserInfo;
import cn.rails.physicals.enums.RespCode;
import cn.rails.physicals.exception.MarsException;
import cn.rails.physicals.model.LoginModel;
import cn.rails.physicals.service.MenuService;
import cn.rails.physicals.service.UserLoginService;
import cn.rails.physicals.util.CookieUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @Description:
 * @Author: pan zhenghui
 * @Date: 2021/3/1 10:52
 */
@Slf4j
@Component
public class Interceptor implements HandlerInterceptor {

    @Autowired
    private MenuService menuService;

    @Autowired
    private UserLoginService userLoginService;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        Object obj=request.getSession().getAttribute("userInfo");
        if(obj!=null){
            UserInfo userInfo=(UserInfo) obj;
            if(userInfo!=null){
                return true;
            }
        }else {
            response.sendRedirect(url(request)+"/user/login");
        }
        return true;
//        if (log.isDebugEnabled()) {
//            log.debug("request url:{}", request.getRequestURI());
//        }
//        String authValue = CookieUtil.getCookieValue(request, MarsConst.AUTH_KEY, false);
//        if (!StringUtils.isEmpty(authValue)) {
//            LoginModel model = userLoginService.getLogin();
//            if (model == null) {
//                throw new MarsException(RespCode.SIGNATURE_MISMATCH);
//            }
//
//            return true;
//        }
//        String header = request.getHeader("X-Requested-With");
//        if ("XMLHttpRequest".equals(header)) {
//            response.setHeader("REQUIRE_AUTH", "true");
//            return false;
//        } else {
//            response.sendRedirect(url(request) + "/user/login");
//        }
//        return true;
    }

    public String url(HttpServletRequest request) {
        String path = request.getContextPath();
        return request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        menuService.loadMenuList(handler, request);

    }


}
