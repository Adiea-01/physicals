package cn.rails.physicals.sysuser.mapper;

import cn.rails.physicals.sysuser.entity.UserInfo;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;

import java.util.Date;

@Mapper
public interface UserMapper extends BaseMapper<UserInfo> {

    @Update("UPDATE SYSTEM_USER_INFO SET last_login_time=#{lastLoginTime} WHERE id=#{id}")
    int updateLastLoginTime(@Param("id") Long id, @Param("lastLoginTime") Date timestamp);

}
