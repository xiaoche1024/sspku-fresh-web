package com.sspku.model;

import java.util.LinkedList;
import java.util.List;

public class CommonQuestionDO {
    private List<String> keywords;
    private String question;
    private String answer;

    public CommonQuestionDO() {
        keywords = new LinkedList<>();
    }

    public void addKeywords(List<String> keywords) {
        for (String keyword: keywords) {
            addKeyword(keyword);
        }
    }

    private void addKeyword(String keyword) {
        this.keywords.add(keyword);
    }

    public List<String> getKeywords() {
        return this.keywords;
    }

    public void reset() {
        keywords.clear();
        question = "";
        answer = "";
    }

    public String getAnswer() {
        return answer;
    }

    public String getQuestion() {
        return question;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }

    public void setQuestion(String question) {
        this.question = question;
    }
}
