package com.sspku.controller;

import com.sspku.model.UserDO;
import com.sspku.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @Description: TODO
 * @Author: xiaoche
 * @Date: 2019/8/18 21:10
 */
@Controller
@RequestMapping("user")
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping("/getUsers")
    @ResponseBody
    public Object home() {
        List<UserDO> users = userService.getUsers(null);
        return users;
    }
}
