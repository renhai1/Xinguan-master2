package com.coderman.api.biz.converter;

import com.coderman.api.biz.vo.ConsumerVO;
import com.coderman.api.common.pojo.biz.Consumer;
import org.springframework.beans.BeanUtils;
import org.springframework.util.CollectionUtils;

import java.util.ArrayList;
import java.util.List;

public class ConsumerConverter {
    //转voList
    public static List<ConsumerVO> converterToVOList(List<Consumer> consumers) {
        List<ConsumerVO> supplierVOS=new ArrayList<>();
        if(!CollectionUtils.isEmpty(consumers)){//集合不为空
            for (Consumer supplier : consumers) {
                ConsumerVO supplierVO = converterToConsumerVO(supplier);
                supplierVOS.add(supplierVO);
            }
        }
        return supplierVOS;
    }
    //转VO
    public static ConsumerVO converterToConsumerVO(Consumer supplier) {
        ConsumerVO supplierVO = new ConsumerVO();
        BeanUtils.copyProperties(supplier,supplierVO);
//BeanUtils.copyProperties(Object source, Object target)把source这个bean的全部属性值复制到target这个bean对象
        return supplierVO;
    }
}
