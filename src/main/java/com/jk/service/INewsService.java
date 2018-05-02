package com.jk.service;

import com.jk.model.News;
import com.jk.model.User;
import org.springframework.stereotype.Repository;

import javax.servlet.http.HttpServletRequest;
import java.util.List;


/**
 * Created by Administrator on 2018/4/25.
 */
public interface INewsService {

    List<News> queryNews();


    void addxinwen(News news);

    void deleteNews(Integer newsid);

    News queryByIdNews(Integer newsid);

    void updateNews(News news);

    News queryXinfo(Integer newsid);

    String selectUser(User user, HttpServletRequest request);
}
