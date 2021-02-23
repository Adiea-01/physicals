package cn.rails.physicals.service;

import cn.rails.physicals.entity.CheckupItem;
import cn.rails.physicals.entity.UserInfo;
import cn.rails.physicals.vo.PageDataVo;

public interface CheckupItemService {

    /**
     * @description: 查询体检项目列表
     * @return:
     * @author: pan zhenghui
     * @time: 2021/2/19 9:44
     */
    PageDataVo<CheckupItem> queryAll(Integer start, Integer length);


    int addCheckupItem(CheckupItem checkupItem);

    CheckupItem queryCheckupItemById(Long id);

    int updateCheckupItem(CheckupItem checkupItem);

    int deleteCheckupItemById(Long id);

}
