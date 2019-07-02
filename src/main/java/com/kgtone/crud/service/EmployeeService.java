package com.kgtone.crud.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kgtone.crud.bean.Employee;
import com.kgtone.crud.bean.EmployeeExample;
import com.kgtone.crud.bean.EmployeeExample.Criteria;
import com.kgtone.crud.dao.EmployeeMapper;

@Service
public class EmployeeService {
	@Autowired
	EmployeeMapper employeeMapper;
	/**
	 * 查询所有员工
	 * @return
	 */
	public List<Employee> getAll(){
//		EmployeeExample employeeExample= new EmployeeExample();
//		employeeExample.setOrderByClause("emp_id desc");
		return employeeMapper.selectByExampleWithDept(null);
		
	}
	/**
	 * 保存单个员工信息
	 * @param emp
	 */
	public void addEmp(Employee emp) {
		employeeMapper.insertSelective(emp);
		
	}
	
	/**
	 * 检验用户名是否可用
	 * @param empName
	 * @return true代表当前姓名可用，否则代表当前姓名不可用
	 */
	public boolean checkUser(String empName) {
		
		EmployeeExample example= new EmployeeExample();
		Criteria criteria = example.createCriteria();
		criteria.andEmpNameEqualTo(empName);
		long count = employeeMapper.countByExample(example);
		return count==0;
	}
	
	/**
	 * 按照员工id查询员工
	 * @param id
	 * @return
	 */
	public Employee getEmp(Integer id) {
		return employeeMapper.selectByPrimaryKey(id);
	}
	

	/**
	 * 更新单个员工的信息
	 * @param employee
	 */
	public void updateEmp(Employee employee) {
		employeeMapper.updateByPrimaryKeySelective(employee);
	}
	
	/**
	 * 删除单个员工的信息
	 * @param id
	 */
	public void deleteEmp(Integer id) {
		employeeMapper.deleteByPrimaryKey(id);
	}
	
	
}
