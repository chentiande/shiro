package com.boco.service;

import com.baomidou.mybatisplus.service.IService;
import com.boco.commons.result.PageInfo;
import com.boco.model.SysLog;

/**
 *
 * SysLog 表数据服务层接口
 *
 */
public interface ISysLogService extends IService<SysLog> {

    void selectDataGrid(PageInfo pageInfo);

}