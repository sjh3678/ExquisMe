<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style type="text/css">
li:hover{
	background-color:rgba(0, 0, 0, 0.2);/*까만색(0,0,0) 80% 투명도*/
}
.pagingArea{
	width:100%;
}
ul{
	list-style: none;
	text-align:center;
}
li{
	display: inline-block;
}
table{
	table-layout:fixed;
	width:100%;
	border: 1px solid #ccc;
	cellpadding: 0;
	
}
table tr td{
	text-align: center;
}
td{
	overflow:hidden;
}
#aDelete {
	margin: 5px;
}
</style>
<table>
<tr>
	<td>업로드한 파일</td>
	<td>내용</td>
	<td>작성일</td>
	<td>삭제</td>
</tr>
<c:forEach items="${extaList}" var="list">
<tr>
	<td onclick="location.href='/extagram/view?exNo=${list.EX_NO}';"><img width="50px" height="40px" src="/upload/${list.UPFILE }"/></td>
	<td onclick="location.href='/extagram/view?exNo=${list.EX_NO}';" nowrap style="overflow:hidden;">${list.EX_CONTENT }</td>
	<td onclick="location.href='/extagram/view?exNo=${list.EX_NO}';"><fmt:formatDate value="${list.EX_DATE }" pattern="yyyy.MM.dd HH:mm"/></td>
	<td id="aDelete"><a href="/admin/extagram/delete?exNo=${list.EX_NO }"><button>삭제</button></a></td>
</tr>
</c:forEach>
</table>

<div class="pagingArea">
	<ul>
		<%-- 첫페이지로 이동 --%>
		<c:if test="${paging.curPage ne 1 }">
			<li><label onclick=getExtaList(1)><a>처음</a></label></li>
		</c:if>
		
		<%-- 이전페이징 리스트로 이동 --%>
		<c:choose>
			<c:when test="${paging.startPage ne 1 }">
				<li><label onclick=getExtaList(${paging.startPage - paging.pageCount })>이전</label></li>
			</c:when>
		</c:choose>
		
		<%-- 이전 페이지로 가기 --%>
		<c:if test="${paging.curPage > 1 }">
			<li><label onclick=getExtaList(${paging.curPage - 1 })>&lt;</label></li>
		</c:if>
		
		<%-- 페이징 리스트 --%>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="i">
			<c:if test="${paging.curPage eq i }">
				<li><label>${i }</label></li>
			</c:if>
			
			<c:if test="${paging.curPage ne i }">
				<li><label onclick=getExtaList(${i })>${i }</label></li>
			</c:if>
		</c:forEach>
		
		<%-- 다음 페이지로 가기 --%>
		<c:if test="${paging.curPage < paging.totalPage }">
			<li><label onclick=getExtaList(${paging.curPage + 1 })>&gt;</label></li>
		</c:if>
		
		<%-- 다음페이징 리스트로 이동 --%>
		
		<c:if test="${paging.endPage ne paging.totalPage }">
			<li><label onclick=getExtaList(${paging.startPage + paging.pageCount })>&raquo;</label></li>
		</c:if>
				
		<%-- 끝페이지로 이동 --%>
		<c:if test="${paging.curPage ne paging.totalPage }">
			<li><label onclick=getExtaList(${paging.totalPage })>끝</label></li>
		</c:if>
	</ul>
</div>