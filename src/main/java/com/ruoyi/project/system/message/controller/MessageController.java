package com.ruoyi.project.system.message.controller;

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

import com.mysql.cj.Messages;
import com.ruoyi.framework.aspectj.lang.annotation.Log;
import com.ruoyi.framework.aspectj.lang.enums.BusinessType;
import com.ruoyi.project.system.message.domain.Message;
import com.ruoyi.project.system.message.service.IMessageService;
import com.ruoyi.project.system.order.domain.Order;
import com.ruoyi.project.system.user.domain.User;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.utils.security.ShiroUtils;
import com.ruoyi.framework.web.page.TableDataInfo;

/**
 * 留言管理Controller
 * 
 * @author ruoyi
 * @date 2020-04-07
 */
@Controller
@RequestMapping("/system/message")
public class MessageController extends BaseController
{
    private String prefix = "system/message";

    @Autowired
    private IMessageService messageService;

    @RequiresPermissions("system:message:view")
    @GetMapping()
    public String message()
    {
        return prefix + "/message";
    }

    /**
     * 查询留言管理列表
     */
    @RequiresPermissions("system:message:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(Message message)
    {
        startPage();
        List<Message> list = messageService.selectMessageList(message);
        return getDataTable(list);
    }

    /**
     * 导出留言管理列表
     */
    @RequiresPermissions("system:message:export")
    @Log(title = "留言管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(Message message)
    {
        List<Message> list = messageService.selectMessageList(message);
        ExcelUtil<Message> util = new ExcelUtil<Message>(Message.class);
        return util.exportExcel(list, "message");
    }

    /**
     * 新增留言管理
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }
    
    /**
     * 新增留言管理
     */
    @GetMapping("/replyMessage/{messageId}")
    public String replyMessage(@PathVariable("messageId") Long messageId, ModelMap mmap)
    {
    	Message message = messageService.selectMessageById(messageId);
    	mmap.put("message", message);
    	return prefix + "/replyMessage";
    }
    
    @Log(title = "留言回复", businessType = BusinessType.UPDATE)
    @PostMapping("/replyMessage")
    @ResponseBody
    public AjaxResult replyMessage(Message message){
    	Message saveMessage = messageService.selectMessageById(message.getMessageId());
    	saveMessage.setMessageReply(message.getMessageReply());
    	saveMessage.setMessageReplyTime(new Date());
    	return toAjax(messageService.updateMessage(saveMessage));
    }
    

    /**
     * 新增保存留言管理
     */
    @Log(title = "留言管理", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(Message message)
    {
    	User user = ShiroUtils.getSysUser();
    	message.setUserId(user.getUserId());
    	message.setMessageContentTime(new Date());
        return toAjax(messageService.insertMessage(message));
    }

    /**
     * 修改留言管理
     */
    @GetMapping("/edit/{messageId}")
    public String edit(@PathVariable("messageId") Long messageId, ModelMap mmap)
    {
        Message message = messageService.selectMessageById(messageId);
        mmap.put("message", message);
        return prefix + "/edit";
    }

    /**
     * 修改保存留言管理
     */
    @RequiresPermissions("system:message:edit")
    @Log(title = "留言管理", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(Message message)
    {
        return toAjax(messageService.updateMessage(message));
    }

    /**
     * 删除留言管理
     */
    @RequiresPermissions("system:message:remove")
    @Log(title = "留言管理", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(messageService.deleteMessageByIds(ids));
    }
}
