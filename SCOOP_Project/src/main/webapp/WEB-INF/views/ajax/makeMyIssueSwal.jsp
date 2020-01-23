<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/commons/footer.jsp"></jsp:include>
<script>
Swal.fire(
		  '이슈 생성 완료',
		  '',
		  'success'
		)
window.setTimeout(function() {
	location.href='private.do';	
}, 1500);
</script>