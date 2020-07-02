package com.ruoyi.project.system.product.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.framework.aspectj.lang.annotation.Excel;
import com.ruoyi.framework.web.domain.BaseEntity;

/**
 * 商品管理对象 sys_product
 * 
 * @author ruoyi
 * @date 2020-04-07
 */
public class Product extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 商品ID */
    private Long productId;

    /** 卖家ID */
    @Excel(name = "卖家ID")
    private Long userId;
    
    private String userName;

    /** 商品名称 */
    @Excel(name = "商品名称")
    private String productName;

    /** 种类id */
    @Excel(name = "种类id")
    private Long typeId;
    
    private String typeName;

    /** 商品照片 */
    @Excel(name = "商品照片")
    private String productPicture;

    /** 商品价格 */
    @Excel(name = "商品价格")
    private Double productPrice;

    /** 商品描述 */
    @Excel(name = "商品描述")
    private String productDescription;

    /** 商品状态 */
    @Excel(name = "商品状态")
    private String productStatus;

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
    public void setProductName(String productName) 
    {
        this.productName = productName;
    }

    public String getProductName() 
    {
        return productName;
    }
    public void setTypeId(Long typeId) 
    {
        this.typeId = typeId;
    }

    public Long getTypeId() 
    {
        return typeId;
    }
    public void setProductPicture(String productPicture) 
    {
        this.productPicture = productPicture;
    }

    public String getProductPicture() 
    {
        return productPicture;
    }
    public void setProductPrice(Double productPrice) 
    {
        this.productPrice = productPrice;
    }

    public Double getProductPrice() 
    {
        return productPrice;
    }
    public void setProductDescription(String productDescription) 
    {
        this.productDescription = productDescription;
    }

    public String getProductDescription() 
    {
        return productDescription;
    }
    public void setProductStatus(String productStatus) 
    {
        this.productStatus = productStatus;
    }

    public String getProductStatus() 
    {
        return productStatus;
    }
    
    
    
    public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	@Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("productId", getProductId())
            .append("userId", getUserId())
            .append("productName", getProductName())
            .append("typeId", getTypeId())
            .append("productPicture", getProductPicture())
            .append("productPrice", getProductPrice())
            .append("productDescription", getProductDescription())
            .append("productStatus", getProductStatus())
            .toString();
    }
}
