package cn.rails.physicals.entity;

import com.baomidou.mybatisplus.annotation.FieldFill;
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
@TableName("system_user_info")
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class UserInfo extends BaseEntity {

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


    //备注（其他）
    @TableField(value = "user_remark")
    private String userRemark;

    //权限管理：1：系统管理  2：普通管理员 3：普通员工
    @TableField(value = "is_super")
    private int isSuper;

}
