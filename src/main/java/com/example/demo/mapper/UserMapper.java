package com.example.demo.mapper;

import com.example.demo.pojo.User;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

@Mapper
public interface UserMapper {
    @Select("select * from user where username = #{userName}")
    public User selectUser(String userName);
    @Insert("insert into user(username, password, salt, role, create_time, update_time)"
            +"values(#{userName}, #{password}, #{salt}, #{role}, now(), now())")
    public void insertUser(String userName, String password, String salt, String role);
    @Update(("update user set email = #{email},create_time =now() where id = #{id}"))
    public void updateUser(User user);
    @Update("update user set user_pic = #{url},create_time =now() where id = #{id}")
    void updateAvatar(String url, Object id);
    @Update("update user set password = #{password}, update_time = now() where id = #{id}")
    void updatePwd(String password, Object id);
    @Select("select salt from user where username = #{userName}")
    String getSalt(String userName);
    @Select("select role from user where id = #{id}")
    String selectRoleById(Object id);
}
