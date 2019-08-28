package com.sspku.service;

import com.sspku.dto.CheckListDTO;
import com.sspku.model.CheckListDO;

import java.util.List;

public interface CheckListService {
    public List<CheckListDO> getCheckList(CheckListDTO checkListDTO);
}