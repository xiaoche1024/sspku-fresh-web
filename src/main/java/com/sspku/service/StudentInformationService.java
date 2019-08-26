package com.sspku.service;


import com.sspku.dto.StudentInformationDTO;
import com.sspku.model.StudentInformationDO;

import java.util.List;

public interface StudentInformationService {
    public List<StudentInformationDO> getStudentInformation(StudentInformationDTO studentInformationDTO);
}