package com.example.expence.mapper;

import com.example.expence.pojo.Apply;
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

    @Insert("insert into apply(content, username, status) VALUES (#{content}, #{userName}, 0)")
    void insertOneApply(String content, String userName);

    @Select("select * from apply")
    List<Apply> selectAllApplies();

    @Insert("insert into department(name, employee_name) VALUES (#{dpName}, #{name})")
    void joinDepartment(String name, String dpName);

    @Update("update apply set status = #{status} where id = #{id}")
    void updateStatus(int status, int id);

    @Select("select status from apply where id = #{id}")
    int selectStatus(int id);

    @Update(("update department set name = #{dpName} where employee_name = #{name}"))
    void updateDp(String name, String dpName);
    @Select("select * from apply where username = #{name}")
    List<Apply> selectOne(Object name);

    @Update("update apply set feedback = #{feedback} where id = #{id}")
    void setFeedback(String feedback,int id);
}
