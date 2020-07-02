package com.ruoyi.project.system.type.service;

import java.util.List;
import com.ruoyi.project.system.type.domain.Type;

/**
 * 种类管理Service接口
 * 
 * @author ruoyi
 * @date 2020-04-07
 */
public interface ITypeService 
{
    /**
     * 查询种类管理
     * 
     * @param typeId 种类管理ID
     * @return 种类管理
     */
    public Type selectTypeById(Long typeId);

    /**
     * 查询种类管理列表
     * 
     * @param type 种类管理
     * @return 种类管理集合
     */
    public List<Type> selectTypeList(Type type);

    /**
     * 新增种类管理
     * 
     * @param type 种类管理
     * @return 结果
     */
    public int insertType(Type type);

    /**
     * 修改种类管理
     * 
     * @param type 种类管理
     * @return 结果
     */
    public int updateType(Type type);

    /**
     * 批量删除种类管理
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteTypeByIds(String ids);

    /**
     * 删除种类管理信息
     * 
     * @param typeId 种类管理ID
     * @return 结果
     */
    public int deleteTypeById(Long typeId);
}
