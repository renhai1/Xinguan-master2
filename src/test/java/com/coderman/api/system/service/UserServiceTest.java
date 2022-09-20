package com.coderman.api.system.service;

import com.coderman.api.common.pojo.system.User;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
@Slf4j
public class UserServiceTest {
    @Autowired
    private UserService userService;

    @Test
    void findUserByName() {
        User user = userService.findUserByName("admin");
        log.info("user={}",user);
    }

}

