package com.ruoyi.project.system.message.mapper;

import java.util.List;
import com.ruoyi.project.system.message.domain.Message;

/**
 * 留言管理Mapper接口
 * 
 * @author ruoyi
 * @date 2020-04-07
 */
public interface MessageMapper 
{
    /**
     * 查询留言管理
     * 
     * @param messageId 留言管理ID
     * @return 留言管理
     */
    public Message selectMessageById(Long messageId);

    /**
     * 查询留言管理列表
     * 
     * @param message 留言管理
     * @return 留言管理集合
     */
    public List<Message> selectMessageList(Message message);

    /**
     * 新增留言管理
     * 
     * @param message 留言管理
     * @return 结果
     */
    public int insertMessage(Message message);

    /**
     * 修改留言管理
     * 
     * @param message 留言管理
     * @return 结果
     */
    public int updateMessage(Message message);

    /**
     * 删除留言管理
     * 
     * @param messageId 留言管理ID
     * @return 结果
     */
    public int deleteMessageById(Long messageId);

    /**
     * 批量删除留言管理
     * 
     * @param messageIds 需要删除的数据ID
     * @return 结果
     */
    public int deleteMessageByIds(String[] messageIds);
}
