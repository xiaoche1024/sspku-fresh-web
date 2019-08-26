package com.sspku.dao;

import com.sspku.dto.ProcessDTO;
import com.sspku.model.ProcessDO;

import java.util.List;

public interface ProcessDAO {

    public List<ProcessDO> getProcess(ProcessDTO processDTO);
}

