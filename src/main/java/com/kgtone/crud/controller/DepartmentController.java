package com.kgtone.crud.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kgtone.crud.bean.Msg;
import com.kgtone.crud.service.DepartmentService;

/**
 *  *处理和部门有关的请求
 * @author kgtone
 *
 */
@Controller
public class DepartmentController {
	@Autowired
	private DepartmentService departmentService;
	
	@ResponseBody
	@RequestMapping("/depts")
	public Msg getDepts() {
		return Msg.success().add("depts", departmentService.getDepts());
	}
}
