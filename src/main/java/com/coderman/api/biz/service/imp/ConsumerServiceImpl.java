package com.coderman.api.biz.service.imp;

import com.coderman.api.biz.converter.ConsumerConverter;
import com.coderman.api.biz.mapper.ConsumerMapper;
import com.coderman.api.biz.service.ConsumerService;
import com.coderman.api.biz.vo.ConsumerVO;
import com.coderman.api.common.pojo.biz.Consumer;
import com.coderman.api.system.vo.PageVO;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import java.util.Date;
import java.util.List;
@Service
//用于类上，标记当前类是一个service类，加上该注解会将当前类自动注入到spring容器中，
// 不需要再在applicationContext.xml文件定义bean了。
public class ConsumerServiceImpl  implements ConsumerService {
    @Autowired
    private ConsumerMapper consumerMapper;

    //供应商列表
    @Override
    public PageVO<ConsumerVO> findConsumerList(Integer pageNum, Integer pageSize, ConsumerVO consumerVO) {
        PageHelper.startPage(pageNum, pageSize);
        //表示分页的开始，意思是从第 pageNum 页开始，每页显示 pageSize 条记录
        Example o = new Example(Consumer.class);
        Example.Criteria criteria = o.createCriteria();
        o.setOrderByClause("sort asc");
        if (consumerVO.getName() != null && !"".equals(consumerVO.getName())) {
            criteria.andLike("name", "%" + consumerVO.getName() + "%");
        }
        if (consumerVO.getAddress() != null && !"".equals(consumerVO.getAddress())) {
            criteria.andLike("address", "%" + consumerVO.getAddress() + "%");
        }
        if (consumerVO.getContact() != null && !"".equals(consumerVO.getContact())) {
            criteria.andLike("contact", "%" + consumerVO.getContact() + "%");
        }
        List<Consumer> consumers = consumerMapper.selectByExample(o);
        List<ConsumerVO> categoryVOS= ConsumerConverter.converterToVOList(consumers);
        PageInfo<Consumer> info = new PageInfo<>(consumers);
        return new PageVO<>(info.getTotal(), categoryVOS);
    }



    //添加供应商
    @Override
    public Consumer add(ConsumerVO ConsumerVO) {
        Consumer consumer = new Consumer();
        BeanUtils.copyProperties(ConsumerVO,consumer);
        consumer.setCreateTime(new Date());
        consumer.setModifiedTime(new Date());
        consumerMapper.insert(consumer);
        return consumer;
    }

    //编辑供应商
    @Override
    public ConsumerVO edit(Long id) {
        Consumer consumer = consumerMapper.selectByPrimaryKey(id);
        return  ConsumerConverter.converterToConsumerVO(consumer);
    }

    // 更新供应商
    @Override
    public void update(Long id, ConsumerVO ConsumerVO) {
        Consumer consumer = new Consumer();
        BeanUtils.copyProperties(ConsumerVO,consumer);
        consumer.setModifiedTime(new Date());
        consumerMapper.updateByPrimaryKeySelective(consumer);
    }

    // 删除供应商
    @Override
    public void delete(Long id) {
        consumerMapper.deleteByPrimaryKey(id);
    }

    //查询所有
    @Override
    public List<ConsumerVO> findAll() {
        List<Consumer> consumers = consumerMapper.selectAll();
        List<ConsumerVO> consumerVOS = ConsumerConverter.converterToVOList(consumers);
        return consumerVOS;
    }

}
