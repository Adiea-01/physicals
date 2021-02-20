package cn.rails.physicals.entity;

import com.baomidou.mybatisplus.annotation.SqlCondition;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 检查项目
 */
@TableName("physical_checkup_item")
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class CheckupItem extends BaseEntity {

     //中文名
    @TableField(value = "chinese_name",condition = SqlCondition.LIKE)
    private String chineseName;

     //英文名
    @TableField(value = "english_name")
    private String englishName;

    //字段名（属性名）
    @TableField(value = "field_name")
    private String fieldName;

    //缩写
    @TableField(value = "abbreviation")
    private String abbreviation;

    //备注（说明：只针对中文名）
    @TableField(value = "chinese_explain")
    private String chineseExplain;

    //所属检测模块（检测分类）
    @TableField(value = "classification")
    private String classification;

    //检测参考值：最小值
    @TableField(value = "miximum")
    private String miximum;

    //检测参考值：最大值
    @TableField(value = "maximum")
    private String maximum;

    //检测参考值：计量单位
    @TableField(value = "unit")
    private String unit;

    //检测参考值描述(比如：多个参考值的时候，放到该字段中)
    @TableField(value = "reference_description")
    private String referenceDescription;


}