package com.example.expence.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

/**
 * @author yourkin666
 * @date 2024/05/28/21:34
 * @description
 */
@Mapper
public interface ProcessMapper {
    @Select("select ID_ from test.act_re_procdef where DEPLOYMENT_ID_ = #{id}")
    String selectId(String id);
}
