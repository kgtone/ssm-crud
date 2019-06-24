package com.kgtone.crud.test;

import java.util.UUID;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kgtone.crud.bean.Employee;
import com.kgtone.crud.dao.DepartmentMapper;
import com.kgtone.crud.dao.EmployeeMapper;

/**
 *  Test the class under the package dao works good or bad
 * @author kgtone
 *
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"classpath:applicationContext.xml"})
public class MapperTest {
	@Autowired
	private DepartmentMapper departmentMapper;
	
	@Autowired
	private EmployeeMapper employeeMapper;
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Test
	public void testCRUD() {
//		//1.创建springIOC容器
//		String[] configLocation= {"applicationContext.xml","mybatis-config.xml"};
//		ApplicationContext applicationContext = new ClassPathXmlApplicationContext(configLocation);
//		//2.从容器中获取mapper
//		DepartmentMapper mapper=applicationContext.getBean(DepartmentMapper.class);

//		departmentMapper.insertSelective(new Department(1,"开发部"));
//		departmentMapper.insertSelective(new Department(2,"测试部"));
//		List<Department> lst=departmentMapper.selectByExample(null);
//		for(Department department:lst){
//			System.out.println(department.getDeptName());
//		}
		//employeeMapper.insertSelective(new Employee(null,"kgtone","M","kgtone@kgtone.com",1));
		EmployeeMapper mapper= sqlSessionTemplate.getMapper(EmployeeMapper.class);
		for(int i=0;i<1000;i++) {
			String empName=UUID.randomUUID().toString().substring(0,5)+i;
			if(i%2==1) {
				mapper.insertSelective(new Employee(null,empName,"M",empName+"@kgtone.com",i%3%2));	
			}else {
				mapper.insertSelective(new Employee(null,empName,"F",empName+"@kgtone.com",i%5%2));
			}
		}
		
	}
}
