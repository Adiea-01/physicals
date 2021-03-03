package cn.rails.physicals.service.impl;

import cn.rails.physicals.mapper.PhysicalReportMapper;
import cn.rails.physicals.mapper.PhysicalViewReportRecordMapper;
import cn.rails.physicals.service.PhysicalReportService;
import cn.rails.physicals.util.PdfUtil;
import cn.rails.physicals.util.PrintUtil;
import cn.rails.physicals.vo.PageDataVo;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.HashMap;
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

    @Autowired
    private Environment environment;
    @Autowired
    private HttpServletRequest request;

    @Resource
    private PhysicalReportMapper physicalReportMapper;

    //体检报告查看记录表
    @Resource
    private PhysicalViewReportRecordMapper physicalViewReportRecordMapper;

    @Override
    public PageDataVo<Map<String, Object>> queryViewReportAll(Integer start, Integer length) {
        Page page = PageHelper.startPage((start / length) + 1, length);
        List<Map<String, Object>> mapList = physicalViewReportRecordMapper.queryViewReportAll();
        PageDataVo<Map<String, Object>> pageData = new PageDataVo<>();
        pageData.setData(mapList);
        pageData.setITotal(page.getTotal());
        pageData.setITotalDisplayRecords(page.getTotal());
        pageData.setFnRecordsTotal(page.getTotal());
        return pageData;
    }

    @Override
    public PageDataVo<Map<String, Object>> queryReportList(HttpServletRequest request, Integer start, Integer length) {
        Object us = request.getAttribute("userInfo");
        Long id = Long.valueOf("3");
        Page page = PageHelper.startPage((start / length) + 1, length);
        List<Map<String, Object>> mapList = physicalReportMapper.queryReportList(id);
        PageDataVo<Map<String, Object>> pageData = new PageDataVo<>();
        pageData.setData(mapList);
        pageData.setITotal(page.getTotal());
        pageData.setITotalDisplayRecords(page.getTotal());
        pageData.setFnRecordsTotal(page.getTotal());
        return pageData;
    }

    @Override
    public Map<String, Object> queryUserMedicalExaminationReport(HttpServletRequest request, Long id) {
        Map<String, Object> map = new HashMap<>();
        Map<String, Object> resultMap = physicalReportMapper.queryUserMedicalExaminationReportByInfo(id);
        Object obj = resultMap.get("identityCard");
        if (obj != null) {
            String identityCard = obj.toString();
            List<Map<String, Object>> mapList = physicalReportMapper.queryUserMedicalExaminationReport(identityCard);
            map.put("userInfo", resultMap);
            map.put("reportInfo", mapList);
        }
        return map;
    }


    @Override
    public void reportDownload(Long id) {
        String printName = "Tj123";
        String tempFilePath ="D:\\pro2";
        String path = url(request);
        path=path+"/report/viewDetailsJump?id="+id;
        String fileName = tempFilePath+ File.separator+"体检报告.pdf";
        try {
            PdfUtil.createPdfDownload(new URL(path),fileName);
        } catch (MalformedURLException e) {
            e.printStackTrace();
        }
        PrintUtil.PDFPrint(fileName,printName);
    }
    public String url(HttpServletRequest request){
        String path = request.getContextPath();
        return request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
    }


















}
