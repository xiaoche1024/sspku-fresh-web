package com.sspku.service;


import com.sspku.dto.CommonQuestionDTO;
import com.sspku.model.CommonQuestionDO;

import java.util.List;

public interface CommonQuestionService {
    public List<CommonQuestionDO> getCommonQuestions(CommonQuestionDTO commonQuestionDTO);
}
