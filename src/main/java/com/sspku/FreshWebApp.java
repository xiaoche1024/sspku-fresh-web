package com.sspku;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * @Description: TODO
 * @Author: xiaoche
 * @Date: 2019/8/18 21:06
 */
@SpringBootApplication
@MapperScan(basePackages = "com.sspku.dao")
public class FreshWebApp {

    public static void main(String[] args) {
        SpringApplication.run(FreshWebApp.class, args);
    }
}
