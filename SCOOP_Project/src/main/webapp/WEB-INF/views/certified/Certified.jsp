<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<%
if(session.getAttribute("checkemail")!=null){
	System.out.println("세션에있다");
	%>
	<script type="text/javascript">
	$(document).ready(function(){
	Swal.fire({
		  title: "회원가입 인증 성공",
		  text: "회원가입 인증에 성공하셨습니다",
		  icon: "success",
		  button: "확인"
		})
		window.setTimeout(function() {
			location.href='registerOk.do';	
			}, 1500);
	});
	
	</script>
	<%
	/* response.sendRedirect("registerOk.do"); 
	Swal.fire(
	  '게시물 삭제에 성공했습니다',
	  '게시물 삭제 성공',
	  'success'
	)
	window.setTimeout(function() {
	location.href='notice.do';	
	}, 1500);
	*/
}else{
	System.out.println("세션에없다");
	%>
	<script>
	$(document).ready(function(){
	Swal.fire({
		  title: "회원가입 인증 실패",
		  text: "세션이 만료되었습니다 새로운 이메일을 받아 인증해주세요",
		  icon: "error",
		  button: "확인"
		})
		window.setTimeout(function() {
			location.href='index.do';	
			}, 1500);
	});	
	
	
	</script>
	<%
	/* response.sendRedirect("index.do"); */
}
%>
</head>
<body>

</body>
</html>