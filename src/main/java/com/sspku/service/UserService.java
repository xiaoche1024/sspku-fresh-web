package com.sspku.service;

import com.sspku.dto.UserDTO;
import com.sspku.model.UserDO;

import java.util.List;

/**
 * @Description: TODO
 * @Author: xiaoche
 * @Date: 2019/8/18 21:25
 */
public interface UserService {

    public List<UserDO> getUsers(UserDTO userDTO);
}
