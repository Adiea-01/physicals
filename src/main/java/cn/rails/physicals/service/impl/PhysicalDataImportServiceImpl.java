package cn.rails.physicals.service.impl;

import cn.rails.physicals.entity.*;
import cn.rails.physicals.exception.MarsException;
import cn.rails.physicals.mapper.*;
import cn.rails.physicals.service.PhysicalDataImportService;
import cn.rails.physicals.util.RandomUtils;
import jxl.Cell;
import jxl.Sheet;
import jxl.Workbook;
import jxl.read.biff.BiffException;
import jxl.read.biff.WorkbookParser;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.time.DateFormatUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @Description: 体检数据导入
 * @Author: pan zhenghui
 * @Date: 2021/2/20 11:13
 */
@Slf4j
@Service
public class PhysicalDataImportServiceImpl implements PhysicalDataImportService {

    //获取配置文件中的指定文件存放位置
    @Value("${uploadFilePath}")
    private String uploadFilePath;

    @Resource
    private UserMapper userMapper;

    //体检报告管理
    @Resource
    private PhysicalReportMapper physicalReportMapper;

    //体检报告数据
    @Resource
    private PhysicalReportItemMapper physicalReportItemMapper;

    //体检报告查看记录表
    @Resource
    private PhysicalViewReportRecordMapper physicalViewReportRecordMapper;

    //年份管理
    @Resource
    private AnnualManagementMapper annualManagementMapper;

    //体检项目
    @Resource
    private CheckupItemMapper checkupItemMapper;

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void importPhysicalData(MultipartFile multipartFile) throws IOException {
        //获取原始的文件名
        String originalFilename = multipartFile.getOriginalFilename();
        //判断如果不是excel文件的话，就不上传了
        if (!originalFilename.endsWith("xls")) {
            throw new MarsException("jxl只支持2003版之前的Excel格式");
        }
        //获取绝对路径
//      String filePath = getProjectRootPath();
        //指定文件存放位置
//        String filePath = uploadFilePath;//指定存放位置/usr/local/
//        //年月日加随机数路径
//        String datePath = DateFormatUtils.format(System.currentTimeMillis(), "yyyyMMdd") + File.separator + RandomUtils.getRandom(100);
//        //拼接路径:uploadFile\体检报告\20200714\27
//        filePath = filePath + "uploadFile" + File.separator + "体检报告" + File.separator + datePath;
        /*
          File的两个参数：
          parent:绝对路径不包括文件名的（就是目录路径）
          child:文件名
         */
//        File targetFile = new File(filePath, originalFilename);
//        if (targetFile.exists()) {
//            throw new MarsException("目录已存在");
////            targetFile.mkdirs();
//        }




        Workbook workbook = null;
        InputStream inputStream = multipartFile.getInputStream();
        try {
             workbook = WorkbookParser.getWorkbook(inputStream);
            Sheet sheet = workbook.getSheet(0);
            //读取excel表中的数据写入到数据库
            int rowsCount = sheet.getRows();//总行数
            int columnsCount = sheet.getColumns();//总列数
            AnnualManagement annualManagement = annualManagementMapper.queryDefaultYear(1);
            //先获取title行
            Cell[] titleCells = sheet.getRow(0);
            //遍历除title外的其他数据
            for (int y = 1; y < rowsCount; y++) {
                Cell[] cells = sheet.getRow(y);

                //固定excel前面9列的参数title，保存到用户表和体检管理表中
                String deptT = titleCells[0].getContents();
                String dept = cells[0].getContents();//部门
                String subDept = cells[1].getContents();//二级部门
                String userName = cells[2].getContents();//真实姓名
                String identityCard = cells[3].getContents();//身份证号
                String customerId = cells[4].getContents();//客户编号
                String physicalNumber = cells[5].getContents();//体检编号
                String phone = cells[6].getContents();//手机号
                String gender = cells[7].getContents();//性别
                String physicalDate = cells[8].getContents();//体检日期

                if ("男".equals(gender)) {
                    gender = "1";
                } else {
                    gender = "0";
                }
                //通过身份证号查询，用户表中是否有该用户，如果没有该用户，则添加该用户到数据表中
                if (StringUtils.isNotBlank(identityCard)) {
                    UserInfo userInfo = userMapper.queryByIdentityCard(identityCard);
                    if (userInfo == null) {
                        UserInfo userInfo1 = UserInfo.builder()
                                .realName(userName)
                                .identityCard(identityCard)
                                .phone(phone)
                                .gender(gender)
                                .department(dept)
                                .subDepartment(subDept)
                                .isSuper(3)
                                .build();
                        userMapper.insert(userInfo1);
                    }
                }

                //再将数据插入到 体检报告管理表中
                SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
                PhysicalReport physicalReport = PhysicalReport.builder()
                        .identityCard(identityCard)
                        .physicalNumber(physicalNumber)
                        .customerId(customerId)
                        .physicalDate(simpleDateFormat.parse(physicalDate))
                        .createDate(new Date())
                        .yearFlag(annualManagement.getYearUuid())
                        .build();
                physicalReportMapper.insert(physicalReport);

                //遍历除固定的那几列数据，插入到体检报告数据表中
                for (int i = 9; i < titleCells.length; i++) {
                    String inspectionItem = titleCells[i].getContents();
                    String measuringData = cells[i].getContents();
//                    System.out.println(titleCells[i].getContents());
//                    System.out.println(cells[i].getContents());

                    //查询该体检项目是否是对应的体检类型
                    CheckupItem checkupItem = checkupItemMapper.querybyChineseName(inspectionItem);
                    PhysicalReportItem physicalReportItem = new PhysicalReportItem();
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
                        //拿取体检报告管理表中得报告id，再插入到 体检报告数据表中
                        physicalReportItem.setReportId(physicalReport.getId());
                        physicalReportItem.setInspectionItem(inspectionItem);
                        physicalReportItem.setMeasuringResult(measuringData);
                        physicalReportItem.setUnit(checkupItem.getUnit());
                        physicalReportItemMapper.insert(physicalReportItem);
                    }
                }

                //拿取体检报告管理表中得报告id，再插入到 体检报告查看记录表
                PhysicalViewReportRecord physicalViewReportRecord = PhysicalViewReportRecord.builder()
                        .reportId(physicalReport.getId())
                        .identityCard(identityCard)
                        .view(0)
                        .createDate(new Date())
                        .build();
                physicalViewReportRecordMapper.insert(physicalViewReportRecord);
            }
//        } catch (IOException e) {
//            log.error("file save",e);
//            throw new MarsException("导入数据时，发生异常");
        } catch (BiffException bi) {
            log.error("file read",bi);
            throw new MarsException("读取文件错误");
        } catch (ParseException parse) {
            log.error("date",parse);
            throw new MarsException("日期转换失败");
        } finally {
            //关闭连接，释放资源
            if (workbook != null) {
                workbook.close();
            }
        }
    }


}
