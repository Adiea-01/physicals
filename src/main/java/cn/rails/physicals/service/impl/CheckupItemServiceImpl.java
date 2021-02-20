package cn.rails.physicals.service.impl;

import cn.rails.physicals.entity.CheckupItem;
import cn.rails.physicals.mapper.CheckupItemMapper;
import cn.rails.physicals.service.CheckupItemService;
import cn.rails.physicals.vo.PageDataVo;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

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





}
