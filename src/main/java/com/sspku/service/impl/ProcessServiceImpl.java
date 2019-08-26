package com.sspku.service.impl;

import com.sspku.dao.ProcessDAO;
import com.sspku.dto.ProcessDTO;
import com.sspku.model.ProcessDO;
import com.sspku.service.ProcessService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class ProcessServiceImpl implements ProcessService {
    @Autowired
    private ProcessDAO processDAO;

    @Override
    public List<ProcessDO> getProcess(ProcessDTO processDTO) {
        return processDAO.getProcess(processDTO);
    }
}
