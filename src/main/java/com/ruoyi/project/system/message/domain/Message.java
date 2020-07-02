package com.ruoyi.project.system.message.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.framework.aspectj.lang.annotation.Excel;
import com.ruoyi.framework.web.domain.BaseEntity;
import java.util.Date;

/**
 * 留言管理对象 sys_message
 * 
 * @author ruoyi
 * @date 2020-04-07
 */
public class Message extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 消息id */
    private Long messageId;

    /** 用户id */
    @Excel(name = "用户id")
    private Long userId;
    private String userName;

    /** 商品id */
    @Excel(name = "商品id")
    private Long productId;
    private String productName;

    /** 留言内容 */
    @Excel(name = "留言内容")
    private String messageContent;

    /** 留言时间 */
    @Excel(name = "留言时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date messageContentTime;

    /** 回复内容 */
    @Excel(name = "回复内容")
    private String messageReply;

    /** 回复时间 */
    @Excel(name = "回复时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date messageReplyTime;

    public void setMessageId(Long messageId) 
    {
        this.messageId = messageId;
    }

    public Long getMessageId() 
    {
        return messageId;
    }
    public void setUserId(Long userId) 
    {
        this.userId = userId;
    }

    public Long getUserId() 
    {
        return userId;
    }
    public void setProductId(Long productId) 
    {
        this.productId = productId;
    }

    public Long getProductId() 
    {
        return productId;
    }
    public void setMessageContent(String messageContent) 
    {
        this.messageContent = messageContent;
    }

    public String getMessageContent() 
    {
        return messageContent;
    }
    public void setMessageContentTime(Date messageContentTime) 
    {
        this.messageContentTime = messageContentTime;
    }

    public Date getMessageContentTime() 
    {
        return messageContentTime;
    }
    public void setMessageReply(String messageReply) 
    {
        this.messageReply = messageReply;
    }

    public String getMessageReply() 
    {
        return messageReply;
    }
    public void setMessageReplyTime(Date messageReplyTime) 
    {
        this.messageReplyTime = messageReplyTime;
    }

    public Date getMessageReplyTime() 
    {
        return messageReplyTime;
    }

    
    public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	@Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("messageId", getMessageId())
            .append("userId", getUserId())
            .append("productId", getProductId())
            .append("messageContent", getMessageContent())
            .append("messageContentTime", getMessageContentTime())
            .append("messageReply", getMessageReply())
            .append("messageReplyTime", getMessageReplyTime())
            .toString();
    }
}
