package com.ruoyi.project.system.product.controller;

import java.io.IOException;
import java.util.List;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ruoyi.framework.aspectj.lang.annotation.Log;
import com.ruoyi.framework.aspectj.lang.enums.BusinessType;
import com.ruoyi.framework.config.RuoYiConfig;
import com.ruoyi.project.system.product.domain.Product;
import com.ruoyi.project.system.product.service.IProductService;
import com.ruoyi.project.system.type.domain.Type;
import com.ruoyi.project.system.type.service.ITypeService;
import com.ruoyi.project.system.user.domain.User;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.common.utils.file.FileUploadUtils;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.utils.security.ShiroUtils;
import com.ruoyi.framework.web.page.TableDataInfo;

/**
 * 商品管理Controller
 * 
 * @author ruoyi
 * @date 2020-04-07
 */
@Controller
@RequestMapping("/system/product")
public class ProductController extends BaseController
{
    private String prefix = "system/product";

    @Autowired
    private IProductService productService;
    @Autowired
    private ITypeService typeService;

    @RequiresPermissions("system:product:view")
    @GetMapping()
    public String product()
    {
        return prefix + "/product";
    }

    /**
     * 查询商品管理列表
     */
    @RequiresPermissions("system:product:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(Product product)
    {
        startPage();
        List<Product> list = productService.selectProductList(product);
        return getDataTable(list);
    }

    /**
     * 导出商品管理列表
     */
    @RequiresPermissions("system:product:export")
    @Log(title = "商品管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(Product product)
    {
        List<Product> list = productService.selectProductList(product);
        ExcelUtil<Product> util = new ExcelUtil<Product>(Product.class);
        return util.exportExcel(list, "product");
    }

    /**
     * 新增商品管理
     */
    @GetMapping("/add")
    public String add( ModelMap mmap)
    {
    	Type type =new Type();
    	type.setTypeStatus("0");
    	List<Type> typeList = typeService.selectTypeList(type);
    	mmap.put("typeList", typeList);
        return prefix + "/add";
    }

    /**
     * 新增保存商品管理
     * @throws IOException 
     */
    @RequiresPermissions("system:product:add")
    @Log(title = "商品管理", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(Product product) throws IOException
    {
    	User user = ShiroUtils.getSysUser();
    	product.setUserId(user.getUserId());
        return toAjax(productService.insertProduct(product));
    }

    /**
     * 修改商品管理
     */
    @GetMapping("/edit/{productId}")
    public String edit(@PathVariable("productId") Long productId, ModelMap mmap)
    {
    	List<Type> typeList = typeService.selectTypeList(new Type());
    	mmap.put("typeList", typeList);
        Product product = productService.selectProductById(productId);
        mmap.put("product", product);
        return prefix + "/edit";
    }

    /**
     * 修改保存商品管理
     */
    @RequiresPermissions("system:product:edit")
    @Log(title = "商品管理", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(Product product)
    {
        return toAjax(productService.updateProduct(product));
    }

    /**
     * 删除商品管理
     */
    @RequiresPermissions("system:product:remove")
    @Log(title = "商品管理", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(productService.deleteProductByIds(ids));
    }
}
