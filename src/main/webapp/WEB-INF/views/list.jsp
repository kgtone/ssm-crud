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
<link
	href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="${APP_PATH}/static/js/jquery-1.12.4.min.js"></script>

<title>list</title>
</head>
<body>
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
				<button class="btn btn-primary">新增</button>
				<button class="btn btn-danger ">删除</button>
			</div>
		</div>
		<!-- 表格数据 -->
		<div class="row">
			<div class="col-md-12">
				<table class="table table-hover">
					<tr>
						<th>#</th>
						<th>empName</th>
						<th>gender</th>
						<th>email</th>
						<th>deptName</th>
						<th>Operate</th>
					</tr>
					<c:forEach items="${pageInfo.list }" var="emp">
						<tr>
							<td>${emp.empId}</td>
							<td>${emp.empName}</td>
							<td>${emp.gender == "M"?"男":"女"}</td>
							<td>${emp.email}</td>
							<td>${emp.department.deptName }</td>
							<td>
								<button class="btn btn-primary btn-sm">
									<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
									编辑
								</button>
								<button class="btn btn-danger  btn-sm">
									<span class="glyphicon glyphicon-trash " aria-hidden="true"></span>
									删除
								</button>
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
		<!-- 显示分页信息 -->
		<div class="row">
			<!-- 分页文字信息 -->
			<div class="col-md-6">
				当前第${pageInfo.pageNum}页，共${pageInfo.pages}页，总${pageInfo.total }条记录</div>
			<!-- 分页条信息 -->
			<div class="col-md-6">
				<nav aria-label="Page navigation">
					<ul class="pagination">
						<c:choose>
							<c:when test="${pageInfo.isFirstPage}">
								<li class="disabled"><span>首页</span></li>
							</c:when>
							<c:otherwise>
								<li><a href="${APP_PATH}/emps?pn=1">首页</a></li>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${pageInfo.hasPreviousPage}">
								<li><a href="${APP_PATH}/emps?pn=${pageInfo.prePage}"
									aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
							</c:when>
							<c:otherwise>
								<li class="disabled"><span aria-label="Previous"><span
										aria-hidden="true">&laquo;</span></span></li>
							</c:otherwise>
						</c:choose>
						<c:forEach items="${pageInfo.navigatepageNums}" var="page_num">
							<c:choose>
								<c:when test="${page_num == pageInfo.pageNum}">
									<li class="active"><span>${page_num}</span></li>
								</c:when>
								<c:otherwise>
									<li><a href="${APP_PATH}/emps?pn=${page_num} ">${page_num}</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<c:choose>
							<c:when test="${pageInfo.hasNextPage }">
								<li><a href="${APP_PATH}/emps?pn=${pageInfo.nextPage}"
									aria-label="Next"> <span aria-hidden="true">&raquo;</span>
								</a></li>
							</c:when>
							<c:otherwise>
								<li class="disabled"><span aria-label="Next"> <span
										aria-hidden="true">&raquo;</span>
								</span></li>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${pageInfo.isLastPage }">
								<li class="disabled"><span>末页</span></li>
							</c:when>
							<c:otherwise>
								<li><a href="${APP_PATH}/emps?pn=${pageInfo.pages}">末页</a></li>
							</c:otherwise>
						</c:choose>
					</ul>
				</nav>
			</div>
		</div>
	</div>
</body>
</html>