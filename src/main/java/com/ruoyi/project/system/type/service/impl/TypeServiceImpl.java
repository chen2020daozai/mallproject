package com.ruoyi.project.system.type.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.project.system.type.mapper.TypeMapper;
import com.ruoyi.project.system.type.domain.Type;
import com.ruoyi.project.system.type.service.ITypeService;
import com.ruoyi.common.utils.text.Convert;

/**
 * 种类管理Service业务层处理
 * 
 * @author ruoyi
 * @date 2020-04-07
 */
@Service
public class TypeServiceImpl implements ITypeService 
{
    @Autowired
    private TypeMapper typeMapper;

    /**
     * 查询种类管理
     * 
     * @param typeId 种类管理ID
     * @return 种类管理
     */
    @Override
    public Type selectTypeById(Long typeId)
    {
        return typeMapper.selectTypeById(typeId);
    }

    /**
     * 查询种类管理列表
     * 
     * @param type 种类管理
     * @return 种类管理
     */
    @Override
    public List<Type> selectTypeList(Type type)
    {
        return typeMapper.selectTypeList(type);
    }

    /**
     * 新增种类管理
     * 
     * @param type 种类管理
     * @return 结果
     */
    @Override
    public int insertType(Type type)
    {
        return typeMapper.insertType(type);
    }

    /**
     * 修改种类管理
     * 
     * @param type 种类管理
     * @return 结果
     */
    @Override
    public int updateType(Type type)
    {
        return typeMapper.updateType(type);
    }

    /**
     * 删除种类管理对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteTypeByIds(String ids)
    {
        return typeMapper.deleteTypeByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除种类管理信息
     * 
     * @param typeId 种类管理ID
     * @return 结果
     */
    @Override
    public int deleteTypeById(Long typeId)
    {
        return typeMapper.deleteTypeById(typeId);
    }
}
