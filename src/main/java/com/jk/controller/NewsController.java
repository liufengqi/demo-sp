
package com.jk.controller;

import com.fasterxml.jackson.databind.util.JSONPObject;
import com.jk.model.News;
import com.jk.model.User;
import com.jk.service.INewsService;
import com.mongodb.*;
import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import org.apache.catalina.servlet4preview.http.HttpServletRequest;
import org.apache.poi.xwpf.usermodel.*;
import org.openxmlformats.schemas.wordprocessingml.x2006.main.CTShd;
import org.openxmlformats.schemas.wordprocessingml.x2006.main.CTTblWidth;
import org.openxmlformats.schemas.wordprocessingml.x2006.main.STShd;
import org.openxmlformats.schemas.wordprocessingml.x2006.main.STTblWidth;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import java.io.*;
import java.math.BigInteger;
import java.net.UnknownHostException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("news")
public class NewsController {

    @Autowired
    private   INewsService iNewsService;

    @RequestMapping(value="queryNews")
    @ResponseBody
    public List<News> nqueryNews(){

        return   iNewsService.queryNews();
    }

    @RequestMapping(value="/addxinwen")
    @ResponseBody
    public void addxinwen( News news){
        iNewsService.addxinwen(news);

    }
    @RequestMapping(value="/deleteNews")
    @ResponseBody
    public void deleteNews(Integer newsid){
        iNewsService.deleteNews(newsid);
    }

    @RequestMapping(value = "queryByIdNews")
    @ResponseBody
    public News queryByIdNews(Integer newsid){
        return iNewsService.queryByIdNews(newsid);
    }


    @RequestMapping(value = "updateNews")
    @ResponseBody
    public void updateNews(News news){
        iNewsService.updateNews(news);
    }

    @RequestMapping(value = "selectUser")
    @ResponseBody
    public String selectUser(User user,HttpServletRequest request){
        System.err.println(user);
        String falg = "";
        falg = iNewsService.selectUser(user,request);
        return falg;
    }

    @RequestMapping(value = "insertmong")
    @ResponseBody
    public String insertmong(){
        Mongo mong;
        String st="";
        try {
            mong = new Mongo("localhost", 27017);
            DB db = mong.getDB("test");
            DBCollection books = db.getCollection("user");

            String map = "function() { "+
                    "var category; " +
                    "if ( this.ztid >1 ) "+
                    "category = '成功次数'; " +
                    "else " +
                    "category = '失败次数'; "+
                    "emit(category, {name:1});}";

            String reduce = "function(key, values) { " +
                    "var sum = 0; " +
                    "values.forEach(function(doc) { " +
                    "sum += 1;"+
                    "}); " +
                    "return {books: sum};} ";

            MapReduceCommand cmd = new MapReduceCommand(books, map, reduce,
                    null, MapReduceCommand.OutputType.INLINE, null);

            MapReduceOutput out = books.mapReduce(cmd);
            String replace ="";

            for (DBObject o : out.results()) {
                String[] split = o.toString().split(":");//冒号切割
                System.err.println("aaaaaaaaaaaaaaaaaa"+o);
                System.err.println("bbbbbbbbbbbbbbbbbb"+split[3].replace("}}", " "));
                replace = split[3].replace("}}", " ");//转换
                String[] split2 = split[1].split(",");
                String [] split3=split2[0].split("\"");//转译切
                System.err.println("kkkkkkkkkkkkkk"+replace);
                st+="["+"\""+split3[1]+"\""+","+Double.parseDouble(replace)+"]";//拼值
            }

        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return  "["+st.replace("][", "],[")+"]";
    }

}
