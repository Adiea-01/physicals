package cn.rails.physicals.mapper;

import cn.rails.physicals.entity.PhysicalReport;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Map;

@Mapper
public interface PhysicalReportMapper extends BaseMapper<PhysicalReport> {

    //查询用户有几年的体检报告列表
    @Select("SELECT pr.id AS id,sui.identity_card AS identityCard,sui.real_name AS realName,sui.department AS department,sui.gender AS gender,pam.`year` AS year FROM system_user_info sui\n" +
            "LEFT JOIN physical_report pr ON sui.identity_card=pr.identity_card\n" +
            "LEFT JOIN physical_annual_management pam ON pr.year_flag=pam.year_uuid\n" +
            "WHERE sui.id=#{id}")
    List<Map<String, Object>> queryReportList(@Param("id")Long id);


//    //查询用户的体检数据详情
//    @Select("SELECT pr.id AS id,pr.physical_number AS physicalNumber,pr.physical_date AS physicalDate,sui.identity_card AS identityCard,sui.real_name AS realName,sui.department AS department,sui.gender AS gender,pri.inspection_item AS inspectionItem,pri.measuring_result AS measuringResult,pci.classification AS classification,pci.miximum AS miximum,pci.maximum AS maximum, pci.unit AS unit,pci.abbreviation AS abbreviation FROM system_user_info sui \n" +
//            "LEFT JOIN physical_report pr ON sui.identity_card=pr.identity_card\n" +
//            "LEFT JOIN physical_report_item pri ON pr.id=pri.report_id\n" +
//            "LEFT JOIN physical_checkup_item pci ON pri.inspection_item=pci.chinese_name\n" +
//            "GROUP BY inspectionItem,measuringResult\n" +
//            "HAVING pr.id=#{id}")
//    List<Map<String, Object>> queryUserMedicalExaminationReport1(@Param("id")Long id);


    //查询用户体检基础信息
    @Select("SELECT\n" +
            "\tpr.id AS id,\n" +
            "\tpr.physical_number AS physicalNumber,\n" +
            "\tpr.physical_date AS physicalDate,\n" +
            "\tsui.identity_card AS identityCard,\n" +
            "\tsui.real_name AS realName,\n" +
            "\tsui.department AS department,\n" +
            "\tsui.gender AS gender,\n" +
            "\tsui.phone AS phone \n" +
            "FROM\n" +
            "\tsystem_user_info sui\n" +
            "\tLEFT JOIN physical_report pr ON sui.identity_card = pr.identity_card \n" +
            "WHERE\n" +
            "\tpr.id = #{id}")
    Map<String, Object> queryUserMedicalExaminationReportByInfo(@Param("id")Long id);



    //查询用户的体检数据详情
    @Select("SELECT\n" +
            "\tpri.id AS id,\n" +
            "\tpri.inspection_item AS inspectionItem,\n" +
            "\tpri.measuring_result AS measuringResult,\n" +
            "\tpci.classification AS classification,\n" +
            "\tpci.miximum AS miximum,\n" +
            "\tpci.maximum AS maximum,\n" +
            "\tpci.unit AS unit,\n" +
            "\tpci.abbreviation AS abbreviation \n" +
            "FROM\n" +
            "\tphysical_report pr\n" +
            "\tLEFT JOIN physical_report_item pri ON pr.id = pri.report_id\n" +
            "\tLEFT JOIN physical_checkup_item pci ON pri.inspection_item = pci.chinese_name \n" +
            "WHERE\n" +
            "\tpr.identity_card = #{identityCard}")
    List<Map<String, Object>> queryUserMedicalExaminationReport(@Param("identityCard")String identityCard);



}
