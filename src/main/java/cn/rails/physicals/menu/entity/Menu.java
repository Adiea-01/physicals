package cn.rails.physicals.menu.entity;

import cn.rails.physicals.sysuser.entity.BaseEntity;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.*;

import java.util.List;

/**
 * @Description: 系统菜单
 * @Author: pan zhenghui
 * @Date: 2021/2/3 15:51
 */
@TableName("menu")
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(callSuper=false)
public class Menu extends BaseEntity {



    /**
     * 优先级
     */
    @TableField("priority")
    private Integer priority;
    /**
     * 菜单级别
     * 1 一级菜单
     * 2 二级菜单
     * 3 按钮
     */
    @TableField("menu_level")
    private Integer menuLevel;
    /**
     * 菜单名称
     */
    @TableField("menu_name")
    private String menuName;
    /**
     * 菜单 url
     */
    @TableField("menu_url")
    private String menuUrl;
    /**
     * 父级 菜单id
     */
    @TableField("parent_menu_id")
    private Long parentMenuId;

    /**
     * 权限code
     */
    private String code;

    /**
     * 父级 菜单名称
     */
    private transient String parentMenuName;

    private transient List<Menu> childMenu;

    private transient int active;

    private transient boolean checked;

    private transient boolean open;

    private transient String name;
}
