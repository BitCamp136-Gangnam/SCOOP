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
	System.out.println("이메일 인증 버튼 눌러서 오는곳");
	System.out.println("세션값 : "+session.getAttribute("emailcheck"));
	if(session.getAttribute("emailcheck") != null){
		System.out.println("비밀번호 변경 if문 타니?");
	%>
	<script>
	alert('인증 성공');
	swal({
		  title: "본인 인증 성공",
		  text: "비밀번호를 변경해 주세요",
		  icon: "success",
		  button: "확인"
		})
	</script>
	<%
	response.sendRedirect("changePwd.do");
}else{
	%>
	<script>
	System.out.println("인증 실패");
	alert('error');
	swal({
		  title: "본인 인증 실패",
		  text: "인증 실패 새로운 이메일을 받아 인증해주세요",
		  icon: "error",
		  button: "확인"
		})
	</script>
	<%
	response.sendRedirect("index.do");
}
%>
</head>
<body>

</body>
</html>