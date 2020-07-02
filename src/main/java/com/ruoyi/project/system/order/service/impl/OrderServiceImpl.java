package com.ruoyi.project.system.order.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ruoyi.project.system.order.mapper.OrderMapper;
import com.ruoyi.project.system.order.domain.Order;
import com.ruoyi.project.system.order.service.IOrderService;
import com.ruoyi.common.utils.text.Convert;

/**
 * 订单管理Service业务层处理
 * 
 * @author ruoyi
 * @date 2020-04-07
 */
@Service
public class OrderServiceImpl implements IOrderService 
{
    @Autowired
    private OrderMapper orderMapper;

    /**
     * 查询订单管理
     * 
     * @param orderId 订单管理ID
     * @return 订单管理
     */
    @Override
    public Order selectOrderById(Long orderId)
    {
        return orderMapper.selectOrderById(orderId);
    }

    /**
     * 查询订单管理列表
     * 
     * @param order 订单管理
     * @return 订单管理
     */
    @Override
    public List<Order> selectOrderList(Order order)
    {
        return orderMapper.selectOrderList(order);
    }

    /**
     * 新增订单管理
     * 
     * @param order 订单管理
     * @return 结果
     */
    @Override
    public int insertOrder(Order order)
    {
        return orderMapper.insertOrder(order);
    }

    /**
     * 修改订单管理
     * 
     * @param order 订单管理
     * @return 结果
     */
    @Override
    public int updateOrder(Order order)
    {
        return orderMapper.updateOrder(order);
    }

    /**
     * 删除订单管理对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteOrderByIds(String ids)
    {
        return orderMapper.deleteOrderByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除订单管理信息
     * 
     * @param orderId 订单管理ID
     * @return 结果
     */
    @Override
    public int deleteOrderById(Long orderId)
    {
        return orderMapper.deleteOrderById(orderId);
    }

	@Override
	public List<Order> selectOrderBySellerId(Long userId) {
		return orderMapper.selectOrderBySellerId(userId);
	}
}
