package com.sspku.dao;

import com.sspku.dto.CommonQuestionDTO;
import com.sspku.model.CommonQuestionDO;

import java.util.List;

/**
 * @Author: jiangyuzhao
 * @Date: 2019.8.26
 */
public interface CommonQuestionDAO {
    public List<CommonQuestionDO> getCommonQuestion(CommonQuestionDTO commonQuestionDTO);
}


/**
 * when you invoke commonQustionDAO.getCommonQuestionByKeywords
 */