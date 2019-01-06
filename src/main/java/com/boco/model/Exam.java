package com.boco.model;

import java.io.Serializable;

import com.boco.commons.utils.JsonUtils;

/**
 * 试题
 */
public class Exam implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 主键id
     */
    private Long id;

    /**
     * 题目
     */
    private String question;

    /**
     * 答案
     */
    private String answer;



    public Long getId() {
		return id;
	}



	public void setId(Long id) {
		this.id = id;
	}



	public String getQuestion() {
		return question;
	}



	public void setQuestion(String question) {
		this.question = question;
	}



	public String getAnswer() {
		return answer;
	}



	public void setAnswer(String answer) {
		this.answer = answer;
	}



	@Override
    public String toString() {
        return JsonUtils.toJson(this);
    }
}
