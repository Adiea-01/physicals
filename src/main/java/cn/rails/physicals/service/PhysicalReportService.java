package cn.rails.physicals.service;

import cn.rails.physicals.vo.PageDataVo;
import org.apache.tools.ant.taskdefs.condition.Http;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

public interface PhysicalReportService {

    PageDataVo<Map<String,Object>> queryViewReportAll(Integer start, Integer length, HttpServletRequest request);

    //用户报告查询结果
    PageDataVo<Map<String,Object>> queryReportList(HttpServletRequest request,Integer start, Integer length);

    Map<String,Object> queryUserMedicalExaminationReport(HttpServletRequest request,Long id);

    void reportDownload(Long id);


}
