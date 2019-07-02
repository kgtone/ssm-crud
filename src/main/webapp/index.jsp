<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- import bootstrap,jquery -->
<script type="text/javascript"
	src="${APP_PATH}/static/js/jquery-1.12.4.min.js"></script>
<link
	href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>


<title>list</title>
</head>
<body>
	<!-- 员工修改的模态框 -->
	<div class="modal fade" id="empUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">员工修改</h4>
	      </div>
	      <div class="modal-body">
			<form class="form-horizontal">
			  <div class="form-group">
			    <label for="empName_update_static" class="col-sm-2 control-label">EmpName</label>
			    <div class="col-sm-10">
			      <p class="form-control-static" id="empName_update_static" name="empName"></p>
			    </div>
			  </div>
			  <div class="form-group">
			    <label for="email_update_input" class="col-sm-2 control-label">Email</label>
			    <div class="col-sm-10">
			      <input type="email" class="form-control" id="email_update_input" name="email" placeholder="Email@kgtone.com">
			      <span class="help-block"></span>
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label">gender</label>
			    <div class="col-sm-10">
					<label class="radio-inline">
					  <input type="radio" name="gender" id="gender_update_input1" value="F"> 女
					</label>
					<label class="radio-inline">
					  <input type="radio" name="gender" id="gender_update_input2" value="M"> 男
					</label>
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label">deptName</label>
			    <div class="col-sm-4">
					<select class="form-control" name="dId"></select>
			    </div>
			  </div>
			</form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	        <button type="button" class="btn btn-primary" id="emp_update_btn">更新</button>
	      </div>
	    </div>
	  </div>
	</div>

	<!-- 员工添加的模态框 -->
	<div class="modal fade" id="empAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">员工添加</h4>
	      </div>
	      <div class="modal-body">
			<form class="form-horizontal">
			  <div class="form-group">
			    <label for="empName_add_input" class="col-sm-2 control-label">EmpName</label>
			    <div class="col-sm-10">
			      <input type="text" class="form-control" id="empName_add_input" name="empName" placeholder="EmpName">
			      <span class="help-block"></span>
			    </div>
			  </div>
			  <div class="form-group">
			    <label for="email_add_input" class="col-sm-2 control-label">Email</label>
			    <div class="col-sm-10">
			      <input type="email" class="form-control" id="email_add_input" name="email" placeholder="Email@kgtone.com">
			      <span class="help-block"></span>
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label">gender</label>
			    <div class="col-sm-10">
					<label class="radio-inline">
					  <input type="radio" name="gender" id="gender_add_input1" value="F"> 女
					</label>
					<label class="radio-inline">
					  <input type="radio" name="gender" id="gender_add_input2" value="M"> 男
					</label>
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label">deptName</label>
			    <div class="col-sm-4">
					<select class="form-control" name="dId"></select>
			    </div>
			  </div>
			</form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal" id="">关闭</button>
	        <button type="button" class="btn btn-primary" id="emp_save_btn">保存</button>
	      </div>
	    </div>
	  </div>
	</div>
	<div class="container">
		<!-- 标题 -->
		<div class="row">
			<div class="col-md-12">
				<h1>SSM-CRUD</h1>
			</div>
		</div>
		<!-- 按钮 -->
		<div class="row">
			<div class="col-md-4 col-md-offset-8">
				<button class="btn btn-primary" id="emp_add_modal_btn">新增</button>
				<button class="btn btn-danger ">删除</button>
			</div>
		</div>
		<!-- 表格数据 -->
		<div class="row">
			<div class="col-md-12">
				<table class="table table-hover">
					<thead>
						<tr>
							<th>#</th>
							<th>empName</th>
							<th>gender</th>
							<th>email</th>
							<th>deptName</th>
							<th>Operate</th>
						</tr>
					</thead>
					<tbody>
					
					</tbody>
				</table>
			</div>
		</div>
		<!-- 显示分页信息 -->
		<div class="row">
			<!-- 分页文字信息 -->
			<div id="page_info_area" class="col-md-6"></div>
			<!-- 分页条信息 -->
			<div id="page_nav_area" class="col-md-6">
			</div>
		</div>
	</div>
