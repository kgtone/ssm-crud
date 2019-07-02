package com.kgtone.crud.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.kgtone.crud.bean.Employee;
import com.kgtone.crud.bean.Msg;
import com.kgtone.crud.service.EmployeeService;
/**
 * 处理员工CRUD请求
 * @author kgtone
 *
 */
@Controller
public class EmployeeController {
	@Autowired
	EmployeeService employeeService;
	
	@ResponseBody
	@RequestMapping(value="/delete_emp/{id}",method=RequestMethod.DELETE)
	public Msg deleteEmp(@PathVariable("id")Integer id) {
		employeeService.deleteEmp(id);
		return Msg.success();
	}
	
	
	
	
	/**
	 * 更新单个员工数据
	 * @param emp
	 * @param result
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/update_emp",method=RequestMethod.POST)
	public Msg updateEmp(@Valid Employee emp,BindingResult result) {
		if(result.hasErrors()) {
			List<FieldError> errors = result.getFieldErrors();
			Map<String,Object> map = new HashMap<>();
			for (FieldError fieldError : errors) {
				map.put(fieldError.getField(), fieldError.getDefaultMessage());
			}
			return Msg.fail().add("errorFields", map);
		}else {
			employeeService.updateEmp(emp);
			return Msg.success();	
		}
	}
	
	
	/**
	 * 查询单个员工信息
	 * @param id
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/emp/{id}",method=RequestMethod.GET)
	public Msg getEmp(@PathVariable("id")Integer id) {
		Employee employee = employeeService.getEmp(id);
		return Msg.success().add("emp", employee);
	}
	
	/**
	 * 检查用户名是否可用
	 * @param empName
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/checkUser")
	public Msg checkUser(@RequestParam("empName")String empName) {
		//先判断用户名是否是合法的表达式
		String regx="(^[a-zA-Z0-9_-]{6,16}$)|(^[\\u2E80-\\u9FFF]{2,5})";
		if(!empName.matches(regx)) {
			return Msg.fail().add("va_msg", "用户名必须是6-16位数字和字母的组合或者2-5位中文");
		}
		//数据库用户名重复校验
		boolean b=employeeService.checkUser(empName);
		if(b) {
			return Msg.success();	
		}else {
			return Msg.fail().add("va_msg", "用户名不可用");
		}
		
	}
	
	@ResponseBody
	@RequestMapping(value="/emp",method=RequestMethod.POST)
	public Msg saveEmp(@Valid Employee emp, BindingResult result) {
		if(result.hasErrors()) {
			List<FieldError> errors = result.getFieldErrors();
			Map<String,Object> map = new HashMap<>();
			for (FieldError fieldError : errors) {
				//System.out.println("错误的字段名："+fieldError.getField());
				//System.out.println("错误信息"+fieldError.getDefaultMessage());
				map.put(fieldError.getField(), fieldError.getDefaultMessage());
			}
			return Msg.fail().add("errorFields", map);
		}else {
			employeeService.addEmp(emp);
			return Msg.success();	
		}
		
	}
	
	
	@ResponseBody
	@RequestMapping("/emps")
	public Msg getEmpsWithJson(@RequestParam(value="pn",defaultValue="1")Integer pn) {
		//引入pageHelper分页插件
		//在查询之前只需要调用，传入页码，以及每页的大小
		PageHelper.startPage(pn, 7);
		PageHelper.orderBy("emp_id asc");
		//startPage后面紧跟着的这个查询就是分页查询
		List<Employee> emps= employeeService.getAll();
		//使用PageInfo来包装查询后的结果,只需要将PageInfo交给页面就行了
		//封装了详细的分页信息，包括我们查询出来的数据,传入连续显示的页数
		PageInfo<Employee> page=new PageInfo<Employee>(emps,5);
		return Msg.success().add("pageInfo", page);
	}
	
	/**
	 * 查询员工数据（分页查询）
	 * @return
	 */
	//@RequestMapping("/emps")
	public String Query(@RequestParam(value="pn",defaultValue="1")Integer pn,
			Model model) {
		
		//引入pageHelper分页插件
		//在查询之前只需要调用，传入页码，以及每页的大小
		PageHelper.startPage(pn, 7);
		//startPage后面紧跟着的这个查询就是分页查询
		List<Employee> emps= employeeService.getAll();
		//使用PageInfo来包装查询后的结果,只需要将PageInfo交给页面就行了
		//封装了详细的分页信息，包括我们查询出来的数据,传入连续显示的页数
		PageInfo<Employee> page=new PageInfo<Employee>(emps,5);
		model.addAttribute("pageInfo", page);
		return "list";
	}
}
