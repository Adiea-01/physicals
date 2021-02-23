package cn.rails.physicals.mapper;

import cn.rails.physicals.entity.PhysicalViewReportRecord;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Map;

@Mapper
public interface PhysicalViewReportRecordMapper extends BaseMapper<PhysicalViewReportRecord> {

    @Select("SELECT pvrr.id AS id,ui.real_name AS realName,ui.identity_card AS identityCard,ui.job_number AS jobNumber,ui.department AS department,pvrr.`view` AS view FROM system_user_info ui\n" +
            "LEFT JOIN physical_report pr ON ui.identity_card=pr.identity_card\n" +
            "LEFT JOIN physical_view_report_record pvrr ON pr.id=pvrr.report_id")
    List<Map<String, Object>> queryViewReportAll();

}
