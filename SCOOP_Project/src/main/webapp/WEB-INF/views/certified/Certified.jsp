<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<%
if(session.getAttribute("checkemail")!=null){
	%>
	<script>
	swal({
		  title: "회원가입 인증 성공",
		  text: "회원가입 인증에 성공하셨습니다",
		  icon: "success",
		  button: "확인",
		});
	</script>
	<%
	response.sendRedirect("registerOk.do");
}else{
	%>
	<script>
	swal({
		  title: "회원가입 인증 실패",
		  text: "세션이 만료되었습니다 새로운 이메일을 받아 인증해주세요",
		  icon: "error",
		  button: "확인",
		});
	</script>
	<%
	response.sendRedirect("index.do");
}
%>
</head>
<body>

</body>
</html>