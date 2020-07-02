package com.ruoyi.project.system.cart.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ruoyi.project.system.cart.mapper.CartMapper;
import com.ruoyi.project.system.cart.domain.Cart;
import com.ruoyi.project.system.cart.service.ICartService;
import com.ruoyi.common.utils.text.Convert;

/**
 * 购物车Service业务层处理
 * 
 * @author ruoyi
 * @date 2020-04-24
 */
@Service
public class CartServiceImpl implements ICartService 
{
    @Autowired
    private CartMapper cartMapper;

    /**
     * 查询购物车
     * 
     * @param cartId 购物车ID
     * @return 购物车
     */
    @Override
    public Cart selectCartById(Long cartId)
    {
        return cartMapper.selectCartById(cartId);
    }

    /**
     * 查询购物车列表
     * 
     * @param cart 购物车
     * @return 购物车
     */
    @Override
    public List<Cart> selectCartList(Cart cart)
    {
        return cartMapper.selectCartList(cart);
    }

    /**
     * 新增购物车
     * 
     * @param cart 购物车
     * @return 结果
     */
    @Override
    public int insertCart(Cart cart)
    {
    	List<Cart> cartList = new ArrayList<Cart>();
    	cartList = cartMapper.selectCartList(cart);
    	if(cartList == null || cartList.size()==0){
    		cart.setCartTime(new Date());
    		return cartMapper.insertCart(cart);
    	}else{
    		cart.setCartTime(new Date());
    		return cartMapper.updateCart(cartList.get(0));
    	}
    }

    /**
     * 修改购物车
     * 
     * @param cart 购物车
     * @return 结果
     */
    @Override
    public int updateCart(Cart cart)
    {
        return cartMapper.updateCart(cart);
    }

    /**
     * 删除购物车对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteCartByIds(String ids)
    {
        return cartMapper.deleteCartByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除购物车信息
     * 
     * @param cartId 购物车ID
     * @return 结果
     */
    @Override
    public int deleteCartById(Long cartId)
    {
        return cartMapper.deleteCartById(cartId);
    }
}
