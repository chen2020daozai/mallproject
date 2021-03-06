package com.ruoyi.project.system.cart.mapper;

import java.util.List;
import com.ruoyi.project.system.cart.domain.Cart;

/**
 * 购物车Mapper接口
 * 
 * @author ruoyi
 * @date 2020-04-24
 */
public interface CartMapper 
{
    /**
     * 查询购物车
     * 
     * @param cartId 购物车ID
     * @return 购物车
     */
    public Cart selectCartById(Long cartId);

    /**
     * 查询购物车列表
     * 
     * @param cart 购物车
     * @return 购物车集合
     */
    public List<Cart> selectCartList(Cart cart);

    /**
     * 新增购物车
     * 
     * @param cart 购物车
     * @return 结果
     */
    public int insertCart(Cart cart);

    /**
     * 修改购物车
     * 
     * @param cart 购物车
     * @return 结果
     */
    public int updateCart(Cart cart);

    /**
     * 删除购物车
     * 
     * @param cartId 购物车ID
     * @return 结果
     */
    public int deleteCartById(Long cartId);

    /**
     * 批量删除购物车
     * 
     * @param cartIds 需要删除的数据ID
     * @return 结果
     */
    public int deleteCartByIds(String[] cartIds);
}
