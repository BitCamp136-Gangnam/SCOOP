<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/commons/footer.jsp"></jsp:include>
<script>
Swal.fire(
		  '캘린더 생성 성공!',
		  '새로운 일정이 생성되었습니다',
		  'success'
		)
window.setTimeout(function() {
	location.href='calendar.do';	
}, 1500);
</script>