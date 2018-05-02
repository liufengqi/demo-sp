package com.jk;

import com.jk.model.User;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest
public class mongodbTest {

    @Autowired
    private MongoTemplate mongoTemplate;


    @Test
    public void saveTest(){

        User user = new User();

        user.setUserid(1);
        user.setUsername("李四");
        user.setUserpass("123");
        mongoTemplate.save(user);
    }

}
