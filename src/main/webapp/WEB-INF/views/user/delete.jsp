<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
$(document).ready(function(){
	$("#yes").click(function(){
		console.log("#yes clicked")
		$("form").submit();
	})
	$("#no").click(function(){
		console.log("#no clicked")
		$(location).attr('href', '/user/mypage')
	})
})
</script>
<style type="text/css">

</style>
<div style="margin-top:300px;">
<div style="margin: 50px;">활동하셨던 내역이 모두 삭제되며 수정하거나 복구할 수 없습니다.<br><br>정말 탈퇴하시겠습니까?<br></div>
<button class="btn btnProfile" type="button" id="yes">예</button>&nbsp;&nbsp;<button class="btn btnProfile" type="button" id="no">아니오</button>
<form action="/user/delete" method="post">
</form>
</div>