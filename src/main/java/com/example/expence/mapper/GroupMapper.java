package com.example.expence.mapper;

import com.example.expence.pojo.Task;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

/**
 * @author yourkin666
 * @date 2024/05/21/21:40
 * @description
 */
@Mapper
public interface GroupMapper {
    @Insert("insert into `group` (name) values (#{name})")
    void foundGroup(String name);
    @Update("update user set group_name = #{name} where username = #{member} ")
    void addMember(String name, String member);
    @Select("select name from `group`")
    List<String> selectGroups();
    @Insert("insert into task (content, group_name, process) values (#{content}, #{groupName}, 0)")
    void addTask(String content, String groupName);
    @Select("select id, content, process from task where group_name = #{groupName}")
    List<Task> selectTask(String groupName);
    @Select("select id, content, process from task where group_name = #{groupName}")
    List<Task> selectAllTasks(String groupName);
    @Update("update task set content = #{content} where id = #{id} ")
    void updateTask(String content, String id);
    @Update("update task set process = #{status} where id = #{id}")
    void updateProcess(int id, String status);
    @Select("select group_name from user where id = #{id}")
    String selectGroup(Object id);
    @Select(("select process from task where id = #{id}"))
    String selectProcess(String id);
}
