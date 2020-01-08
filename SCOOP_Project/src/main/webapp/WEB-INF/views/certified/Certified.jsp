<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<%
if(session.getAttribute("checkemail")!=null){
	response.sendRedirect("registerOk.do");
}else{
	response.sendRedirect("index.do");
}
%>
</head>
<body>

</body>
</html>