<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/commons/footer.jsp"></jsp:include>
<script>
Swal.fire(
		  '환영합니다!',
		  '이제 협업공간을 이용하실 수 있습니다!',
		  'success'
		)
window.setTimeout(function() {
	location.href='index.do';	
}, 1500);
</script>