package com.example.demo.mapper;

import com.example.demo.pojo.Apply;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

/**
 * @author yourkin666
 * @date 2024/05/24/18:10
 * @description
 */
@Mapper
public interface Applymapper {

    @Insert("insert into oa.apply(content, username, status) VALUES (#{content}, #{userName}, 0)")
    void insertOneApply(String content, String userName);

    @Select("select * from oa.apply")
    List<Apply> selectAllApplies();

    @Insert("insert into oa.department(name, employee_name) VALUES (#{dpName}, #{name})")
    void joinDepartment(String name, String dpName);

    @Update("update oa.apply set status = #{status} where id = #{id}")
    void updateStatus(int status, int id);

    @Select("select status from oa.apply where id = #{id}")
    int selectStatus(int id);

    @Update(("update oa.department set name = #{dpName} where employee_name = #{name}"))
    void updateDp(String name, String dpName);
    @Select("select * from oa.apply where username = #{name}")
    List<Apply> selectOne(Object name);

    @Update("update oa.apply set feedback = #{feedback} where id = #{id}")
    void setFeedback(String feedback,int id);
}
