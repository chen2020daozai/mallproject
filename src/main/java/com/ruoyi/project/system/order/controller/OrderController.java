package com.ruoyi.project.system.order.controller;

import java.util.ArrayList;
import java.util.Date;
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
import com.ruoyi.project.system.order.domain.Order;
import com.ruoyi.project.system.order.service.IOrderService;
import com.ruoyi.project.system.product.domain.Product;
import com.ruoyi.project.system.product.service.IProductService;
import com.ruoyi.project.system.role.service.IRoleService;
import com.ruoyi.project.system.user.domain.User;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.utils.security.ShiroUtils;
import com.ruoyi.framework.web.page.TableDataInfo;

/**
 * 订单管理Controller
 * 
 * @author ruoyi
 * @date 2020-04-07
 */
@Controller
@RequestMapping("/system/order")
public class OrderController extends BaseController
{
    private String prefix = "system/order";

    @Autowired
    private IOrderService orderService;
    @Autowired
    private IRoleService roleService;
    @Autowired
    private IProductService productService;
    

    @RequiresPermissions("system:order:view")
    @GetMapping()
    public String order(ModelMap mmap)
    {
    	User user = ShiroUtils.getSysUser();
    	String roleString = roleService.selectRoleKeys(user.getUserId()).toString();
    	if(roleString.contains("admin")){
    		mmap.put("loginRole", "admin");
    	}else	if(roleString.contains("seller")){
    		mmap.put("loginRole", "seller");
    	}else{
    		mmap.put("loginRole", "buyer");
    	}
        return prefix + "/order";
    }

    /**
     * 查询订单管理列表
     */
    @RequiresPermissions("system:order:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(Order order)
    {
    	User user = ShiroUtils.getSysUser();
    	String roleString = roleService.selectRoleKeys(user.getUserId()).toString();
    	startPage();
    	List<Order> list;
    	if(roleString.contains("admin")){
    		list = orderService.selectOrderList(order);
    	}else	if(roleString.contains("seller")){
    		list = orderService.selectOrderBySellerId(user.getUserId());
    		List<Order> queryList = new ArrayList<Order>();
    		if(StringUtils.isNotEmpty(order.getOrderStatus())){
	    		for(int i = 0 ; i < list.size();i++){
	    			if(list.get(i).getOrderStatus().equals(order.getOrderStatus())){
	    				queryList.add(list.get(i));
	    			}
	    		}
	    		list = queryList;
    		}
    	}else{
    		order.setUserId(user.getUserId());
    		list = orderService.selectOrderList(order);
    	}
        return getDataTable(list);
    }

    /**
     * 导出订单管理列表
     */
    @RequiresPermissions("system:order:export")
    @Log(title = "订单管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(Order order)
    {
        List<Order> list = orderService.selectOrderList(order);
        ExcelUtil<Order> util = new ExcelUtil<Order>(Order.class);
        return util.exportExcel(list, "order");
    }

    /**
     * 新增订单管理
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存订单管理
     */
    @RequiresPermissions("system:order:add")
    @Log(title = "订单管理", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(Order order)
    {
        return toAjax(orderService.insertOrder(order));
    }
    
    
    /**
     * 前台创建订单
     */
    @Log(title = "订单管理", businessType = BusinessType.INSERT)
    @PostMapping("/create")
    @ResponseBody
    public AjaxResult create(Order order)
    {
    	User user = ShiroUtils.getSysUser();
    	order.setOrderStatus("0");
    	order.setUserId(user.getUserId());
    	order.setOrderTime(new Date());
    	orderService.insertOrder(order);
        return  AjaxResult.success(order.getOrderId());
    }
    /**
     * 前台创建订单
     */
    @Log(title = "订单管理", businessType = BusinessType.INSERT)
    @GetMapping("/createorder/{productId}")
    public String createorder(@PathVariable("productId") Long productId , ModelMap mmap)
    {
    	Product product = productService.selectProductById(productId);
    	mmap.put("productId", productId);
    	mmap.put("orderPrice", product.getProductPrice());
    	return  "front/createorder";
    }

    /**
     * 修改订单管理
     */
    @GetMapping("/edit/{orderId}")
    public String edit(@PathVariable("orderId") Long orderId, ModelMap mmap)
    {
        Order order = orderService.selectOrderById(orderId);
        mmap.put("order", order);
        return prefix + "/edit";
    }
    
    /**
     * 修改订单管理
     */
    @GetMapping("/pay/{orderId}")
    public String pay(@PathVariable("orderId") Long orderId, ModelMap mmap)
    {
        Order order = orderService.selectOrderById(orderId);
        mmap.put("order", order);
        return prefix + "/pay";
    }
    
    @GetMapping("/comment/{orderId}")
    public String comment(@PathVariable("orderId") Long orderId, ModelMap mmap)
    {
        Order order = orderService.selectOrderById(orderId);
        mmap.put("order", order);
        return prefix + "/comment";
    }
    
    /**
     * 修改保存订单管理
     */
    @Log(title = "订单管理", businessType = BusinessType.UPDATE)
    @PostMapping("/comment")
    @ResponseBody
    public AjaxResult commentSave(Order order)
    {
    	Order saveOrder = orderService.selectOrderById(order.getOrderId());
    	saveOrder.setOrderComment(order.getOrderComment());
    	saveOrder.setOrderCommentTime(new Date());
    	saveOrder.setOrderStatus("5");
        return toAjax(orderService.updateOrder(saveOrder));
    }
    
    @GetMapping("/payOrder/{orderId}")
    @ResponseBody
    public AjaxResult payOrder(@PathVariable("orderId") Long orderId, ModelMap mmap)
    {
        Order order = orderService.selectOrderById(orderId);
        order.setOrderStatus("1");
        return toAjax(orderService.updateOrder(order));
    }
    
    @PostMapping("/payOrder")
    @ResponseBody
    public AjaxResult payOrder(Order order, ModelMap mmap)
    {
        order.setOrderStatus("1");
        return toAjax(orderService.updateOrder(order));
    }
    @GetMapping("/confirmStatus/{orderId}")
    @ResponseBody
    public AjaxResult confirmStatus(@PathVariable("orderId") Long orderId, ModelMap mmap)
    {
    	Order order = orderService.selectOrderById(orderId);
    	order.setOrderStatus("2");
    	return toAjax(orderService.updateOrder(order));
    }
    @GetMapping("/sendStatus/{orderId}")
    @ResponseBody
    public AjaxResult sendStatus(@PathVariable("orderId") Long orderId, ModelMap mmap)
    {
    	Order order = orderService.selectOrderById(orderId);
    	order.setOrderStatus("3");
    	return toAjax(orderService.updateOrder(order));
    }

    @GetMapping("/receiveStatus/{orderId}")
    @ResponseBody
    public AjaxResult receiveStatus(@PathVariable("orderId") Long orderId, ModelMap mmap)
    {
        Order order = orderService.selectOrderById(orderId);
        order.setOrderStatus("4");
        return toAjax(orderService.updateOrder(order));
    }
    
    
    
    
    /**
     * 修改保存订单管理
     */
    @RequiresPermissions("system:order:edit")
    @Log(title = "订单管理", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(Order order)
    {
        return toAjax(orderService.updateOrder(order));
    }

    /**
     * 删除订单管理
     */
    @RequiresPermissions("system:order:remove")
    @Log(title = "订单管理", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(orderService.deleteOrderByIds(ids));
    }
}
