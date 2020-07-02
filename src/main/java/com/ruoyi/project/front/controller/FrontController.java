package com.ruoyi.project.front.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ruoyi.common.utils.ServletUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.security.ShiroUtils;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.project.monitor.server.domain.Sys;
import com.ruoyi.project.system.message.domain.Message;
import com.ruoyi.project.system.message.service.IMessageService;
import com.ruoyi.project.system.order.domain.Order;
import com.ruoyi.project.system.order.service.IOrderService;
import com.ruoyi.project.system.product.domain.Product;
import com.ruoyi.project.system.product.service.IProductService;
import com.ruoyi.project.system.role.service.RoleServiceImpl;
import com.ruoyi.project.system.type.domain.Type;
import com.ruoyi.project.system.type.service.ITypeService;
import com.ruoyi.project.system.user.domain.User;
import com.ruoyi.project.system.user.service.UserServiceImpl;

/**
 * 登录验证
 * 
 * @author ruoyi
 */
@Controller
@RequestMapping("/front")
public class FrontController extends BaseController
{
	 private String prefix = "front";
	 
	 @Autowired
	 private ITypeService typeService;
	 @Autowired
	 private IProductService productService;
	 @Autowired
	 private IOrderService orderService;
	 @Autowired
	 private IMessageService messageService;
	    @GetMapping("")
	    public String front(ModelMap mmap)
	    {
	    	User user = ShiroUtils.getSysUser();
	    	if(user != null){
	    		mmap.put("userName", user.getUserName());
	    	}else{
	    		mmap.put("userName", null);
	    	}
	    	Type type =new Type();
	    	type.setTypeStatus("0");
	    	List<Type> typeList = typeService.selectTypeList(type);
	    	mmap.put("typeList", typeList);
	    	
	    	Product product = new Product();
	    	List<Product> productList = productService.selectProductList(product);
	    	mmap.put("productList",productList);
	    	
	        return prefix + "/index";
	    }
    @GetMapping("/{bookName}")
    public String front(@PathVariable("bookName") String bookName,ModelMap mmap)
    {
    	User user = ShiroUtils.getSysUser();
    	if(user != null){
    		mmap.put("userName", user.getUserName());
    	}else{
    		mmap.put("userName", null);
    	}
    	Type type =new Type();
    	type.setTypeStatus("0");
    	List<Type> typeList = typeService.selectTypeList(type);
    	mmap.put("typeList", typeList);
    	
    	Product product = new Product();
    	product.setProductName(bookName);
    	List<Product> productList = productService.selectProductList(product);
    	mmap.put("productList",productList);
    	
        return prefix + "/index";
    }
    
    @GetMapping("/list/{typeId}")
    public String list(@PathVariable("typeId") Long typeId,ModelMap mmap){
    	User user = ShiroUtils.getSysUser();
    	if(user != null){
    		mmap.put("userName", user.getUserName());
    	}else{
    		mmap.put("userName", null);
    	}
    	Type type =new Type();
    	type.setTypeStatus("0");
    	List<Type> typeList = typeService.selectTypeList(type);
    	mmap.put("typeList", typeList);
    	
		List<Product> productList = productService.selectProductByTypeId(typeId);    	
		mmap.put("productList", productList);
		
		Type currentType = typeService.selectTypeById(typeId);
		mmap.put("currentType", currentType);
		
    	return prefix+"/list";
    }
    
    @GetMapping("/product/{productId}")
    public String product(@PathVariable("productId") Long productId,ModelMap mmap){
    	User user = ShiroUtils.getSysUser();
    	if(user != null){
    		mmap.put("userName", user.getUserName());
    	}else{
    		mmap.put("userName", null);
    	}
    	
    	Type type =new Type();
    	type.setTypeStatus("0");
    	List<Type> typeList = typeService.selectTypeList(type);
    	mmap.put("typeList", typeList);
    	
		Product product = productService.selectProductById(productId);
		mmap.put("product", product);
		
		Order queryOrder = new Order();
		queryOrder.setOrderStatus("5");
		queryOrder.setProductId(productId);
		List<Order> productOrder = orderService.selectOrderList(queryOrder);
		mmap.put("productOrder", productOrder);
		
		Message queryMessage = new Message();
		queryMessage.setProductId(productId);
		List<Message> messageList = messageService.selectMessageList(queryMessage);
		mmap.put("messageList", messageList);
    	return prefix+"/product";
    }
    
}
