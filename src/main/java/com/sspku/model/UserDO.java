package com.sspku.model;

import lombok.Data;

/**
 * @Description: TODO
 * @Author: xiaoche
 * @Date: 2019/8/18 21:18
 */
@Data
public class UserDO {

    private Integer id;
    private String userName;
    private String password;
    private String mobile;
    private String email;
    private String sex;
    private String nickName;

}
