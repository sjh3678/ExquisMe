<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/views/layout/header.jsp" />

<style type="text/css">
table{
	table-layout: fixed;
}
table, th{
	text-align: center;
}
td:nth-child(2){/*제목은 왼쪽 정렬*/
	text-align: left;
}
</style>

<div class="container">

<h1>admin notice list</h1>
<hr>

<table class="table table-striped table-hover">
<tr>
	<th>게시글번호</th>
	<th>제목</th>
	<th>작성자</th>
	<th>내용</th>
	<th>작성일</th>
	<th>orginname</th>
	<th>storedname</th>
</tr>
<c:forEach items="${noticeList }" var="i">
<tr>
	<td>${i.NOTICE_NO}</td>
	<td>${i.NOTICE_TITLE}</a></td>
	<td>${i.NICK}</td>
	<td>${i.NOTICE_CONTENT}</td>
	<td><fmt:formatDate value="${i.NOTICE_DATE}" pattern="YY-MM-dd"/></td>
	<td>${i.ORIGIN_NAME}</td>
	<td>${i.STORED_NAME}</td>
</tr>
</c:forEach>
</table>

<span class="pull-left">total : ${paging.totalCount }</span>
<div class="clearfix"></div>

<c:import url="/WEB-INF/views/layout/paging.jsp" />
<hr>
<a href="/admin/notice/write"><button id="btnWrite" class="btn btn-primary pull-left">WRITE</button></a>

</div><%-- .container --%>
<c:import url="/WEB-INF/views/layout/footer.jsp" />