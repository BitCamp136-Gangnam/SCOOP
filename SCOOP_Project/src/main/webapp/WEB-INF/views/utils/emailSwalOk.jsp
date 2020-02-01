<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/commons/footer.jsp"></jsp:include>
<script>
Swal.fire(
		  '이메일 전송 완료',
		  '협업공간에 멤버가 초대되었습니다!',
		  'success'
		)
window.setTimeout(function() {
	location.href='userindex.do';	
}, 1000);
</script>