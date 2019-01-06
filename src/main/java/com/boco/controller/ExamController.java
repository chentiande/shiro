package com.boco.controller;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.boco.commons.base.BaseController;
import com.boco.commons.result.PageInfo;
import com.boco.model.Exam;
import com.boco.service.IExamService;



/**
 * @description：日志管理
 * @author：zhixuan.wang
 * @date：2015/10/30 18:06
 */
@Controller
@RequestMapping("/exam")
public class ExamController extends BaseController{
	
@Autowired
private IExamService examService;
    
    
    @GetMapping("/manager")
    public String manager() {
    	 return "admin/exam/exam";
    }

    @PostMapping("/dataGrid")
    @ResponseBody
    public PageInfo dataGrid(Integer page, Integer rows, 
            @RequestParam(value = "sort", defaultValue = "create_time") String sort, 
            @RequestParam(value = "order", defaultValue = "DESC") String order) {
        PageInfo pageInfo = new PageInfo(page, rows, sort, order);
        examService.selectDataGrid(pageInfo);
               return pageInfo;
    }
    
    /**
     * 添加试题页
     *
     * @return
     */
    @GetMapping("/addPage")
    public String addPage() {
        return "admin/exam/examAdd";
    }

    /**
     * 添加试题
     *
     * @param exam
     * @return
     */
    @PostMapping("/add")
    @ResponseBody
    public Object add(@Valid Exam exam) {
       
        examService.insert(exam);
       
        return renderSuccess("添加成功");
    }

    /**
     * 编辑试题页
     *
     * @param id
     * @param model
     * @return
     */
    @GetMapping("/editPage")
    public String editPage(Model model, Long id) {
        Exam  exam= examService.selectById(id);

        model.addAttribute("exam", exam);
        return "admin/exam/examEdit";
    }

    /**
     * 编辑试题
     *
     * @param userVo
     * @return
     */
    @RequiresRoles("admin")
    @PostMapping("/edit")
    @ResponseBody
    public Object edit(@Valid Exam exam) {
        examService.updateById(exam);
     return renderSuccess("修改成功！");
    }

   
    /**
     * 删除试题
     *
     * @param id
     * @return
     */
    @RequiresRoles("admin")
    @PostMapping("/delete")
    @ResponseBody
    public Object delete(Long id) {
      
        examService.deleteById(id);
        return renderSuccess("删除成功！");
    }
}
