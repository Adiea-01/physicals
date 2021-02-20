package cn.rails.physicals.mapper;

import cn.rails.physicals.entity.AnnualManagement;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface AnnualManagementMapper extends BaseMapper<AnnualManagement> {

    @Select("SELECT id,year,year_uuid,year_flag,create_date FROM physical_annual_management")
    List<AnnualManagement> queryAll();

    @Select("SELECT id,`year`,year_uuid,year_flag,create_date FROM physical_annual_management WHERE year_flag=#{yearFlag}")
    AnnualManagement queryDefaultYear(@Param("yearFlag") int yearFlag);

}
