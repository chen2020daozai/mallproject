package com.ruoyi.project.system.order.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.framework.aspectj.lang.annotation.Excel;
import com.ruoyi.framework.web.domain.BaseEntity;
import java.util.Date;

/**
 * 订单管理对象 sys_order
 * 
 * @author ruoyi
 * @date 2020-04-07
 */
public class Order extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 订单id */
    private Long orderId;

    /** 用户id */
    @Excel(name = "用户id")
    private Long userId;
    private String userName;

    /** 商品id */
    @Excel(name = "商品id")
    private Long productId;
    private String productName;

    /** 订单总额 */
    @Excel(name = "订单总额")
    private Double orderPrice;

    /** 订单状态 */
    @Excel(name = "订单状态")
    private String orderStatus;
    
    private String orderPhone;
    private String orderAddress;
    private String payWay;

    private Date orderTime;
    /** 商品评论 */
    @Excel(name = "商品评论")
    private String orderComment;

    /** 评论时间 */
    @Excel(name = "评论时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date orderCommentTime;

    public void setOrderId(Long orderId) 
    {
        this.orderId = orderId;
    }

    public Long getOrderId() 
    {
        return orderId;
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
    public void setOrderPrice(Double orderPrice) 
    {
        this.orderPrice = orderPrice;
    }

    public Double getOrderPrice() 
    {
        return orderPrice;
    }
    public void setOrderStatus(String orderStatus) 
    {
        this.orderStatus = orderStatus;
    }

    public String getOrderStatus() 
    {
        return orderStatus;
    }
    public void setOrderComment(String orderComment) 
    {
        this.orderComment = orderComment;
    }

    public String getOrderComment() 
    {
        return orderComment;
    }
    public void setOrderCommentTime(Date orderCommentTime) 
    {
        this.orderCommentTime = orderCommentTime;
    }

    public Date getOrderCommentTime() 
    {
        return orderCommentTime;
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
	
	public String getOrderPhone() {
		return orderPhone;
	}

	public void setOrderPhone(String orderPhone) {
		this.orderPhone = orderPhone;
	}

	public String getOrderAddress() {
		return orderAddress;
	}

	public void setOrderAddress(String orderAddress) {
		this.orderAddress = orderAddress;
	}
	
	public Date getOrderTime() {
		return orderTime;
	}

	public void setOrderTime(Date orderTime) {
		this.orderTime = orderTime;
	}

	public String getPayWay() {
		return payWay;
	}

	public void setPayWay(String payWay) {
		this.payWay = payWay;
	}

	@Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("orderId", getOrderId())
            .append("userId", getUserId())
            .append("productId", getProductId())
            .append("orderPrice", getOrderPrice())
            .append("orderStatus", getOrderStatus())
            .append("orderComment", getOrderComment())
            .append("orderCommentTime", getOrderCommentTime())
            .toString();
    }
}
