package com.ruoyi.project.system.type.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.framework.aspectj.lang.annotation.Excel;
import com.ruoyi.framework.web.domain.BaseEntity;

/**
 * 种类管理对象 sys_type
 * 
 * @author ruoyi
 * @date 2020-04-07
 */
public class Type extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 商品种类ID */
    private Long typeId;

    /** 种类名称 */
    @Excel(name = "种类名称")
    private String typeName;

    /** 种类排序 */
    @Excel(name = "种类排序")
    private Long typeSort;

    /** 种类状态 */
    @Excel(name = "种类状态")
    private String typeStatus;

    public void setTypeId(Long typeId) 
    {
        this.typeId = typeId;
    }

    public Long getTypeId() 
    {
        return typeId;
    }
    public void setTypeName(String typeName) 
    {
        this.typeName = typeName;
    }

    public String getTypeName() 
    {
        return typeName;
    }
    public void setTypeSort(Long typeSort) 
    {
        this.typeSort = typeSort;
    }

    public Long getTypeSort() 
    {
        return typeSort;
    }
    public void setTypeStatus(String typeStatus) 
    {
        this.typeStatus = typeStatus;
    }

    public String getTypeStatus() 
    {
        return typeStatus;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("typeId", getTypeId())
            .append("typeName", getTypeName())
            .append("typeSort", getTypeSort())
            .append("typeStatus", getTypeStatus())
            .toString();
    }
}
