package cn.rails.physicals.service.impl;

import cn.rails.physicals.entity.Menu;
import cn.rails.physicals.entity.UserInfo;
import cn.rails.physicals.mapper.MenuMapper;
import cn.rails.physicals.service.MenuService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

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

    @Override
    public void loadMenuList(Object handler, HttpServletRequest request) {
        Object obj = request.getSession().getAttribute("userInfo");
        if (obj != null) {
            UserInfo userInfo = (UserInfo) obj;
            int superNum = userInfo.getIsSuper();
            List<Menu> menuList = null;
            if (superNum == 1) {
                menuList = menuMapper.queryMenuByCode("1");
            } else {
                menuList = menuMapper.queryMenuByCode("3");
            }
            request.setAttribute("menuList", menuList);
        }
    }
}
