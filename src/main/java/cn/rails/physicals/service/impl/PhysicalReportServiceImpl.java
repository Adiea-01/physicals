package cn.rails.physicals.service.impl;

import cn.rails.physicals.entity.PhysicalReport;
import cn.rails.physicals.mapper.PhysicalReportMapper;
import cn.rails.physicals.service.PhysicalReportService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * @Description:
 * @Author: pan zhenghui
 * @Date: 2021/2/20 11:02
 */
@Slf4j
@Service
public class PhysicalReportServiceImpl implements PhysicalReportService {

    @Resource
    private PhysicalReportMapper physicalReportMapper;


}
