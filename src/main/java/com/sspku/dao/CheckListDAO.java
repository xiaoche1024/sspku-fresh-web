package com.sspku.dao;

import com.sspku.dto.CheckListDTO;
import com.sspku.model.CheckListDO;

import java.util.List;

public interface CheckListDAO {

    public List<CheckListDO> getCheckList(CheckListDTO checkListDTO);

}

