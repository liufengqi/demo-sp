package com.jk.model;

import java.io.Serializable;

/**
 * Created by Administrator on 2018/4/25.
 */

public class News implements Serializable {
    private Integer newsid;
    private String newsname;
    private String publishtime;
    private String content;
    public News(){

    }

    public Integer getNewsid() {
        return newsid;
    }

    public void setNewsid(Integer newsid) {
        this.newsid = newsid;
    }

    public String getNewsname() {
        return newsname;
    }

    public void setNewsname(String newsname) {
        this.newsname = newsname;
    }

    public String getPublishtime() {
        return publishtime;
    }

    public void setPublishtime(String publishtime) {
        this.publishtime = publishtime;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    @Override
    public String toString() {
        return "News{" +
                "newsid=" + newsid +
                ", newsname='" + newsname + '\'' +
                ", publishtime='" + publishtime + '\'' +
                ", content='" + content + '\'' +
                '}';
    }
}
