package cn.rails.physicals.mapper;

import cn.rails.physicals.entity.CheckupItem;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface CheckupItemMapper extends BaseMapper<CheckupItem> {

    @Select("SELECT id,chinese_name,field_name,abbreviation,chinese_explain,classification,miximum,maximum,unit,reference_description FROM physical_checkup_item")
    List<CheckupItem> queryAll();

    @Select("SELECT id,chinese_name,field_name,abbreviation,chinese_explain,classification,miximum,maximum,unit,reference_description FROM physical_checkup_item WHERE chinese_name=#{chineseName}")
    CheckupItem querybyChineseName(@Param("chineseName") String chineseName);

}
