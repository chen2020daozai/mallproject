package com.ruoyi.project.system.order.mapper;

import java.util.List;
import com.ruoyi.project.system.order.domain.Order;

/**
 * 订单管理Mapper接口
 * 
 * @author ruoyi
 * @date 2020-04-07
 */
public interface OrderMapper 
{
    /**
     * 查询订单管理
     * 
     * @param orderId 订单管理ID
     * @return 订单管理
     */
    public Order selectOrderById(Long orderId);

    /**
     * 查询订单管理列表
     * 
     * @param order 订单管理
     * @return 订单管理集合
     */
    public List<Order> selectOrderList(Order order);
    
    public List<Order> selectOrderBySellerId(Long userId);

    /**
     * 新增订单管理
     * 
     * @param order 订单管理
     * @return 结果
     */
    public int insertOrder(Order order);

    /**
     * 修改订单管理
     * 
     * @param order 订单管理
     * @return 结果
     */
    public int updateOrder(Order order);

    /**
     * 删除订单管理
     * 
     * @param orderId 订单管理ID
     * @return 结果
     */
    public int deleteOrderById(Long orderId);

    /**
     * 批量删除订单管理
     * 
     * @param orderIds 需要删除的数据ID
     * @return 结果
     */
    public int deleteOrderByIds(String[] orderIds);
}
