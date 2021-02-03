package cn.rails.physicals.sysuser.entity;

import com.baomidou.mybatisplus.annotation.SqlCondition;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 * @Description: 用户实体
 * @Author: pan zhenghui
 * @Date: 2021/1/25 9:29
 */
@TableName("user_info")
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class UserInfo extends BaseEntity {

    //用户名
    @TableField(value = "username",condition = SqlCondition.LIKE)
    private String username;

    //真实姓名
    @TableField(value = "real_name",condition = SqlCondition.LIKE)
    private String realName;

    //身份证号
    @TableField(value = "identity_card")
    private String identityCard;

    //工号
    @TableField(value = "job_number")
    private String jobNumber;

    //手机号
    @TableField(value = "phone")
    private String phone;

    //密码
    @TableField(value = "password")
    private String password;

    //盐
    @TableField(value = "salt")
    private String salt;

    //如果第一次登录状态是0，则提示修改密码
    @TableField(value = "pwd_status")
    private String pwdStatus;

    //性别
    @TableField(value = "gender")
    private String gender;

    //最后登录时间
    @TableField(value = "last_login_time")
    private Date lastLoginTime;

    //部门
    @TableField(value = "department")
    private String department;

    //子部门
    @TableField(value = "sub_department")
    private String subDepartment;

    //跟体检报告表中的pu_userUuid关联
    @TableField(value = "userUuid")
    private String userUuid;

    //版本（密码初始化次数）
    @TableField(value = "version")
    private Integer version;

    //备注（其他）
    @TableField(value = "remark")
    private String remark;


}
