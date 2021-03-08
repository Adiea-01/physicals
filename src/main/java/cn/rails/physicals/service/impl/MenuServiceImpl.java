package cn.rails.physicals.service.impl;

import cn.rails.physicals.entity.Menu;
import cn.rails.physicals.entity.UserInfo;
import cn.rails.physicals.mapper.MenuMapper;
import cn.rails.physicals.model.LoginModel;
import cn.rails.physicals.service.MenuService;
import cn.rails.physicals.service.UserLoginService;
import com.baomidou.mybatisplus.core.toolkit.CollectionUtils;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.method.HandlerMethod;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Objects;

/**
 * @Description:
 * @Author: pan zhenghui
 * @Date: 2021/3/1 11:02
 */
@Slf4j
@Service
public class MenuServiceImpl implements MenuService {

    @Resource
    private MenuMapper menuMapper;

    @Autowired
    private UserLoginService userLoginService;

    @Override
    public void loadMenuList(Object handler, HttpServletRequest request) {
        Object obj = request.getSession().getAttribute("userInfo");
        String requestUrl = request.getRequestURI();
        if (obj != null) {
            UserInfo userInfo = (UserInfo) obj;
            int superNum = userInfo.getIsSuper();
            List<Menu> menuList = null;
            if (superNum == 1) {
                menuList = menuMapper.queryMenuByCode("1");
            } else {
                menuList = menuMapper.queryMenuByCode("3");
            }
            if (CollectionUtils.isNotEmpty(menuList)) {
                menuList = searchChildMenu(menuList, requestUrl);
            }
            request.setAttribute("menuList", menuList);
        }


//        if (handler instanceof HandlerMethod) {
//            LoginModel model = userLoginService.getLogin();
//            if (model == null) {
//                log.info(" loadMenuList userInfo is null");
//                return;
//            }
//            if(Objects.equals("管理员",model.getRoleName())){
//                menuList = menuMapper.queryMenuByCode("1");
//            }else {
//                menuList = menuMapper.queryMenuByCode("3");
//            }
//            HandlerMethod handlerMethod = (HandlerMethod) handler;
//            Method method = handlerMethod.getMethod();
//            String requestUrl = request.getRequestURI();
//            // 判断接口是否需要登录
//            if (CollectionUtils.isNotEmpty(menuList)) {
//                menuList = searchChildMenu(menuList, requestUrl);
//            }
//            request.setAttribute("menuList", menuList);
//        }
    }



    private List<Menu> loadChildMenu(List<Menu> menuBarList, Menu parentMenu, Map<String, Boolean> checkedMap) {
        if (CollectionUtils.isNotEmpty(menuBarList)) {
            List<Menu> menuList = new ArrayList<>(10);
            for (Menu m : menuBarList) {
                if (Objects.equals(m.getParentMenuId(), parentMenu.getId())) {
                    if (checkedMap.containsKey(m.getId().toString())) {
                        m.setActive(1);
                    }
                    menuList.add(m);
                }
            }
            return menuList;
        }
        return null;
    }


    private List<Menu> searchChildMenu(List<Menu> menuBarList, String requestUrl) {
        if (CollectionUtils.isNotEmpty(menuBarList)) {
            List<Menu> menuList = new ArrayList<>(10);
            for (Menu m : menuBarList) {
                if (m.getMenuLevel() != 1) {
                    continue;
                }
                m.setChildMenu(getChildMenu(menuBarList, m, requestUrl));
                menuList.add(m);
            }
            return menuList;
        }
        return null;
    }

    private boolean equRequestUrl(String url, String requestUrl) {
        if (StringUtils.isEmpty(url) || StringUtils.isEmpty(requestUrl)) {
            return false;
        }
        url = url.replaceAll("/", "");
        requestUrl = requestUrl.replaceAll("/", "");
        return url.equals(requestUrl);
    }

    private List<Menu> getChildMenu(List<Menu> menuBarList, Menu parentMenu, String requestUrl) {
        if (CollectionUtils.isNotEmpty(menuBarList)) {
            List<Menu> menuList = new ArrayList<>(5);
            boolean parentMenuActive = false;
            for (Menu m : menuBarList) {
                if (Objects.equals(m.getParentMenuId(), parentMenu.getId())) {
                    if (equRequestUrl(m.getMenuUrl(), requestUrl)) {
                        parentMenu.setActive(1);
                        m.setActive(1);
                        parentMenuActive = true;
                    } else {
                        m.setActive(0);
                        if (!parentMenuActive) {
                            parentMenu.setActive(0);
                        }
                    }
                    menuList.add(m);
                }
            }
            return menuList;
        }
        return null;
    }




}
