package com.boco.service.impl;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.boco.commons.result.PageInfo;
import com.boco.mapper.ExamMapper;
import com.boco.model.Exam;
import com.boco.service.IExamService;

@Service
public class ExamServiceImpl extends ServiceImpl<ExamMapper,Exam> implements IExamService {


@Override
public void selectDataGrid(PageInfo pageInfo) {
	     Page<Exam> page = new Page<Exam>(pageInfo.getNowpage(), pageInfo.getSize());
	        EntityWrapper<Exam> wrapper = new EntityWrapper<Exam>();
	        wrapper.orderBy(pageInfo.getSort(), pageInfo.getOrder().equalsIgnoreCase("ASC"));
	        selectPage(page, wrapper);
	        pageInfo.setRows(page.getRecords());
	        pageInfo.setTotal(page.getTotal());
		
	}


}
