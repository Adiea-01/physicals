package cn.rails.physicals.service;

import cn.rails.physicals.entity.AnnualManagement;
import cn.rails.physicals.entity.UserInfo;
import cn.rails.physicals.vo.PageDataVo;

public interface AnnualManagementService {
    /**
     * @description: 查询年份列表
     * @return:
     * @author: pan zhenghui
     * @time: 2021/2/19 9:44
     */
    PageDataVo<AnnualManagement> queryAll(Integer start, Integer length);

    int addYear(AnnualManagement annualManagement);

    AnnualManagement queryYearById(Long id);

    int updateYear(AnnualManagement annualManagement);

    int deleteYearById(Long id);

}
