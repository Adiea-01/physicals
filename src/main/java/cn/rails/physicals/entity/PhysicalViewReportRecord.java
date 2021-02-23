package cn.rails.physicals.entity;

import com.baomidou.mybatisplus.annotation.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 * @Description: 体检报告查看记录表
 * @Author: pan zhenghui
 * @Date: 2021/2/20 10:31
 */
@TableName("physical_view_report_record")
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class PhysicalViewReportRecord {

    //自增id
    @TableId(type = IdType.AUTO)
    private Long id;

    //报告id
    @TableField(value = "report_id")
    private Long reportId;

    //身份证号
    @TableField(value = "identity_card")
    private String identityCard;

    //是否已查看 0：未查看；1：已查看
    @TableField(value = "view")
    private int view;

    //查看日期
    @TableField(value = "view_date")
    private Date viewDate;

    //创建日期
    @TableField(value = "create_date", fill = FieldFill.INSERT)
    private Date createDate;


}
