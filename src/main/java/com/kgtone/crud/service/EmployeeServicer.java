package com.kgtone.crud.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kgtone.crud.bean.Employee;
import com.kgtone.crud.dao.EmployeeMapper;

@Service
public class EmployeeServicer {
	@Autowired
	EmployeeMapper employeeMapper;
	/**
	 * 查询所有员工
	 * @return
	 */
	public List<Employee> getAll(){
		return employeeMapper.selectByExampleWithDept(null);
		
	}
}
