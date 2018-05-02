package com.jk.dao;

import com.jk.model.News;
import com.jk.model.User;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Created by Administrator on 2018/4/25.
 */
@Mapper
@Component
public interface INewDao {
    @Select("select * from news")
    List<News> queryNews();
    @Insert("insert into news values(#{newsid},#{newsname},#{publishtime},#{content})")
    void addxinwen(News news);
    @Delete("delete from news where newsid=#{newsid}")
    void deleteNews(Integer newsid);
    @Select("select * from news where newsid=#{newsid}")
    News queryByIdNews(Integer newsid);
    @Update("update news set newsname=#{newsname},publishtime=#{publishtime},content=#{content} where newsid=#{newsid}")
    void updateNews(News news);
    @Select("select * from news where newsid=#{newsid}")
    News queryXinfo(Integer newsid);
    @Select("select * from t_user where username=#{username}")
    List<User> queryname(String username)


    ;

    
}
