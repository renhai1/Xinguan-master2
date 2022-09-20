package com.coderman.api.biz.converter;

import com.coderman.api.biz.mapper.SupplierMapper;
import com.coderman.api.biz.vo.InStockVO;
import com.coderman.api.common.pojo.biz.InStock;
import com.coderman.api.common.pojo.biz.Supplier;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.CollectionUtils;

import java.util.ArrayList;
import java.util.List;

@Component
//此注解的类看为组件，当使用基于注解的配置和类路径扫描的时候，这些类就会被实例化。
public class InStockConverter {
    @Autowired
    private SupplierMapper supplierMapper;

    //转voList
    public List<InStockVO> converterToVOList(List<InStock> inStocks) {
        List<InStockVO> inStockVOS = new ArrayList<>();//入库的相关信息
        if (!CollectionUtils.isEmpty(inStocks)) {
            for (InStock inStock : inStocks) {
                InStockVO inStockVO = new InStockVO();
                BeanUtils.copyProperties(inStock, inStockVO);
                //BeanUtils.copyProperties(Object source, Object target)把source这个bean的全部属性值复制到target这个bean对象
                Supplier supplier = supplierMapper.selectByPrimaryKey(inStock.getSupplierId());
                //当有主键时,优先用selectByPrimaryKey,当根据实体类属性查询时用select,当有复杂查询时,如模糊查询,条件判断时使用selectByExample
                if (supplier != null) {
                    inStockVO.setSupplierName(supplier.getName());
                    inStockVO.setPhone(supplier.getPhone());
                }
                inStockVOS.add(inStockVO);
            }
        }
        return inStockVOS;
    }
}
