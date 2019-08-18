package com.sspku.service.impl;

import com.sspku.dao.UserDAO;
import com.sspku.dto.UserDTO;
import com.sspku.model.UserDO;
import com.sspku.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Description: TODO
 * @Author: xiaoche
 * @Date: 2019/8/18 21:26
 */
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDAO userDAO;

    @Override
    public List<UserDO> getUsers(UserDTO userDTO) {
        return userDAO.getUsers(userDTO);
    }
}
