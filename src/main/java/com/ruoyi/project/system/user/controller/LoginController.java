package com.ruoyi.project.system.user.controller;

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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ruoyi.common.utils.ServletUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.security.ShiroUtils;
import com.ruoyi.framework.aspectj.lang.annotation.Log;
import com.ruoyi.framework.aspectj.lang.enums.BusinessType;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.project.monitor.server.domain.Sys;
import com.ruoyi.project.system.role.service.RoleServiceImpl;
import com.ruoyi.project.system.user.domain.User;
import com.ruoyi.project.system.user.service.UserServiceImpl;

/**
 * 登录验证
 * 
 * @author ruoyi
 */
@Controller
public class LoginController extends BaseController
{
	@Autowired
	public RoleServiceImpl roleService;
	@Autowired
	public UserServiceImpl userService;
	
	
    @GetMapping("/login")
    public String login(HttpServletRequest request, HttpServletResponse response)
    {
        // 如果是Ajax请求，返回Json字符串。
        if (ServletUtils.isAjaxRequest(request))
        {
            return ServletUtils.renderString(response, "{\"code\":\"1\",\"msg\":\"未登录或登录超时。请重新登录\"}");
        }

        return "login";
    }

    @PostMapping("/login")
    @ResponseBody
    public AjaxResult ajaxLogin(String username, String password, Boolean rememberMe)
    {
        UsernamePasswordToken token = new UsernamePasswordToken(username, password, rememberMe);
        Subject subject = SecurityUtils.getSubject();
        try
        {
            subject.login(token);
            return success();
        }
        catch (AuthenticationException e)
        {
            String msg = "用户或密码错误";
            if (StringUtils.isNotEmpty(e.getMessage()))
            {
                msg = e.getMessage();
            }
            return error(msg);
        }
    }
    
    @GetMapping("/regist")
    public String regist(ModelMap mmap){
    	System.out.println("用户注册");
    	mmap.put("roles", roleService.selectGeneralRole());
    	return "regist";
    }
    
    
    @PostMapping("/regist")
    @ResponseBody
    public AjaxResult ajaxRegist(User user)
    {
    	 return toAjax(userService.registUser(user));
    }
    
    
    @GetMapping("/forget")
    public String forget(ModelMap mmap){
        return "/forget";
    }
    
    
    @Log(title = "忘记密码", businessType = BusinessType.UPDATE)
    @PostMapping("/forget")
    @ResponseBody
    public AjaxResult forget(User user)
    {
    	if(StringUtils.isEmpty(user.getLoginName()) || StringUtils.isEmpty(user.getEmail())){
    		return error("请输入用户名和邮箱！");
    	}
    	List<User> userList = userService.selectUserList(user);
    	if(userList == null || userList.size() == 0){
    		return error("输入的用户名/邮箱不匹配！");
    	}else{
    		user.setUserId(userList.get(0).getUserId());
    		user.setPassword("123456");
    		userService.resetUserPwd(user);
    		return success();
    	}
    }
    
    
    

    @GetMapping("/unauth")
    public String unauth()
    {
        return "error/unauth";
    }
}
