<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:import url="/WEB-INF/views/layout/header.jsp" />


<div class="container">
<h1>관리자 향수 리스트</h1>
<hr>
<div style="text-align: center;">
<a href="/admin/perf/write"><button class="btn">신규 향수 등록</button></a>
<br><br>
<form action="/admin/perf/list" method="get">
<input type="text" name="search"><button>검색</button>
</form>
</div>
<br>
<table class="table table-striped table-hover">
<thead>
	<tr>
		<th style="width: 15%; text-align: center;">사진</th>
		<th style="width: 15%; text-align: center;">브랜드</th>
		<th style="width: 40%; text-align: center;">이름</th>
		<th style="width: 15%; text-align: center;">수정</th>
		<th style="width: 15%; text-align: center;">삭제</th>
	</tr>
</thead>
<tbody>
<c:forEach items="${list }" var="perf">
	<tr>
		<td>
			<a href="/perf/view?perfumeNo=${perf.PERFUME_NO }">
				<img class="perf_img" style="width:50px; height:50px; display: block; margin: auto;"
					src="/upload/${perf.STORED_NAME }">
			</a>
		</td>
		<td>
			<img class="perf_img" style="width: 100px; display: block; margin: auto;"
					src="/resources/img/brand/${perf.BRAND_NAME }.png">
		</td>
		<td style="text-align: center;"><a href="/perf/view?perfumeNo=${perf.PERFUME_NO }">${perf.PERFUME_NAME }</a></td>
		<td style="text-align: center;"><a href="/admin/perf/update?perfumeNo=${perf.PERFUME_NO }"><button class="btn">수정</button></a></td>
		<td style="text-align: center;"><a href="/admin/perf/delete?perfumeNo=${perf.PERFUME_NO }" onclick="return confirm('향수를 삭제하시겠습니까? 삭제된 향수는 원상복구 할 수 없습니다.');"><button class="btn" id="btnDelete">삭제</button></a></td>
	</tr>
</c:forEach>
</tbody>
</table>

<c:import url="/WEB-INF/views/layout/paging.jsp" />
</div><%-- .container --%>
<c:import url="/WEB-INF/views/layout/footer.jsp" />