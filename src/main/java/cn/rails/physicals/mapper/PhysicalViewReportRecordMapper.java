package cn.rails.physicals.mapper;

import cn.rails.physicals.entity.PhysicalViewReportRecord;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

@Mapper
public interface PhysicalViewReportRecordMapper extends BaseMapper<PhysicalViewReportRecord> {

    List<Map<String, Object>> queryViewReportAll();

}
