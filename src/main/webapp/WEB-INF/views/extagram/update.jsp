<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/views/layout/header.jsp" />

<!-- 스마트 에디터 2 라이브러리 로드 -->
<script type="text/javascript" src="/resources/se2/js/service/HuskyEZCreator.js"></script>

<script type="text/javascript">
function submitContents(elClickedObj) {
	oEditors.getById["exContent"].exec("UPDATE_CONTENTS_FIELD", []);
	
	try {
		elClickedObj.form.submit();
	} catch(e) {}
}

$(document).ready(function() {
	//작성버튼 동작
	$("#btnUpdate").click(function() {
		var answer = confirm("게시글을 수정하시겠습니까?")
		if( answer == true ){
			submitContents( $("#btnUpdate") )
			$("form").submit();
		} else {
			return false;
		}
	});
	
	$("#btnCancel").click(function() {
		var answer = confirm("게시글 수정을 취소하시겠습니까?")		
		if(answer == true) {
			history.go(-1);
		} else {
			return false;
		}
	})
})
</script>

<div class="container">

<h1>Extagram Update</h1>
<hr>

<form action="/extagram/update" method="post" enctype="multipart/form-data">
<div class="form-group">
	<label for="write">작성자</label>
	<input type="text" id="nick" name="nick" value="${nick }" class="form-control" readonly="readonly"/>
	<input type="hidden" id="userNo" name="userNo" value="${userNo }" />
</div>
<div class="form-group">
	<label for="content">본문</label>
	<input type="hidden" name="exNo" value="${viewExta.EX_NO }" />
	<textarea rows="10" style="width: 100%;" id="exContent" name="exContent">${viewExta.EX_CONTENT }</textarea>
</div>

<div class="form-group">
	기존 사진 : <a href="/upload/${viewExta.PICTURE}">${viewExta.PIC}</a><br><br>
	<input type="file" id="file" name="file" value="/upload/${viewExta.PIC}"/>
	<small>** 새로운 사진을 업로드하면 기존 사진이 삭제됩니다 **</small>
</div>

<div class="text-center">
	<button class="btn" id="btnUpdate">작성</button>
	<button class="btn" id="btnCancel">취소</button>
</div>
</form>

<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "exContent",
	sSkinURI: "/resources/se2/SmartEditor2Skin.html",
	fCreator: "createSEditor2"
});
</script>

</div><!-- .container -->




<c:import url="/WEB-INF/views/layout/footer.jsp" />