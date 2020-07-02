package com.ruoyi.project.system.cart.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.framework.aspectj.lang.annotation.Excel;
import com.ruoyi.framework.web.domain.BaseEntity;
import java.util.Date;

/**
 * 购物车对象 sys_cart
 * 
 * @author ruoyi
 * @date 2020-04-24
 */
public class Cart extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 购物车id */
    private Long cartId;

    /** 商品id */
    @Excel(name = "商品id")
    private Long productId;
    private String productName;

    /** 用户id */
    @Excel(name = "用户id")
    private Long userId;
    private String userName;

    /** 加入购物车时间 */
    @Excel(name = "加入购物车时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date cartTime;

    public void setCartId(Long cartId) 
    {
        this.cartId = cartId;
    }

    public Long getCartId() 
    {
        return cartId;
    }
    public void setProductId(Long productId) 
    {
        this.productId = productId;
    }

    public Long getProductId() 
    {
        return productId;
    }
    public void setUserId(Long userId) 
    {
        this.userId = userId;
    }

    public Long getUserId() 
    {
        return userId;
    }
    public void setCartTime(Date cartTime) 
    {
        this.cartTime = cartTime;
    }

    public Date getCartTime() 
    {
        return cartTime;
    }
    
    public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	@Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("cartId", getCartId())
            .append("productId", getProductId())
            .append("userId", getUserId())
            .append("cartTime", getCartTime())
            .toString();
    }
}
