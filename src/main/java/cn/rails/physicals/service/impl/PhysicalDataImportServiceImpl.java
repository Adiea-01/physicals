package cn.rails.physicals.service.impl;

import cn.rails.physicals.entity.AnnualManagement;
import cn.rails.physicals.entity.CheckupItem;
import cn.rails.physicals.entity.PhysicalReport;
import cn.rails.physicals.entity.PhysicalReportItem;
import cn.rails.physicals.exception.MarsException;
import cn.rails.physicals.mapper.AnnualManagementMapper;
import cn.rails.physicals.mapper.CheckupItemMapper;
import cn.rails.physicals.mapper.PhysicalReportItemMapper;
import cn.rails.physicals.mapper.PhysicalReportMapper;
import cn.rails.physicals.service.PhysicalDataImportService;
import cn.rails.physicals.util.RandomUtils;
import jxl.Cell;
import jxl.Sheet;
import jxl.Workbook;
import jxl.read.biff.BiffException;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.time.DateFormatUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @Description:
 * @Author: pan zhenghui
 * @Date: 2021/2/20 11:13
 */
@Slf4j
@Service
public class PhysicalDataImportServiceImpl implements PhysicalDataImportService {

    //获取配置文件中的指定文件存放位置
    @Value("${uploadFilePath}")
    private String uploadFilePath;

    //体检报告管理
    @Resource
    private PhysicalReportMapper physicalReportMapper;

    //体检报告数据
    @Resource
    private PhysicalReportItemMapper physicalReportItemMapper;

    //年份管理
    @Resource
    private AnnualManagementMapper annualManagementMapper;

    //体检项目
    @Resource
    private CheckupItemMapper checkupItemMapper;

    @Transactional
    @Override
    public void importPhysicalData(MultipartFile multipartFile) {
        //获取原始的文件名
        String originalFilename = multipartFile.getOriginalFilename();
        //判断如果不是excel文件的话，就不上传了
        if (!originalFilename.endsWith("xls")) {
            throw new MarsException("jxl只支持2003版之前的Excel格式");
        }
        //获取绝对路径
//      String filePath = getProjectRootPath();
        //指定文件存放位置
        String filePath = uploadFilePath;//指定存放位置/usr/local/
        //年月日加随机数路径
        String datePath = DateFormatUtils.format(System.currentTimeMillis(), "yyyyMMdd") + File.separator + RandomUtils.getRandom(100);
        //拼接路径:uploadFile\体检报告\20200714\27
        filePath = filePath + "uploadFile" + File.separator + "体检报告" + File.separator + datePath;
        /*
          File的两个参数：
          parent:绝对路径不包括文件名的（就是目录路径）
          child:文件名
         */
        File targetFile = new File(filePath, originalFilename);
        if (!targetFile.exists()) {
            targetFile.mkdirs();
        }
        Workbook workbook = null;
        try {
            //把上传的文件保存
            multipartFile.transferTo(targetFile);
            //使用jxl读取excel表中的数据
            workbook = Workbook.getWorkbook(targetFile);
            Sheet sheet = workbook.getSheet(0);
            //读取excel表中的数据写入到数据库


            int rowsCount = sheet.getRows();//总行数
            int columnsCount = sheet.getColumns();//总列数

            AnnualManagement annualManagement=annualManagementMapper.queryDefaultYear(1);

            Cell[] titleCells=sheet.getRow(0);
            PhysicalReport physicalReport = new PhysicalReport();
            PhysicalReportItem physicalReportItem = new PhysicalReportItem();

            for (int y = 1; y < rowsCount; y++) {
                Cell[] cells=sheet.getRow(y);

                for(int i=0;i<titleCells.length;i++){
                    String inspectionItem=titleCells[i].getContents();
                    String measuringData=cells[i].getContents();

                    System.out.println(titleCells[i].getContents());
                    System.out.println(cells[i].getContents());

                    if("身份证号".equals(inspectionItem)){
                        physicalReport.setIdentityCard(measuringData);
                    }else if("体检编号".equals(inspectionItem)){
                        physicalReport.setPhysicalNumber(measuringData);
                    }else if("客户编号".equals(inspectionItem)){
                        physicalReport.setCustomerId(measuringData);
                    }else if("体检日期".equals(inspectionItem)){
                        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
                        try {
                            physicalReport.setPhysicalDate(simpleDateFormat.parse(measuringData));
                        } catch (ParseException e) {
                            e.printStackTrace();
                        }
                    }else if("版本".equals(inspectionItem)){
                        physicalReport.setVersion(measuringData);
                    }

                    CheckupItem checkupItem=checkupItemMapper.querybyChineseName(inspectionItem);
                    if (checkupItem != null) {
                        if ("一般项目检查".equals(checkupItem.getClassification())) {
                            physicalReportItem.setItemType(1);
                        } else if ("血常规".equals(checkupItem.getClassification())) {
                            physicalReportItem.setItemType(2);
                        } else if ("尿常规".equals(checkupItem.getClassification())) {
                            physicalReportItem.setItemType(3);
                        } else if ("便隐血".equals(checkupItem.getClassification())) {
                            physicalReportItem.setItemType(4);
                        } else if ("实验室检查".equals(checkupItem.getClassification())) {
                            physicalReportItem.setItemType(5);
                        } else if ("性激素六项".equals(checkupItem.getClassification())) {
                            physicalReportItem.setItemType(6);
                        } else if ("内科".equals(checkupItem.getClassification())) {
                            physicalReportItem.setItemType(7);
                        } else if ("外科".equals(checkupItem.getClassification())) {
                            physicalReportItem.setItemType(8);
                        } else if ("妇科".equals(checkupItem.getClassification())) {
                            physicalReportItem.setItemType(9);
                        } else if ("眼科".equals(checkupItem.getClassification())) {
                            physicalReportItem.setItemType(10);
                        } else if ("耳鼻咽喉科".equals(checkupItem.getClassification())) {
                            physicalReportItem.setItemType(11);
                        } else if ("心电图室".equals(checkupItem.getClassification())) {
                            physicalReportItem.setItemType(12);
                        } else if ("超声检查室".equals(checkupItem.getClassification())) {
                            physicalReportItem.setItemType(13);
                        } else if ("骨密度检查室".equals(checkupItem.getClassification())) {
                            physicalReportItem.setItemType(14);
                        } else if ("放射科".equals(checkupItem.getClassification())) {
                            physicalReportItem.setItemType(15);
                        }
                        physicalReportItem.setUnit(checkupItem.getUnit());
                        physicalReportItem.setInspectionItem(inspectionItem);
                        physicalReportItem.setMeasuringResult(measuringData);
                    }

                }

                physicalReport.setCreateDate(new Date());
                physicalReport.setYearFlag(annualManagement.getYearUuid());
                //先讲数据插入到 体检报告管理表中
                physicalReportMapper.insert(physicalReport);

                //拿取体检报告管理表中得报告id，再插入到 体检报告数据表中
                physicalReportItem.setReportId(physicalReport.getId());
                physicalReportItemMapper.insert(physicalReportItem);


            }


        } catch (IOException e) {
            throw new MarsException("导入数据时，发生异常");
        } catch (BiffException e) {
            throw new MarsException("读取文件错误");
        } finally {
            //关闭连接，释放资源
            workbook.close();
        }
    }














}
