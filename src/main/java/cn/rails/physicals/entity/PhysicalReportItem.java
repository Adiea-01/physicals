package cn.rails.physicals.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @Description: 体检报告数据表
 * @Author: pan zhenghui
 * @Date: 2021/2/20 10:31
 */
@TableName("physical_report_item")
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class PhysicalReportItem {

    //自增id
    @TableId(type = IdType.AUTO)
    private Long id;

    //报告id
    @TableField(value = "report_id")
    private Long reportId;

    //检查项目
    @TableField(value = "inspection_item")
    private String inspectionItem;

    //测量结果
    @TableField(value = "measuring_result")
    private String measuringResult;

    //单位
    @TableField(value = "unit")
    private String unit;

    //检查项目 1: 一般项目检查  2:血常规 3:尿常规 4:便隐血 5:实验室检查 6: 性激素六项 7：内科 8：外科 9：妇科 10： 眼科 11：耳鼻咽喉科 12：心电图室 13：超声检查室 14：骨密度检查室 15：放射科
    @TableField(value = "item_type")
    private int itemType;


}
