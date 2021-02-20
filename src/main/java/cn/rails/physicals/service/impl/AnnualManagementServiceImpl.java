package cn.rails.physicals.service.impl;

import cn.rails.physicals.entity.AnnualManagement;
import cn.rails.physicals.mapper.AnnualManagementMapper;
import cn.rails.physicals.service.AnnualManagementService;
import cn.rails.physicals.vo.PageDataVo;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @Description: 年份管理
 * @Author: pan zhenghui
 * @Date: 2021/2/19 14:47
 */
@Slf4j
@Service
public class AnnualManagementServiceImpl implements AnnualManagementService {

    @Resource
    private AnnualManagementMapper annualManagementMapper;

    @Override
    public PageDataVo<AnnualManagement> queryAll(Integer start, Integer length) {
        Page page = PageHelper.startPage((start / length) + 1, length);
        List<AnnualManagement> annualManagementList = annualManagementMapper.queryAll();
        PageDataVo<AnnualManagement> pageData = new PageDataVo<>();
        pageData.setData(annualManagementList);
        pageData.setITotal(page.getTotal());
        pageData.setITotalDisplayRecords(page.getTotal());
        pageData.setFnRecordsTotal(page.getTotal());
        return pageData;
    }
}
