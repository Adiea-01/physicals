package cn.rails.physicals.service.impl;

import cn.rails.physicals.entity.CheckupItem;
import cn.rails.physicals.enums.RespCode;
import cn.rails.physicals.exception.MarsException;
import cn.rails.physicals.mapper.CheckupItemMapper;
import cn.rails.physicals.service.CheckupItemService;
import cn.rails.physicals.vo.PageDataVo;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * @Description: 体检检查项目
 * @Author: pan zhenghui
 * @Date: 2021/2/19 9:40
 */
@Slf4j
@Service
public class CheckupItemServiceImpl implements CheckupItemService {

    @Resource
    private CheckupItemMapper checkupItemMapper;

    /**
     * @description: 查询体检项目列表
     * @return:
     * @author: pan zhenghui
     * @time: 2021/2/19 9:45
     */
    @Override
    public PageDataVo<CheckupItem> queryAll(Integer start, Integer length) {
        Page page = PageHelper.startPage((start / length) + 1, length);
        List<CheckupItem> checkupItemList = checkupItemMapper.queryAll();
        PageDataVo<CheckupItem> pageData = new PageDataVo<>();
        pageData.setData(checkupItemList);
        pageData.setITotal(page.getTotal());
        pageData.setITotalDisplayRecords(page.getTotal());
        pageData.setFnRecordsTotal(page.getTotal());
        return pageData;
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public int addCheckupItem(CheckupItem checkupItem) {
        String chineseName = checkupItem.getChineseName();
        String classification = checkupItem.getClassification();
        int result = 0;
        if (StringUtils.isNotBlank(chineseName) &&
                StringUtils.isNotBlank(classification)) {
            int count = checkupItemMapper.selectCount(new QueryWrapper<CheckupItem>().eq("chinese_name", chineseName));
            if (count > 0) {
                throw new MarsException("项目名称已存在，请重新输入");
            }
            result = checkupItemMapper.insert(checkupItem);
        }
        return result;
    }

    @Override
    public CheckupItem queryCheckupItemById(Long id) {
        return checkupItemMapper.selectById(id);
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public int updateCheckupItem(CheckupItem checkupItem) {
        int count = checkupItemMapper.updateById(checkupItem);
        if (count < 0) {
            throw new MarsException(RespCode.UPDATE_ERROR);
        }
        return count;
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public int updateCheckupItemDelFlag(Long id,int delFlag) {
        int count = checkupItemMapper.updateCheckupItemDelFlag(id, delFlag);
        if (count < 0) {
            throw new MarsException(RespCode.ENABLE_STATUS_ERROR);
        }
        return count;
    }
}
