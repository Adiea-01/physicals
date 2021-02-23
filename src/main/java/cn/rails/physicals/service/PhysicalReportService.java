package cn.rails.physicals.service;

import cn.rails.physicals.vo.PageDataVo;

import java.util.Map;

public interface PhysicalReportService {

    PageDataVo<Map<String,Object>> queryViewReportAll(Integer start, Integer length);

}
