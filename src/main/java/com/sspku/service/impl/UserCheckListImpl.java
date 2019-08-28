package com.sspku.service.impl;

import com.sspku.dao.UserCheckListDAO;
import com.sspku.dto.UserCheckListDTO;
import com.sspku.model.UserCheckListDO;
import com.sspku.service.UserCheckListService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class UserCheckListImpl implements UserCheckListService {
    @Autowired
    private UserCheckListDAO userCheckListDAO;

    @Override
    public List<UserCheckListDO> getUserCheckList(UserCheckListDTO userCheckListDTO) {
        return userCheckListDAO.getUserCheckList(userCheckListDTO);
    }
}