package cn.rails.physicals.interceptor;

import cn.rails.physicals.entity.UserInfo;
import cn.rails.physicals.service.MenuService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
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
    }

    public String url(HttpServletRequest request){
        String path = request.getContextPath();
        return request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        menuService.loadMenuList(handler, request);

    }



}
