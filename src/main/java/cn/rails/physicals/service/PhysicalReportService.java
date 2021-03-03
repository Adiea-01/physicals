package cn.rails.physicals.service;

import cn.rails.physicals.vo.PageDataVo;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

public interface PhysicalReportService {

    PageDataVo<Map<String,Object>> queryViewReportAll(Integer start, Integer length);

    //用户报告查询结果
    PageDataVo<Map<String,Object>> queryReportList(HttpServletRequest request,Integer start, Integer length);

    Map<String,Object> queryUserMedicalExaminationReport(HttpServletRequest request,Long id);

    void reportDownload(Long id);


}
