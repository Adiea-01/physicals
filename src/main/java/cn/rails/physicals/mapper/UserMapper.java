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

    @Select("SELECT id,real_name,identity_card,job_number,phone,gender,department,last_login_time,del_flag FROM system_user_info")
    List<UserInfo> queryAll();

    @Select("SELECT id,real_name,identity_card,job_number,phone,gender,department,sub_department FROM system_user_info WHERE identity_card=#{identityCard}")
    UserInfo queryByIdentityCard(@Param("identityCard")String identityCard);

    List<UserInfo> searchUserInfoList(UserInfo userInfo);

}
