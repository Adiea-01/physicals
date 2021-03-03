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
    @Select("SELECT pr.id AS id,sui.identity_card AS identityCard,sui.real_name AS realName,sui.department AS department,sui.gender AS gender,pam.`year` AS year FROM system_user_info sui " +
            "LEFT JOIN physical_report pr ON sui.identity_card = pr.identity_card " +
            "LEFT JOIN physical_annual_management pam ON pr.year_flag = pam.year_uuid " +
            "WHERE sui.id = #{id} AND sui.del_flag=0")
    List<Map<String, Object>> queryReportList(@Param("id") Long id);


    //查询用户体检基础信息
    @Select("SELECT pr.id AS id,pr.physical_number AS physicalNumber,pr.physical_date AS physicalDate,sui.identity_card AS identityCard,sui.real_name AS realName,sui.department AS department,sui.gender AS gender,sui.phone AS phone FROM system_user_info sui " +
            "LEFT JOIN physical_report pr ON sui.identity_card = pr.identity_card " +
            "WHERE pr.id = #{id}")
    Map<String, Object> queryUserMedicalExaminationReportByInfo(@Param("id") Long id);

    //查询用户的体检数据详情
    @Select("SELECT pri.id AS id,pri.inspection_item AS inspectionItem,pri.measuring_result AS measuringResult,pci.classification AS classification,pci.miximum AS miximum,pci.maximum AS maximum,pci.unit AS unit,pci.abbreviation AS abbreviation FROM physical_report pr " +
            "LEFT JOIN physical_report_item pri ON pr.id = pri.report_id " +
            "LEFT JOIN physical_checkup_item pci ON pri.inspection_item = pci.chinese_name " +
            "WHERE pr.identity_card = #{identityCard}")
    List<Map<String, Object>> queryUserMedicalExaminationReport(@Param("identityCard") String identityCard);


}
