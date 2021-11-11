<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
<c:import url="/WEB-INF/views/layout/header.jsp"/>

<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	var joinCnt = 0;

	$("#agree_all").change(function(){
		//대상이 체크된 상태일때
		if($(this).is(":checked")){
			$(".chkSub").attr("checked", true);
		}else{
			$(".chkSub").attr("checked", false);
		}
	});
	
	$("#nextBtn").click(function(){
		console.log("#joinBtn clicked");
		if(joinCnt == 0 ){
			console.log("약관 동의 완료");
			joinCnt++;
			$("#info").css("color", "black");
		}else if(joinCnt == 1){
			$("form").submit();
		}
	});
	
	$.datepicker.setDefaults({
        dateFormat: 'yy-mm-dd',
        prevText: '이전 달',
        nextText: '다음 달',
        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        dayNames: ['일', '월', '화', '수', '목', '금', '토'],
        dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
        showMonthAfterYear: true,
        yearSuffix: '년',
        changeYear: true, // 년을 바꿀 수 있는 셀렉트 박스를 표시한다.
        yearRange: 'c-100:c+10', // 년도 선택 셀렉트박스를 현재 년도에서 이전, 이후로 얼마의 범위를 표시할것인가.
        showButtonPanel: true, // 캘린더 하단에 버튼 패널을 표시한다. 
        currentText: '오늘 날짜' , // 오늘 날짜로 이동하는 버튼 패널
        closeText: '닫기'  // 닫기 버튼 패널
    });

    $(function() {
        $("#birth").datepicker();
    });


})
</script>
<style>
#ltitle{
	background: #ccc;
	color: #877b9e;
}
#questionNo {
    width: 200px;
    height: 30px;
}
/* #joinForm { */
/* 	display: none; */
/* } */
#agreement {
	display: none;
}
#agree{
	color: black;
}
</style>
<div class="container">
<div class="text-center" id="pageName">
<h1 id="ltitle"><span id="agree">약관 동의</span> <i class="fas fa-angle-right"></i> <span id="info">정보 입력</span> <i class="fas fa-angle-right"></i> <span id="sms">메일 인증</span></h1>
<hr>
</div>
<div class="text-center" id="agreement">
<div class="text-center">
<label for="agree_all">
  <input type="checkbox" class="chkSub" id="agree_all">
  <span>모두 동의합니다</span>
</label>
</div>
<div class="text-center">
<label for="agree">
  <input type="checkbox" class="chkSub" name="chkBox" value="1">
  <span>이용약관 동의<strong>(필수)</strong><br></span>
</label>
<label for="agree">
  <input type="checkbox" class="chkSub" name="chkBox" value="2">
  <span>개인정보 수집, 이용 동의<strong>(필수)<br></strong></span>
</label>
<label for="agree">
  <input type="checkbox" class="chkSub" name="chkBox" value="3">
  <span>개인정보 이용 동의<strong>(필수)</strong><br></span>
</label>
<label for="agree">
  <input type="checkbox" class="chkSub" value="4">
  <span>이벤트, 혜택정보 수신동의<strong class="select_disable">(선택)<br></strong></span>
</label>
</div>
</div>
<form action="/user/join" method="post" id="joinForm" class="form-horizontal"  style="dispaly:flex;">

<div class="form-group">
    <label for="id" class="col-xs-3 control-label">아이디 </label>
    <div class="col-xs-6">
      <input type="text" class="form-control" id="id" name="id" placeholder="Id">
    </div>
</div>

<div class="form-group">
    <label for="pw" class="col-xs-3 control-label">비밀번호 </label>
    <div class="col-xs-6">
      <input type="password" class="form-control" id="pw" name="pw" placeholder="Password">
    </div>
</div>

<div class="form-group">
    <label for="pw" class="col-xs-3 control-label">비밀번호 확인 </label>
    <div class="col-xs-6">
      <input type="password" class="form-control" id="pw" name="pw" placeholder="Password">
    </div>
</div>

<div class="form-group">
    <label for="nick" class="col-xs-3 control-label">닉네임 </label>
    <div class="col-xs-6">
      <input type="text" class="form-control" id="nick" name="nick" placeholder="nick">
    </div>
</div>

<div class="form-group">
    <label for="nick" class="col-xs-3 control-label">전화번호 </label>
    <div class="col-xs-6">
      <input type="text" class="form-control" id="phone" name="phone" placeholder="phone">
    </div>
</div>

<div class="form-group">
    <label for="nick" class="col-xs-3 control-label">이메일 </label>
    <div class="col-xs-6">
      <input type="email" class="form-control" id="email" name="email" placeholder="email">
    </div>
</div>

<div class="form-group">
    <label for="nick" class="col-xs-3 control-label">이메일 </label>
    <div class="col-xs-6">
      <input type="email" class="form-control" id="email" name="email" placeholder="email">
    </div>
</div>
<div class="form-group">
    <label for="birth" class="col-xs-3 control-label">생일 </label>
    <div class="col-xs-6">
      <input type="text" class="form-control" id="birth" name="birth" placeholder="birth">
    </div>
</div>

<div class="form-group">
    <label for="questionAnwser" class="col-xs-3 control-label">자주묻는 질문 </label>
    <div class="col-xs-3">
    	<select id="questionNo" name="questionNo" style="width:500px;">
      		<option value="1">내가 좋아하는 캐릭터(인물)는?</option>
      		<option value="2">다시 태어나면 되고 싶은 것은?</option>
      		<option value="3">가장 감명깊게 본 영화는?</option>
      		<option value="4">자신의 보물 1호는?</option>
      		<option value="5">받았던 선물중에 가장 기억에 남는 선물은?</option>
      		<option value="6">읽은 책 중에서 가장 좋아하는 구절은?</option>
    	</select>

      	<input type="text" class="form-control" style="width:500px;" id="questionAnwser" name="questionAnwser" placeholder="질문에 답을 입력해주세요"> 
	</div>
</div>

</form>
<div class="text-center"> 
   	<button class="btn btn-primary" type="button" id="nextBtn">다음</button>
    <button class="btn btn-danger" type="button" id="cancleBtn">취소</button>
</div>

</div>
<c:import url="/WEB-INF/views/layout/footer.jsp"/>