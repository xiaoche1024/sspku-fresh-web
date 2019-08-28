package com.sspku.service.impl;

import com.sspku.dao.CheckListDAO;
import com.sspku.dto.CheckListDTO;
import com.sspku.model.CheckListDO;
import com.sspku.service.CheckListService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class CheckListImpl implements CheckListService {
    @Autowired
    private CheckListDAO checkListDAO;

    @Override
    public List<CheckListDO> getCheckList(CheckListDTO checkListDTO) {
        return checkListDAO.getCheckList(checkListDTO);
    }
}
