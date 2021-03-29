package cn.rails.physicals.service;

import cn.rails.physicals.entity.CheckupItem;
import cn.rails.physicals.entity.UserInfo;
import cn.rails.physicals.vo.PageDataVo;

import javax.servlet.http.HttpServletRequest;

public interface CheckupItemService {

    /**
     * @description: 查询体检项目列表
     * @return:
     * @author: pan zhenghui
     * @time: 2021/2/19 9:44
     */
    PageDataVo<CheckupItem> queryAll(Integer start, Integer length, HttpServletRequest request);

    int addCheckupItem(CheckupItem checkupItem);

    CheckupItem queryCheckupItemById(Long id);

    int updateCheckupItem(CheckupItem checkupItem);

    int updateCheckupItemDelFlag(Long id,int delFlag);

}
