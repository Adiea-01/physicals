package cn.rails.physicals.entity;


import com.baomidou.mybatisplus.annotation.*;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public abstract class BaseEntity {

    //自增id
    @TableId(type = IdType.AUTO)
    private Long id;

    //创建者id
    @TableField(value = "create_id",fill = FieldFill.INSERT)
    private Long createId;

    //创建时间
    @TableField(value="create_date",fill = FieldFill.INSERT)
    private Date createDate;

    //更新者id
    @TableField(value = "update_id",fill = FieldFill.UPDATE)
    private Long updateId;

    //更新时间
    @TableField(value = "update_date",fill = FieldFill.UPDATE)
    private Date updateDate;

    //删除标志位 1删除 0未删除
    @TableLogic(value = "0", delval = "1")
    @TableField(value = "del_flag",fill = FieldFill.INSERT)
    private int delFlag;

}