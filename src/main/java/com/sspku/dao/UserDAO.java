package com.sspku.dao;

import com.sspku.dto.UserDTO;
import com.sspku.model.UserDO;

import java.util.List;

/**
 * @Description: TODO
 * @Author: xiaoche
 * @Date: 2019/8/18 21:19
 */
public interface UserDAO {

    public List<UserDO> getUsers(UserDTO userDTO);
}
