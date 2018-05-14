package com.jk.service.impl;

import com.jk.dao.INewDao;
import com.jk.model.News;
import com.jk.model.User;
import com.jk.service.INewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by Administrator on 2018/4/25.
 */
@Service
public class NewsServiceImpl implements INewsService {

    @Autowired
    private INewDao iNewDao;

    @Override
    public List<News> queryNews() {
        return iNewDao.queryNews();
    }

    @Override
    public void addxinwen(News news){

        iNewDao.addxinwen(news);
    }

    @Override
    public void deleteNews(Integer newsid) {
        iNewDao.deleteNews(newsid);
    }




    @Override
    public News queryByIdNews(Integer newsid) {
        return iNewDao.queryByIdNews(newsid);
    }

    @Override
    public void updateNews(News news) {
        iNewDao.updateNews(news);
    }

    @Override
    public News queryXinfo(Integer newsid) {
        return iNewDao.queryXinfo(newsid);
    }

    @Override
    public String selectUser(User user, HttpServletRequest request) {
        System.err.println("aaaaaaaa"+user);
        request.getSession().setAttribute("user",user);

     /*   HttpSession session = request.getSession();*/

        String falg = "0";
        List<User> list = iNewDao.queryname(user.getUsername());
        if (list.size() > 0){
            falg = "1";
            User us = list.get(0);
            if (user.getUserpass().equals(us.getUserpass())){
                falg = "2";
            }
        }
        return falg;
    }

}
