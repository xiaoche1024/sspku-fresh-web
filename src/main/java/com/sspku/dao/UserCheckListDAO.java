package com.sspku.dao;

import com.sspku.dto.UserCheckListDTO;
import com.sspku.model.UserCheckListDO;

import java.util.List;

public interface UserCheckListDAO {

    public List<UserCheckListDO> getUserCheckList(UserCheckListDTO userCheckListDTO);

}
