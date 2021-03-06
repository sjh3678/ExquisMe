<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/views/layout/header.jsp" />

<script type="text/javascript" src="/resources/se2/js/service/HuskyEZCreator.js"></script>

<script type="text/javascript">
//네이버se2 적용
function submitContents(elClickedObj) {
	oEditors.getById["contentWrite"].exec("UPDATE_CONTENTS_FIELD", []);
	try {
		elClickedObj.formWrite.submit();
	} catch(e) {}
}

//네이버se2 적용
function submitContents2(elClickedObj) {
	oEditors.getById["contentUpdate"].exec("UPDATE_CONTENTS_FIELD", []);
	try {
		elClickedObj.formUpdate.submit();
	} catch(e) {}
}
	
$(document).ready(function(){
	//버튼 클릭에 따른 동작
	$("#btnWriteProc").click(function(){
		if(confirm("새로운 게시글을 등록하시겠습니까?")){
			submitContents($("#btnWriteProc"));
			$("#formWrite").submit();
		}else{
			return false;
		}
	})
	
	//버튼 클릭에 따른 동작
	$("#btnUpdateProc").click(function(){
		if(confirm("게시글을 수정하시겠습니까? 수정된 게시물은 원상복구 할 수 없습니다.")){
			submitContents2($("#btnUpdateProc"));
			$("#formUpdate").submit();			
		}else{
			return false;
		}
	})
	
	//게시글 상세보기 토글
    $(".titleChild").click(function(){
		$(this).parent().next("div").children().stop().slideToggle();
    })
})

	//버튼으로 할 시 동작
// 	function btnDelete(e){
// 		location.href="/admin/faq/delete?faqNo="+e
// 	}
	
</script>

<style type="text/css">
.container{
	margin-bottom: 50px;
}
#modalUpdate {
  position: absolute;
  top: 0;
  left: 0;

  width: 100%;
  height: 100%;

  display: none;

  background-color: rgba(0, 0, 0, 0.4);
}

#modalUpdate.show {
  display: block;
}

.modal_body {
  position: absolute;
  top: 50%;
  left: 50%;

  width: 800px;
  height: 700px;

  padding: 40px;

  text-align: center;

  background-color: #ECE6CC;
  border-radius: 10px;
  box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);

  transform: translateX(-50%) translateY(-50%);
}

.modalWrite {
  position: absolute;
  top: 0;
  left: 0;

  width: 100%;
  height: 100%;

  display: none;

  background-color: rgba(0, 0, 0, 0.4);
}

.modalWrite.show {
  display: block;
}

.modalWrite_body {
  position: absolute;
  top: 50%;
  left: 50%;

  width: 800px;
  height: 700px;

  padding: 40px;

  text-align: center;

  background-color: #ECE6CC;
  border-radius: 10px;
  box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);

  transform: translateX(-50%) translateY(-50%);
}

.row{
	width: 900px;
	margin: 0 auto;
}
.title{
	background: #8A7E6B;
	color: #35312B;
	font-size: 21px;
	font-weight: 700;
 	margin-bottom: 5px;
 	border-radius: 10px;
 	height: 30px;
}
.titleText{
	margin: 0 20px;
	width: 700px;
	display: inline-block;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
}
.contentChild{
	background: #ECE6CC;
	margin-bottom: 5px;
	padding: 30px;
 	border-radius: 10px;
    overflow: hidden;
    word-break: break-all;
/* 	overflow-y: scroll; */
}
.title button{
	color: pink;
}
.title a:link{
	vertical-align: middle;
	color: #ECE6CC;
}
.title a:hover{
	color: #8A7E6B;
	text-decoration: none;
}
.title:hover{
	background-color: #35312B;
	color: #ECE6CC;
	border-radius: 10px;
	transform: scale(1.01);
}
.titleChild{
	padding-right: 15px;
	padding-left: 15px;
	white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
}
.btnWrite{
	background-color: #8A7E6B;
	color: #ECE6CC;
}
.btnWrite:hover{
	background-color: #35312B;
	color: #ECE6CC;
}
</style>


<div class="container">

<h1>admin faq &nbsp;&nbsp;&nbsp;
<button id="modalWrite" class="btn btn-open-popup-write">글쓰기</button></h1>
<hr>

<%-- 모달 글쓰기 영역 --%>
<div class="modalWrite">
	<div class="modalWrite_body">새로운 자주 묻는 문의 등록하기
		<form id="formWrite" action="/admin/faq/write" method="post">
			<label for="title">제목</label>
			<input type="text" id="title" name="faqTitle" class="form-control"/>
		
			<label for="contentWrite">본문</label>
			<textarea rows="10" style="width: 100%; height: 370px;" id="contentWrite" name="faqContent"></textarea>
		</form>
		<button class="btn btnWrite" id="btnWriteProc">작성</button>
	</div>
</div>

