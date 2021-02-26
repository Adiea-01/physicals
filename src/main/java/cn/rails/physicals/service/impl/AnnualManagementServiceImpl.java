package cn.rails.physicals.service.impl;

import cn.rails.physicals.entity.AnnualManagement;
import cn.rails.physicals.enums.RespCode;
import cn.rails.physicals.exception.MarsException;
import cn.rails.physicals.mapper.AnnualManagementMapper;
import cn.rails.physicals.service.AnnualManagementService;
import cn.rails.physicals.vo.PageDataVo;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;
import java.util.UUID;

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

    @Transactional
    @Override
    public int addYear(AnnualManagement annualManagement) {
        String year = annualManagement.getYear();
        String uuid = UUID.randomUUID().toString().replaceAll("-", "");
        int result = 0;
        if (StringUtils.isNotBlank(year)) {
            int count = annualManagementMapper.selectCount(new QueryWrapper<AnnualManagement>().eq("year", year));
            if (count > 0) {
                throw new MarsException("年份已存在，请重新输入");
            }
            annualManagement.setYearUuid(uuid);
            annualManagement.setCreateDate(new Date());
            result = annualManagementMapper.insert(annualManagement);
        }
        return result;
    }

    @Override
    public AnnualManagement queryYearById(Long id) {
        AnnualManagement annualManagement=annualManagementMapper.selectById(id);
        return annualManagement;
    }

    @Transactional
    @Override
    public int updateYear(AnnualManagement annualManagement) {
        int count = annualManagementMapper.updateById(annualManagement);
        if (count < 0) {
            throw new MarsException(RespCode.UPDATE_ERROR);
        }
        return count;
    }

    @Transactional
    @Override
    public int updateYearDelFlag(Long id, int delFlag) {
        int count = annualManagementMapper.updateYearDelFlag(id, delFlag);
        if (count < 0) {
            throw new MarsException(RespCode.ENABLE_STATUS_ERROR);
        }
        return count;
    }

    @Transactional
    @Override
    public int updateDefaultYear(Long id) {
        int resCount = 0;
        //先讲所有的年份设置成0
        int count = annualManagementMapper.updateDefaultYearAll(0);
        if (count < 0) {
            throw new MarsException("默认年份修改失败");
        }
        //再将当前id的年份设置成默认年
        resCount = annualManagementMapper.updateDefaultYear(id, 1);
        if (resCount < 0) {
            throw new MarsException("默认年份修改失败");
        }
        return resCount;
    }
}
