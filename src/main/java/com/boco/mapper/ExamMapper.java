package com.boco.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.boco.model.Exam;


/**
 *
 * Role 表数据库控制层接口
 *
 */
public interface ExamMapper extends BaseMapper<Exam> {

	 Exam selectExamById(@Param("id") Long id);

}