<c:forEach items="${faqList }" var="i">
<div class="row" data-boardno="${i.faqNo }">
	<div class="title">
		<div class="titleChild" style="cursor: pointer;">
			<span class="titleText"><c:out value="${i.faqTitle}"/></span>
			<span style="float: right; font-size: 18px; font-weight: 400;"><a href="/admin/faq/delete?faqNo=${i.faqNo}" onclick="return confirm('게시글을 삭제하시겠습니까? 삭제된 게시물은 원상복구 할 수 없습니다.');">삭제</a>&nbsp;&nbsp;&nbsp;</span>
			<span style="float: right; font-size: 18px; font-weight: 400;"><a href="#" class="btn-open-popup-update">수정</a>&nbsp;&nbsp;&nbsp;</span>
		</div>
	</div>
	<div class="content">
		<div class="contentChild" style="display: none;">
			<div class="contentText">
			${i.faqContent}
			</div>
		</div>
	</div>
</div>
</c:forEach>

<%-- 모달 수정 영역 --%>
<div id="modalUpdate" >
	<div class="modal_body">자주 묻는 문의 수정하기
		<form id="formUpdate" action="/admin/faq/update" method="post">
		<input type="hidden" name="faqNo" id="boardNo" />
		
			<label for="title">제목</label>
			<input type="text" id="title" name="faqTitle" class="form-control"/>
		
			<label for="contentUpdtae">본문</label>
			<textarea rows="10" style="width: 100%; height: 370px;" id="contentUpdate" name="faqContent"></textarea>
		</form>
		<button class="btn btnWrite" id="btnUpdateProc">작성</button>
	</div>
</div>

<script type="text/javascript">
var oEditors = [];
function initSEWrite() {
	oEditors = []
	nhn.husky.EZCreator.createInIFrame({
		oAppRef: oEditors,
		elPlaceHolder: "contentWrite",
		sSkinURI: "/resources/se2/SmartEditor2Skin.html",
		fCreator: "createSEditor2"
	});
}

function initSEUpdate() {
	console.log("initSEUpdate")
	nhn.husky.EZCreator.createInIFrame({
		oAppRef: oEditors,
		elPlaceHolder: "contentUpdate",
		sSkinURI: "/resources/se2/SmartEditor2Skin.html",
		fCreator: "createSEditor2"
	});
}

const bodyWrite = document.querySelector('body');
const modalWrite = document.querySelector('.modalWrite');
const btnOpenPopupWrite = document.querySelector('.btn-open-popup-write');

btnOpenPopupWrite.addEventListener('click', () => {
	if(${faqTotal }>=10){
		alert("자주 묻는 문의는 10개를 초과하여 등록할 수 없습니다.")
	}else{
		$(".modalWrite iframe").remove()
		
		//btnOpenPopupWrite에 맞춰서 SE2 스킨 씌우기
		initSEWrite();
		modalWrite.classList.toggle('show');
		
	    if (modalWrite.classList.contains('show')) {
	    	bodyWrite.style.overflow = 'hidden';
	    }		
	}
});

modalWrite.addEventListener('click', (event) => {
    if (event.target === modalWrite) {
    	modalWrite.classList.toggle('show');
	
    	if (!modalWrite.classList.contains('show')) {
			bodyWrite.style.overflow = 'auto';
		}
    }
});

const bodyUpdate = document.querySelector('body');
const modalUpdate = document.querySelector('#modalUpdate');
const btnOpenPopupUpdate = $(".btn-open-popup-update");

btnOpenPopupUpdate.on("click", (e) => {
	$("#modalUpdate iframe").remove()

	//btnOpenPopupUpdate에 맞춰서 SE2 스킨 씌우기
	initSEUpdate();
	
	var $row = $(e.target).parents(".row");
	console.log( $row.attr("data-boardno") )
	console.log( $row.find(".titleText") )
	console.log( $row.find(".contentText") )
	
	var $modalUpdate = $("#modalUpdate");
	$modalUpdate.find("#boardNo").val("")
	$modalUpdate.find("#title").val("")
	$modalUpdate.find("#contentUpdate").val("")
	$modalUpdate.find("#boardNo").val( $row.attr("data-boardno") )
	$modalUpdate.find("#title").val($row.find(".titleText").html())
	$modalUpdate.find("#contentUpdate").val($row.find(".contentText").html())
	
	modalUpdate.classList.toggle('show');
	
    if (modalUpdate.classList.contains('show')) {
    	bodyUpdate.style.overflow = 'hidden';
    }
});

modalUpdate.addEventListener('click', (event) => {
    if (event.target === modalUpdate) {
    	modalUpdate.classList.toggle('show');
	
    	if (!modalUpdate.classList.contains('show')) {
			bodyUpdate.style.overflow = 'auto';
		}
    }
});
</script>

</div><%-- .container --%>

<c:import url="/WEB-INF/views/layout/footer.jsp" />