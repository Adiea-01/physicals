package cn.rails.physicals.mapper;

import cn.rails.physicals.entity.Menu;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface MenuMapper extends BaseMapper<Menu> {

    @Select("SELECT id,menu_name,menu_level,menu_url,parent_menu_id,priority,`code`,create_id,create_date,del_flag FROM system_menu " +
            "WHERE `code` = #{code} OR `code` IS NULL")
    List<Menu> queryMenuByCode(@Param("code")String code);

}
