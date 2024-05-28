package com.example.demo.mapper;

import com.example.demo.pojo.Announcement;
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
    @Insert("insert into oa.announcement (title, content, dp_name) values (#{title}, #{content}, #{dpName}) ")
    void addAnnouncement(String title, String content, String dpName);
    @Select("select name from department where employee_name = #{username} ")
    String selectDpName(Object username);
    @Select("select * from oa.announcement where dp_name = #{dpName}")
    List<Announcement> selectAnnoucement(String dpName);
    @Select("select username from oa.user where dp_name = #{dpName}")
    List<String> selectMembers(String dpName);
    @Select("select name from oa.department where employee_name = #{username}")
    String selectDepartment(Object username);
}
