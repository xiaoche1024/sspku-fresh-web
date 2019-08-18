package com.sspku.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @Description: TODO
 * @Author: xiaoche
 * @Date: 2019/8/18 21:15
 */
@Controller
public class CommonController {

    @RequestMapping("/")
    public String home(){
        return "index";
    }
}
