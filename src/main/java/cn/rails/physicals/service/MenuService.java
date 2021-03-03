package cn.rails.physicals.service;

import javax.servlet.http.HttpServletRequest;

public interface MenuService {

    void loadMenuList(Object handler, HttpServletRequest request);
}
