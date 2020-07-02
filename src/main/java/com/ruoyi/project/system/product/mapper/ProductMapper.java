package com.ruoyi.project.system.product.mapper;

import java.util.List;
import com.ruoyi.project.system.product.domain.Product;

/**
 * 商品管理Mapper接口
 * 
 * @author ruoyi
 * @date 2020-04-07
 */
public interface ProductMapper 
{
    /**
     * 查询商品管理
     * 
     * @param productId 商品管理ID
     * @return 商品管理
     */
    public Product selectProductById(Long productId);

    /**
     * 查询商品管理列表
     * 
     * @param product 商品管理
     * @return 商品管理集合
     */
    public List<Product> selectProductList(Product product);
    
    /**
     * 查询类型商品列表
     * 
     * @param product 商品管理
     * @return 商品管理集合
     */
    public List<Product> selectProductByTypeId(Long typeId);

    /**
     * 新增商品管理
     * 
     * @param product 商品管理
     * @return 结果
     */
    public int insertProduct(Product product);

    /**
     * 修改商品管理
     * 
     * @param product 商品管理
     * @return 结果
     */
    public int updateProduct(Product product);

    /**
     * 删除商品管理
     * 
     * @param productId 商品管理ID
     * @return 结果
     */
    public int deleteProductById(Long productId);

    /**
     * 批量删除商品管理
     * 
     * @param productIds 需要删除的数据ID
     * @return 结果
     */
    public int deleteProductByIds(String[] productIds);
}
