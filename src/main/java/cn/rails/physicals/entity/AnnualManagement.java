package cn.rails.physicals.entity;

import com.baomidou.mybatisplus.annotation.SqlCondition;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @Description:
 * @Author: pan zhenghui
 * @Date: 2021/2/19 14:34
 */
@TableName("physical_annual_management")
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class AnnualManagement extends BaseEntity{

    //年份
    @TableField(value = "year",condition = SqlCondition.LIKE)
    private String year;

    //年uuid
    @TableField(value = "year_uuid")
    private String yearUuid;

    //当前年（默认当前年份是1）
    @TableField(value = "year_flag")
    private int yearFlag;

}
