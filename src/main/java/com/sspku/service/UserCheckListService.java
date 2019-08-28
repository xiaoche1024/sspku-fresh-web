package com.sspku.service;

import com.sspku.dto.UserCheckListDTO;
import com.sspku.model.UserCheckListDO;

import java.util.List;

public interface UserCheckListService {
    public List<UserCheckListDO> getUserCheckList(UserCheckListDTO userCheckListDTO);
}
