package cn.rails.physicals.entity;

import com.baomidou.mybatisplus.annotation.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 * @Description: 体检报告管理表
 * @Author: pan zhenghui
 * @Date: 2021/2/20 10:31
 */
@TableName("physical_report")
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class PhysicalReport {

    //自增id
    @TableId(type = IdType.AUTO)
    private Long id;

    //身份证号
    @TableField(value = "identity_card")
    private String identityCard;

    //体检编号
    @TableField(value = "physical_number")
    private String physicalNumber;

    //客户编号
    @TableField(value = "customer_id")
    private String customerId;

    //体检时间
    @TableField(value = "physical_date", fill = FieldFill.INSERT)
    private Date physicalDate;

    //版本
    @TableField(value = "version")
    private String version;

    //备注
    @TableField(value = "remark")
    private String remark;

    //创建时间
    @TableField(value = "create_date", fill = FieldFill.INSERT)
    private Date createDate;

    //年份标识
    @TableField(value = "year_flag")
    private String yearFlag;


}
