package com.ruoyi.project.system.message.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.project.system.message.mapper.MessageMapper;
import com.ruoyi.project.system.message.domain.Message;
import com.ruoyi.project.system.message.service.IMessageService;
import com.ruoyi.common.utils.text.Convert;

/**
 * 留言管理Service业务层处理
 * 
 * @author ruoyi
 * @date 2020-04-07
 */
@Service
public class MessageServiceImpl implements IMessageService 
{
    @Autowired
    private MessageMapper messageMapper;

    /**
     * 查询留言管理
     * 
     * @param messageId 留言管理ID
     * @return 留言管理
     */
    @Override
    public Message selectMessageById(Long messageId)
    {
        return messageMapper.selectMessageById(messageId);
    }

    /**
     * 查询留言管理列表
     * 
     * @param message 留言管理
     * @return 留言管理
     */
    @Override
    public List<Message> selectMessageList(Message message)
    {
        return messageMapper.selectMessageList(message);
    }

    /**
     * 新增留言管理
     * 
     * @param message 留言管理
     * @return 结果
     */
    @Override
    public int insertMessage(Message message)
    {
        return messageMapper.insertMessage(message);
    }

    /**
     * 修改留言管理
     * 
     * @param message 留言管理
     * @return 结果
     */
    @Override
    public int updateMessage(Message message)
    {
        return messageMapper.updateMessage(message);
    }

    /**
     * 删除留言管理对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteMessageByIds(String ids)
    {
        return messageMapper.deleteMessageByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除留言管理信息
     * 
     * @param messageId 留言管理ID
     * @return 结果
     */
    @Override
    public int deleteMessageById(Long messageId)
    {
        return messageMapper.deleteMessageById(messageId);
    }
}