</body>
<script>
	var totalRecord
	//页面加载完以后，直接发送一个ajax请求，要到分页数据
	$(function() {
		toPage(1)
	})
	function toPage(pn){
		$("table tbody").empty()
		$("#page_info_area").empty()
		$("#page_nav_area").empty()
		$.ajax({
			type : "GET",
			url : "${APP_PATH}/emps",
			data : "pn="+pn,
			success : function(result) {
				//console.log(rs)
				
				//解析并返回员工数据
				build_emps_table(result)
				//解析并返回分页信息
				build_page_info(result)
				//解析并返回分页条
				build_page_nav(result)
				//添加按钮事件
				add_btn_event()
			}
		})
	}

	function build_emps_table(result) {
		var emps = result.extend.pageInfo.list;
		$.each(emps, function(index, item) {
			//console.log(item.empName)
			var empIdTd = $("<td></td>").append(item.empId)
			var empNameTd = $("<td></td>").append(item.empName)
			
			var genderTd = $("<td></td>").append(item.gender=="M"?"男":"女")
			var emailTd = $("<td></td>").append(item.email)
			var deptNameTd = $("<td></td>").append(item.department.deptName)
			var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
							.append($("<span></span>").addClass("glyphicon glyphicon-pencil").attr("aria-hidden","true")).append("编辑")
			editBtn.attr("edit-id",item.empId)//员工id作为编辑按钮的属性
			var delBtn  = $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
							.append($("<span></span>").addClass("glyphicon glyphicon-trash ").attr("aria-hidden","true")).append("删除")
			var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn)
			var empTr = $("<tr></tr>").append(empIdTd).append(empNameTd).append(genderTd).append(emailTd).append(deptNameTd).append(btnTd)
						.appendTo("table tbody")
			
		})
	}

	function build_page_info(result){
		$("#page_info_area").append("当前第" + result.extend.pageInfo.pageNum + "页，共" + result.extend.pageInfo.pages + "页，总共" + result.extend.pageInfo.total + "条记录")
		totalReocrd=result.extend.pageInfo.total
	}

	function build_page_nav(result) {
		var ul = $("<ul></ul>").addClass("pagination")
		var firstPageLi = $("<li></li>").append(
				$("<a></a>").attr("href", "#").append("首页"))
		var prePageLi = $("<li></li>").append(
				$("<a></a>").attr("href", "#").append("&laquo;"))
		var nextPageLi = $("<li></li>").append(
				$("<a></a>").attr("href", "#").append("&raquo;"));
		var lastPageLi = $("<li></li>").append(
				$("<a></a>").attr("href", "#").append("末页"))

		if (result.extend.pageInfo.hasPreviousPage == false) {
			firstPageLi.addClass("disabled")
			prePageLi.addClass("disabled")
		}else{
			firstPageLi.click(function() {
				toPage(1)
			})
			prePageLi.click(function() {
				toPage(result.extend.pageInfo.prePage)
			})
		}
		if (result.extend.pageInfo.hasNextPage == false) {
			nextPageLi.addClass("disabled")
			lastPageLi.addClass("disabled")
		}else{
			nextPageLi.click(function() {
				toPage(result.extend.pageInfo.nextPage)
			})
			lastPageLi.click(function() {
				toPage(result.extend.pageInfo.pages)
			})
		}

		ul.append(firstPageLi).append(prePageLi)
		$.each(result.extend.pageInfo.navigatepageNums, function(index, item) {
			var numLi = $("<li></li>").append(
					$("<a></a>").attr("href", "#").append(item))
			if (result.extend.pageInfo.pageNum == item) {
				numLi.addClass("active")
			}
			numLi.click(function() {
				toPage(item)
			})
			ul.append(numLi)
		})
		ul.append(nextPageLi).append(lastPageLi)
		$("<nav></nav>").append(ul).appendTo("#page_nav_area")
	}
	function reset_form(ele){
		$(ele)[0].reset();
		//清空表单样式
		$(ele).find("*").removeClass("has-error has-success");
		$(ele).find(".help-block").text("");
		
	}
	
	function add_btn_event(){
		$("#emp_add_modal_btn").click(function(){
			//清除表单数据（表单完整重置（表单的数据，表单的样式））
			reset_form("#empAddModal form")
			
			//查出所有部门信息并显示在下拉列表中
			viewDepts("#empAddModal select")
			$("#empAddModal").modal({backdrop:"staic"})
		})
		$("#emp_save_btn").click(function(){
			//模态框中填写的表单数据提交给服务器进行保存
			//先对要提交给服务器的信息进行校验
			if(!validate_add_form()){
				return false
			}
			//1.判断之前的ajax用户名校验是否成功，如果成功
			if($(this).attr("ajax-va")=="error"){
				return false
			}
			//2.发送ajax请求保存员工
			$.ajax({
				url:"${APP_PATH}/emp",
				data:$("#empAddModal form").serialize(),
				type:"POST",
				success:function(result){
					if(result.code==200){
						$('#empAddModal').modal('hide')
						toPage(totalReocrd)
						//console.log(totalReocrd)
					}else{
						//显示错误信息
						if(undefined != result.extend.errorFields.email){
							show_validate_msg("#email_add_input","error",result.extend.errorFields.email)
						}
						if(undefined != result.extend.errorFields.empName){
							show_validate_msg("#empName_add_input","error",result.extend.errorFields.empName)
						}
						console.log(result)
					}
				}
			})
		})
		
		$("#empName_add_input").change(function(){
			var empName=this.value;
			$.ajax({
				url:"${APP_PATH}/checkUser",
				data:"empName="+empName,
				type:"POST",
				success:function(result){
					if(result.code==200){
						show_validate_msg("#empName_add_input","success","用户名可用")
						$("#emp_save_btn").attr("ajax-va","success")
					}else{
						show_validate_msg("#empName_add_input","error",result.extend.va_msg)
						$("#emp_save_btn").attr("ajax-va","error")
					}
				}
			})
		})
		
		//表格里面的编辑和删除按钮添加事件
		$(".edit_btn").click(function() {
			//1.查出员工信息，显示员工信息
			getEmp($(this).attr("edit-id"))
			//2.查出部门信息，显示部门列表
			viewDepts("#empUpdateModal select")
			$("#empUpdateModal").modal({
				backdrop:"staic"
			})
		})

		//为更新按钮添加单击事件
		$("#emp_update_btn").click(function(){
			console.log($("#empUpdateModal form").serialize())
			$.ajax({
				url:"${APP_PATH}/update_emp",
				type:"POST",
				data:$("#empUpdateModal form").serialize(),
				success:function(result){
					if(result.code==200){
						$("#empUpdateModal").modal("hide")
					}else{
						console.log(result)
					}
				}
				
			})
		})
		
		//为删除按钮添加单击事件
		$(".delete_btn").click(function(){
			alert("delete")
			var empId=$(this).pre().attr("edit-id")
			$.ajax({
				url:"${APP_PATH}/delete_emp/"+empId,
				type:"DELETE",
				success:function(result){
					console.log(result)
				}
			})
		})
		
	}

