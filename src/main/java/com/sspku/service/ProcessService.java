package com.sspku.service;

import com.sspku.dto.ProcessDTO;
import com.sspku.model.ProcessDO;

import java.util.List;

public interface ProcessService {
    public List<ProcessDO> getProcess(ProcessDTO processDTO);
}