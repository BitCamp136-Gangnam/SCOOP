<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="changpwd" tabindex="-1" role="dialog" aria-hidden="true"
		class="modal fade bd-example-modal-lg">
		<div role="document" class="modal-dialog modal-dialog-centered modal-lg">
			<div class="modal-content">
				<div class="modal-header border-bottom-0">
					<button type="button" data-dismiss="modal" aria-label="Close" class="close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body p-4 p-lg-5">
					<img class="img-responsive center-block" alt="Scoop로고" src="resources/images/logo/ScoopBig.png"
						style="width: 100%; height: auto; padding-right: 15%; padding-left: 15%;" />
					<form action="changePwdOk.do" class="login-form text-left" method="post">
						<h4>비밀번호 변경</h4>
						<div class="form-group mb-4">
							<label>Password</label> <input type=password class="form-control" id="pwd" name="pwd" placeholder="Password" required>
						</div>
						<div class="form-group mb-4">
							<label>Type it again</label> <input type="password" 
								class="form-control" id="pwdchk" name="pwdchk" placeholder="Password" required>
						</div>
						<div class="form-group">
							<center>
								<input type="submit" value="스쿱 시작하기" class="btn btn-primary"
									style="width: 300px; height: 38px; text-align: center; padding-top: 5px;">
							</center>
						</div>

					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>