//	这种方法也可以绑定click事件
// 	$(document).on("click",".edit_btn",function(){
// 		alert("binding too");
// 	})

	function viewDepts(ele) {
		$(ele).empty()//清空下拉列表框信息
		$.ajax({
			url : "${APP_PATH}/depts",
			type : "GET",
			success : function(result) {
				$.each(result.extend.depts, function(index, item) {
					$("<option></option>").attr("value", item.deptId).append(
							item.deptName).appendTo(ele)
				})
			}
		})
	}
	//校验表单数据
	function validate_add_form() {
		//1.拿到要校验的用户名，使用正则表达式
		var empName = $("#empName_add_input").val()
		var regName = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})/
		if (!regName.test(empName)) {
			//alert("用户名必须是2到5位中文，或者6到16位英文和数字的组合")
			show_validate_msg("#empName_add_input", "error",
					"用户名必须是2到5位中文，或者6到16位英文和数字的组合")
			return false
		} else {
			show_validate_msg("#empName_add_input", "success", "")
		}
		//2.校验邮箱信息
		var email = $("#email_add_input").val()
		var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/
		if (!regEmail.test(email)) {
			//alert("邮箱格式不正确")
			show_validate_msg("#email_add_input", "error", "邮箱格式不正确")
			return false
		} else {
			show_validate_msg("#email_add_input", "success", "")
		}

		return true;
	}

	function show_validate_msg(ele, status, msg) {
		//清除当前元素的校验状态
		$(ele).parent().removeClass("has-success has-error")
		if ("success" == status) {
			$(ele).parent().addClass("has-success")
		} else if ("error" == status) {
			$(ele).parent().addClass("has-error")
		}
		$(ele).next("span").text(msg);
	}
	
	function getEmp(id){
		$.ajax({
			url:"${APP_PATH}/emp/"+id,
			type:"GET",
			success:function(result){
				//console.log(result)
				var empData=result.extend.emp
				$("#empName_update_static").text(empData.empName)
				$("#email_update_input").val(empData.email)
				$("#empUpdateModal input[name=gender]").val([empData.gender]);
				$("#empUpdateModal select").val([empData.dId]);
			}
		})
	}
</script>
</html>