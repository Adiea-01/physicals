package cn.rails.physicals.mapper;

import cn.rails.physicals.entity.UserInfo;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.Date;
import java.util.List;

@Mapper
public interface UserMapper extends BaseMapper<UserInfo> {

    @Update("UPDATE SYSTEM_USER_INFO SET last_login_time=#{lastLoginTime} WHERE id=#{id}")
    int updateLastLoginTime(@Param("id") Long id, @Param("lastLoginTime") Date timestamp);

    List<UserInfo> queryAll(@Param("realName") String realName);

    @Select("SELECT id,real_name,identity_card,job_number,phone,gender,department,sub_department FROM system_user_info WHERE identity_card=#{identityCard}")
    UserInfo queryByIdentityCard(@Param("identityCard")String identityCard);

    @Update("UPDATE system_user_info SET del_flag=#{delFlag} WHERE id=#{id}")
    int updateUserInfoDelFlag(@Param("id")Long id, @Param("delFlag")int delFlag);

    @Select("SELECT * FROM system_user_info")
    List<UserInfo> selectAll();

}
