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
</script>

<script type="text/javascript">
$(document).ready(function() {
	//작성버튼
	$("#btnWrite").click(function() {
		var answer = confirm("Extagram을 등록하시겠습니까?");
		if(answer == true) {
			var fileCheck = document.getElementById("fileCheck").value;
			
			if( !fileCheck ) {
				alert("Extagram 작성 시 사진을 업로드해야 합니다.");
				return false;
			} else {
				submitContents( $("#btnWrite") )
				$("form").submit();
			}	
	    } else {
    		return false;
	    }
	});
	
	//취소버튼
	
	$("#btnCancel").click(function() {
		var answer = confirm("Extagram 작성을 취소하시겠습니까?")
		if(answer == true) {
				history.go(-1);
		} else {
			return false;
		}
	
	});
});
</script>

<script type="text/javascript">
<c:if test="${not login}">
	var message = "${msg}";
	var url = "${url}";
	alert(message);
	document.location.href = url;
</c:if>
</script>

<div class="container">

<h1><Strong>Extagram Write</Strong></h1>
<hr>

<form action="/extagram/write" method="post" enctype="multipart/form-data">
<div class="form-group" style="text-align: center;">
	<strong style="font-size: 17px;">게시글 작성 시 유의사항</strong><br><br>
	<span style="font-size: 13px;">게시글에는 향수와 관련된 이미지 사진을 필수적으로 업로드 해야합니다.<br>
	향수와 무관한 이미지 또는 미풍양속을 현저히 해치는 이미지를 업로드 할 시<br>
	별도의 통보 없이 게시글이 삭제될 수 있습니다.</span><br><br>
</div>
<div class="form-group">
	<span><strong>작성자</strong><br>${nick }</span><br><br>
	<input type="hidden" id="nick" name="nick" value="${nick }" />
	<input type="hidden" id="userNo" name="userNo" value="${userNo }" />
</div>
<div class="form-group">
	<label for="content">본문</label>
	<textarea rows="10" style="width: 100%;" id="exContent" name="exContent"></textarea>
</div>

<div class="form-group">
	<label for="file">사진 첨부</label>
	<input type="file" id="fileCheck" name="file" />
</div>

<div class="text-center">
	<button class="btn" id="btnWrite">작성</button>
	<input type="reset" id="btnCancel" class="btn" value="취소"/>
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