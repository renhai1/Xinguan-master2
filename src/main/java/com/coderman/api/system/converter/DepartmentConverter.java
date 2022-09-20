package com.coderman.api.system.converter;

import com.coderman.api.common.pojo.system.Department;
import com.coderman.api.system.vo.DepartmentVO;
import org.springframework.beans.BeanUtils;

public class DepartmentConverter {
    //转vo
    public static DepartmentVO converterToDepartmentVO(Department department){
        DepartmentVO departmentVO = new DepartmentVO();
        BeanUtils.copyProperties(department,departmentVO);
        return departmentVO;
    }
}
