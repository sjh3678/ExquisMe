<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="text-center">
<ul class="pagination pagination-sm">

<c:if test="${not empty paging.search }">
	<c:set var="searchParam" value="${paging.search }"/>
</c:if>

<!-- 첫 페이지로 -->
<c:if test="${paging.curPage ne 1 }">
	<li><span onclick=loadCurPage(1)>첫 페이지로</span></li>
</c:if>

<!-- 이전 페이징 리스트로 이동 -->
<c:if test="${paging.startPage ne 1 }">
	<li><span onclick=loadCurPage(${paging.startPage - paging.pageCount })>&lt;</span></li>
</c:if>

<!-- 이전 페이지로 가기 -->
<%-- <c:if test="${paging.curPage > 1 }"> --%>
<!-- 	<li><span onclick=loadCurPage(${paging.curPage - 1 })>&lt;</span></li> -->
<%-- </c:if> --%>

<!-- 페이징 리스트 -->
<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="i">
<c:if test="${paging.curPage eq i }">
	<li><span onclick=loadCurPage(${i })><input name ="curP" type="hidden" value="${i }"/>${i }</span></li>
</c:if>
<c:if test="${paging.curPage ne i }">
	<li><span onclick=loadCurPage(${i })><input name ="curP" type="hidden" value="${i }"/>${i }</span></li>
</c:if>
</c:forEach>

<!-- 다음 페이지로 가기 -->
<%-- <c:if test="${paging.curPage < paging.totalPage }"> --%>
<!-- 	<li><span onclick=loadCurPage(${paging.curPage + 1 })>&rarr;</span></li> -->
<%-- </c:if> --%>

<!-- 다음 페이징 리스트로 이동 -->
<c:if test="${paging.endPage ne paging.totalPage }">
	<li><span onclick=getExtaList(${paging.startPage + paging.pageCount })>&gt;</span></li>
</c:if>

<!-- 마지막 페이지로 -->
<c:if test="${paging.curPage ne paging.totalPage }">
	<li><span onclick=loadCurPage(${paging.totalPage })>끝 페이지로</span></li>
</c:if>

</ul>
</div>