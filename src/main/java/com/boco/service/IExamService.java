package com.boco.service;

import com.baomidou.mybatisplus.service.IService;
import com.boco.commons.result.PageInfo;
import com.boco.model.Exam;


/**
 *
 * ExamTest 表数据服务层接口
 *
 */
public interface IExamService extends IService<Exam> {

    void selectDataGrid(PageInfo pageInfo);

}