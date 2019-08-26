package com.sspku.dao;


import com.sspku.dto.StudentInformationDTO;
import com.sspku.model.StudentInformationDO;

import java.util.List;

public interface StudentInformationDAO {

    public List<StudentInformationDO> getStudentInformation(StudentInformationDTO studentInformationDTO);
}

