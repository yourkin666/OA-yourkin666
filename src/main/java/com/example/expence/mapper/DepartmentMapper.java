package com.example.expence.mapper;

import com.example.expence.pojo.Announcement;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * @author yourkin666
 * @date 2024/05/21/11:56
 * @description
 */
@Mapper
public interface DepartmentMapper {
    @Insert("insert into announcement (title, content, dp_name) values (#{title}, #{content}, #{dpName}) ")
    void addAnnouncement(String title, String content, String dpName);
    @Select("select name from department where employee_name = #{username} ")
    String selectDpName(Object username);
    @Select("select * from announcement where dp_name = #{dpName}")
    List<Announcement> selectAnnoucement(String dpName);
    @Select("select employee_name from department where name = #{dpName}")
    List<String> selectMembers(String dpName);
    @Select("select name from department where employee_name = #{username}")
    String selectDepartment(Object username);
}
