package com.ruoyi.project.system.type.controller;

import java.util.List;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.ruoyi.framework.aspectj.lang.annotation.Log;
import com.ruoyi.framework.aspectj.lang.enums.BusinessType;
import com.ruoyi.project.system.type.domain.Type;
import com.ruoyi.project.system.type.service.ITypeService;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.framework.web.page.TableDataInfo;

/**
 * 种类管理Controller
 * 
 * @author ruoyi
 * @date 2020-04-07
 */
@Controller
@RequestMapping("/system/type")
public class TypeController extends BaseController
{
    private String prefix = "system/type";

    @Autowired
    private ITypeService typeService;

    @RequiresPermissions("system:type:view")
    @GetMapping()
    public String type()
    {
        return prefix + "/type";
    }

    /**
     * 查询种类管理列表
     */
    @RequiresPermissions("system:type:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(Type type)
    {
        startPage();
        List<Type> list = typeService.selectTypeList(type);
        return getDataTable(list);
    }

    /**
     * 导出种类管理列表
     */
    @RequiresPermissions("system:type:export")
    @Log(title = "种类管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(Type type)
    {
        List<Type> list = typeService.selectTypeList(type);
        ExcelUtil<Type> util = new ExcelUtil<Type>(Type.class);
        return util.exportExcel(list, "type");
    }

    /**
     * 新增种类管理
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存种类管理
     */
    @RequiresPermissions("system:type:add")
    @Log(title = "种类管理", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(Type type)
    {
        return toAjax(typeService.insertType(type));
    }

    /**
     * 修改种类管理
     */
    @GetMapping("/edit/{typeId}")
    public String edit(@PathVariable("typeId") Long typeId, ModelMap mmap)
    {
        Type type = typeService.selectTypeById(typeId);
        mmap.put("type", type);
        return prefix + "/edit";
    }

    /**
     * 修改保存种类管理
     */
    @RequiresPermissions("system:type:edit")
    @Log(title = "种类管理", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(Type type)
    {
        return toAjax(typeService.updateType(type));
    }

    /**
     * 删除种类管理
     */
    @RequiresPermissions("system:type:remove")
    @Log(title = "种类管理", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(typeService.deleteTypeByIds(ids));
    }
}
