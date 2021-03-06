package com.kgtone.crud.test;

import java.util.Iterator;
import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import com.github.pagehelper.PageInfo;
import com.kgtone.crud.bean.Employee;

/**
 * 使用spring模块测试请求功能
 * @author kgtone
 *
 */
@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({"classpath:applicationContext.xml","classpath:spring-mvc.xml"})
public class MvcTest {
	private MockMvc mockMvc;
	@Autowired
	private WebApplicationContext context;
	
	@Before
	public void initMockMvc() {
		mockMvc=MockMvcBuilders.webAppContextSetup(context).build();
	}
	
	@Test
	public void testMVC() throws Exception{
		MvcResult result=mockMvc.perform(MockMvcRequestBuilders.get("/emps").param("pn", "1")).andReturn();
		//请求成功后，请求域中会有pageInfo对象，我们可以取出pageInfo进行验证
		System.out.println(result.getResponse().getContentAsString());
		
//		MockHttpServletRequest request = result.getRequest();
//		PageInfo pi = (PageInfo) request.getAttribute("pageInfo");
//		System.out.println("当前页码"+pi.getPageNum());
//		System.out.println("总页码"+pi.getPages());
//		System.out.println("总记录数"+pi.getTotal());
//		System.out.print("在页面需要连续显示的页码：");
//		int[] nums=pi.getNavigatepageNums();
//		for (int i : nums) {
//			System.out.print(" "+i);
//		}
//		System.out.println();
//		
//		//获取员工数据
//		List<Employee> emps = pi.getList();
//		for (Employee employee : emps) {
//			System.out.println("ID:"+employee.getEmpId()+"==>Name:"+employee.getEmpName());
//		}
		
	}
}
