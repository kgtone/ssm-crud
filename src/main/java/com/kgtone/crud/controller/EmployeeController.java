package com.kgtone.crud.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.kgtone.crud.bean.Employee;
import com.kgtone.crud.service.EmployeeServicer;
/**
 * 处理员工CRUD请求
 * @author kgtone
 *
 */
@Controller
public class EmployeeController {
	@Autowired
	EmployeeServicer employeeService;
	
	/**
	 * 查询员工数据（分页查询）
	 * @return
	 */
	@RequestMapping("/emps")
	public String Query(@RequestParam(value="pn",defaultValue="1")Integer pn,
			Model model) {
		
		//引入pageHelper分页插件
		//在查询之前只需要调用，传入页码，以及每页的大小
		PageHelper.startPage(pn, 7);
		//startPage后面紧跟着的这个查询就是分页查询
		List<Employee> emps= employeeService.getAll();
		//使用PageInfo来包装查询后的结果,只需要将PageInfo交给页面就行了
		//封装了详细的分页信息，包括我们查询出来的数据,传入连续显示的页数
		PageInfo page=new PageInfo(emps,5);
		model.addAttribute("pageInfo", page);
		return "list";
	}
}
