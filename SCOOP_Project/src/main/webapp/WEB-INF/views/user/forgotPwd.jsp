<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<jsp:include page="/WEB-INF/views/commons/title.jsp"></jsp:include>

</head>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript">
$(function(){
	$('#pwd').keypress(function(event) {
		if(event.keyCode==13){
			#('#pwdchk').focus();
		}
	});
	$('#pwdchk').keypress(function(event) {
		if(event.keyCode==13){
			#('#pwdBtn').submit();
			
		}
	});
});
</script>
<body>

	<div id="changpwd" class="row">
		<div class="col-sm-12">

			<img class="img-responsive center-block" alt="Scoop로고"src="resources/images/logo/ScoopBig.png" style="width: 500px;height: auto;margin-left:35%;margin-top:10%;" />
			<form action="changePwdOk.do" method="post">
				<p style="margin-left: 45%;font-size:35px;margin-top: 0px;">비밀번호 변경</p>
				<div id="firstPw" style="margin-left:41%;margin-bottom:1%;">
					<input type=password id="pwd" name="pwd" style="width: 310px;height: 35px;border:1px solid #E71D36;border-radius:0.5rem;padding-right:2%;padding-left: 2%;" placeholder="새 비밀번호 " required>
				</div>
				<div id="secondPw" style="margin-left:41%;">
					<input type="password" id="pwdchk" name="pwdchk" style="width: 310px;height: 35px; border:1px solid #E71D36;border-radius:0.5rem;padding-right:2%;padding-left: 2%;" placeholder="새 비밀번호 확인" required>
				</div> 
				<div style="margin-left: 42%;margin-top:2%;mar">
					<input id="pwdBtn" type="submit" value="비밀번호 변경하기" style="width: 310px; height: 38px; color:#fff ;text-align: center; padding-top: 5px;background-color:#E71D36;border-radius:0.5rem;border: 1px solid #E71D36;padding-bottom: 5px;">
				</div>
			</form>

		</div>
	</div>
</body>
</html>