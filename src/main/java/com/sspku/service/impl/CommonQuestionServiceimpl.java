package com.sspku.service.impl;

import com.sspku.dao.CommonQuestionDAO;
import com.sspku.dto.CommonQuestionDTO;
import com.sspku.model.CommonQuestionDO;
import com.sspku.service.CommonQuestionService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class CommonQuestionServiceimpl implements CommonQuestionService {
    @Autowired
    private CommonQuestionDAO commonQuestionDAO;

    @Override
    public List<CommonQuestionDO> getCommonQuestions(CommonQuestionDTO commonQuestionDTO) {
        return commonQuestionDAO.getCommonQuestion(commonQuestionDTO);
    }
}
