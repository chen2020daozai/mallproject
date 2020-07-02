package com.ruoyi.project.system.product.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ruoyi.project.system.product.mapper.ProductMapper;
import com.ruoyi.project.system.product.domain.Product;
import com.ruoyi.project.system.product.service.IProductService;
import com.ruoyi.common.utils.text.Convert;

/**
 * 商品管理Service业务层处理
 * 
 * @author ruoyi
 * @date 2020-04-07
 */
@Service
public class ProductServiceImpl implements IProductService 
{
    @Autowired
    private ProductMapper productMapper;

    /**
     * 查询商品管理
     * 
     * @param productId 商品管理ID
     * @return 商品管理
     */
    @Override
    public Product selectProductById(Long productId)
    {
        return productMapper.selectProductById(productId);
    }

    /**
     * 查询商品管理列表
     * 
     * @param product 商品管理
     * @return 商品管理
     */
    @Override
    public List<Product> selectProductList(Product product)
    {
        return productMapper.selectProductList(product);
    }

    /**
     * 新增商品管理
     * 
     * @param product 商品管理
     * @return 结果
     */
    @Override
    public int insertProduct(Product product)
    {
        return productMapper.insertProduct(product);
    }

    /**
     * 修改商品管理
     * 
     * @param product 商品管理
     * @return 结果
     */
    @Override
    public int updateProduct(Product product)
    {
        return productMapper.updateProduct(product);
    }

    /**
     * 删除商品管理对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteProductByIds(String ids)
    {
        return productMapper.deleteProductByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除商品管理信息
     * 
     * @param productId 商品管理ID
     * @return 结果
     */
    @Override
    public int deleteProductById(Long productId)
    {
        return productMapper.deleteProductById(productId);
    }

	@Override
	public List<Product> selectProductByTypeId(Long typeId) {
		return productMapper.selectProductByTypeId(typeId);
	}
}
