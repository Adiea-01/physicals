package cn.rails.physicals.service.impl;

import cn.rails.physicals.entity.CheckupItem;
import cn.rails.physicals.mapper.PhysicalReportMapper;
import cn.rails.physicals.mapper.PhysicalViewReportRecordMapper;
import cn.rails.physicals.service.PhysicalReportService;
import cn.rails.physicals.vo.PageDataVo;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * @Description: 体检报告查看
 * @Author: pan zhenghui
 * @Date: 2021/2/20 11:02
 */
@Slf4j
@Service
public class PhysicalReportServiceImpl implements PhysicalReportService {

    @Resource
    private PhysicalReportMapper physicalReportMapper;

    //体检报告查看记录表
    @Resource
    private PhysicalViewReportRecordMapper physicalViewReportRecordMapper;

    @Override
    public PageDataVo<Map<String, Object>> queryViewReportAll(Integer start, Integer length) {
        Page page = PageHelper.startPage((start / length) + 1, length);
        List<Map<String,Object>> mapList=physicalViewReportRecordMapper.queryViewReportAll();
        PageDataVo<Map<String,Object>> pageData = new PageDataVo<>();
        pageData.setData(mapList);
        pageData.setITotal(page.getTotal());
        pageData.setITotalDisplayRecords(page.getTotal());
        pageData.setFnRecordsTotal(page.getTotal());
        return pageData;
    }
}
