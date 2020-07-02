package com.ruoyi.project.system.product.service;

import java.util.List;
import com.ruoyi.project.system.product.domain.Product;

/**
 * 商品管理Service接口
 * 
 * @author ruoyi
 * @date 2020-04-07
 */
public interface IProductService 
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
     * 根据类型查询商品管理列表
     * 
     * @param typdId 类型Id
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
     * 批量删除商品管理
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteProductByIds(String ids);

    /**
     * 删除商品管理信息
     * 
     * @param productId 商品管理ID
     * @return 结果
     */
    public int deleteProductById(Long productId);
}
