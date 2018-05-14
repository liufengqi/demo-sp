package com.jk.model;


import org.springframework.data.mongodb.core.mapping.Document;

public class Aop {

    private String user;

    @Override
    public String toString() {
        return "Aop{" +
                "user='" + user + '\'' +
                '}';
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }
}
