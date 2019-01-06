package com.boco.test;

import org.junit.Test;

import com.boco.commons.result.PageInfo;
import com.boco.service.IExamService;
import com.boco.service.ISysLogService;
import com.boco.service.impl.ExamServiceImpl;
import com.boco.service.impl.SysLogServiceImpl;
import com.boco.test.base.BaseTest;

public class exam extends BaseTest{
	
	
	@Test
	public void index() {
		ISysLogService yy=new SysLogServiceImpl();
    IExamService xx=new ExamServiceImpl();
	PageInfo pageInfo=null;
	xx.selectDataGrid(pageInfo);
	}
}
