package cn.rails.physicals.mapper;

import cn.rails.physicals.entity.AnnualManagement;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

@Mapper
public interface AnnualManagementMapper extends BaseMapper<AnnualManagement> {

    @Select("SELECT id,year,year_uuid,year_flag,create_date,del_flag FROM physical_annual_management")
    List<AnnualManagement> queryAll();

    @Select("SELECT id,`year`,year_uuid,year_flag,create_date,del_flag FROM physical_annual_management WHERE year_flag=#{yearFlag}")
    AnnualManagement queryDefaultYear(@Param("yearFlag") int yearFlag);

    @Update("UPDATE physical_annual_management SET del_flag=#{delFlag} WHERE id=#{id}")
    int updateYearDelFlag(@Param("id")Long id, @Param("delFlag")int delFlag);

    @Update("UPDATE physical_annual_management SET year_flag=#{yearFlag} WHERE id=#{id}")
    int updateDefaultYear(@Param("id")Long id, @Param("yearFlag")int yearFlag);

    @Update("UPDATE physical_annual_management SET year_flag=#{yearFlag}")
    int updateDefaultYearAll(@Param("yearFlag")int yearFlag);

}
