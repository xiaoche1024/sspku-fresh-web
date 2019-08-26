package com.sspku.service.impl;

import com.sspku.dao.StudentInformationDAO;
import com.sspku.dto.StudentInformationDTO;
import com.sspku.model.StudentInformationDO;
import com.sspku.service.StudentInformationService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class StudentInformationImpl implements StudentInformationService {
    @Autowired
    private StudentInformationDAO studentInformationDAO;

    @Override
    public List<StudentInformationDO> getStudentInformation(StudentInformationDTO studentInformationDTO) {
        return studentInformationDAO.getStudentInformation(studentInformationDTO);
    }
}
