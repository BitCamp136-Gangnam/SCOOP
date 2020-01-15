<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <jsp:include page="/WEB-INF/views/commons/title.jsp"></jsp:include>
    <!-- Custom Stylesheet -->
    <link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">
</head>

<script language="javascript" src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>
<script>
$(document).ready(function(){
	//회원정보 유효성검사
	function pwdcheck() {
		var getCheck = RegExp(/^[a-zA-Z0-9]{4,12}$/);
		
		//비밀번호 유효성
		if (!getCheck.test($("#pwd").val())) {
			Swal.fire("비밀번호 형식에 맞게 입력해주세요.");
			$("#pwd").val("");
			$("#pwd").focus();
			return false;
		}

		//비밀번호 공백 확인
		if ($("#pwd").val() == "") {
			Swal.fire("비밀번호를 입력해주세요");
			$("#pwd").focus();
			return false;
		}

		return true;
	}

	$('#Photo').change(function(){
		var reader = new FileReader();
		
		reader.onload = function(e) {
			
			document.getElementById("profile").src = e.target.result;
		};
		
		reader.readAsDataURL(this.files[0]);
	});
	
	});
</script>

<style>
.myinfo{
 border: 0;
 border-bottom: 1px solid #c8c8c8;
 background-color: white;
}
.form-control[readonly]{
	background-color: white;
}
</style>
<body>

    <jsp:include page="/WEB-INF/views/commons/preloader.jsp"></jsp:include>

    
    <!--**********************************
        Main wrapper start
    ***********************************-->
    <div id="main-wrapper">

      <jsp:include page="/WEB-INF/views/commons/headerAndLeft.jsp"></jsp:include>

        <!--**********************************
            Content body start
        ***********************************-->
        <div class="content-body">
        <br>
            <div class="container-fluid">
        <div class="card" style="min-height: 1080px">
		<div class="row" style="margin: 2%">
			<div class="col-sm-12" style="padding-left: 0">
				<h3>내 정보</h3>
			</div>
		</div>
		<div class="row" style="margin-left: 2%;">
			<ul class="nav nav-pills">
			    <li class="nav-item">
			      <a class="nav-link" href="memberEdit.do?${sessionScope.email}">내 정보</a>
			    </li>
			    <li class="nav-item">
			      <a class="nav-link" href="app-alram.do">알림</a>
			    </li>
			    <li class="nav-item">
			      <a class="nav-link" href="app-external.do">외부 서비스 연결</a>
			    </li>
			    <li class="nav-item">
			      <a class="nav-link" href="paymentPage.do">가격 및 결제</a>
			    </li>
		    </ul>
		</div>
		<hr style="margin-top: 0">
	<form onsubmit="return pwdcheck()" action="editCheck.do" method="post" enctype="multipart/form-data">
		<div class="row" style="margin-left: 4%; margin-right: 2%; margin-top: 1%">
			<div class="media align-items-center mb-4">
					<c:choose>
						<c:when test="${member.profile == 'null'}">
							<img id ="profile" class="mr-3 img-circle" src="<c:url value="/resources/images/avatar/avatar.png" />" width="120" height="120" alt="" name="profile">
							<input type="file" name="profile" id="Photo" accept="image/*">
						</c:when>
						<c:otherwise>
                             <img id ="profile" class="mr-3 img-circle" src="${member.profile}/>" width="120" height="120" alt="" name="profile">
                             <input type="file" name="profile" id="Photo" accept="image/*">
						</c:otherwise>
					</c:choose>
                                    <div class="media-body">
                                        <h3 class="mb-0">${member.name}</h3>
                                        <p class="text-muted mb-0" style="margin-left: 2%; width: 300px;">${member.email}</p>
                                    </div>
                                </div>
		</div>
		<div class="row" style="margin-left: 4%; margin-top: 2%">
		<div class="form-group" style="width: 100%">
    		<label for="email">이메일</label>
    		<input class="form-control myinfo" type="text" id="email" name="email" style="width: 60%" readonly="readonly" value="${member.email}">
    		<br>
    		<c:choose>
    		<c:when test="${member.pwd == 'google'}">
    		<label for="pwd">비밀번호</label>
    		<input class="form-control myinfo" type="text" id="pwd_google" name="pwd" style="width: 60%" value="구글에 문의하세요" readonly="readonly">
    		</c:when>
    		<c:when test="${member.pwd == 'naver'}">
    		<label for="pwd">비밀번호</label>
    		<input class="form-control myinfo" type="text" id="pwd_naver" name="pwd" style="width: 60%" value="네이버에 문의하세요" readonly="readonly">
    		</c:when>
    		<c:otherwise>
    		<label for="pwd">비밀번호</label>
    		<input class="form-control myinfo" type="password" id="pwd" name="pwd" style="width: 60%">
    		</c:otherwise>
    		</c:choose>
    		<br>
    		<label for="name">이름</label>
    		<input class="form-control myinfo" type="text" id="name" name="name" style="width: 60%"  value="${member.name}">
    		<br>
    		<label for="dname">부서</label>
    		<input class="form-control myinfo" type="text" id="dname" name="dname" style="width: 60%" value="${member.dname}">
    		<br>
    		<label for="drank">직함</label>
    		<input class="form-control myinfo" type="text" id="drank" name="drank" style="width: 60%" value="${member.drank}">
    		<br>
    		<label for="address">주소</label>
    		<input class="form-control myinfo" type="text" id="address" name="address" style="width: 60%" value="${member.address}">
    		<br>
    		<input type="submit" class="btn" style="background-color: #E71D36; border-color: #CCCCCC; color: #fff; cursor: pointer;" value="수정완료">
    		</div>
    		</div>
    		</form>	
    
    	</div>
    	
    	</div>
            <!-- #/ container -->
            </div>
            </div>
        
        <!--**********************************
            Content body end
        ***********************************-->
        
        
        <!--**********************************
            Footer start
        ***********************************-->
       <jsp:include page="/WEB-INF/views/commons/footer.jsp"></jsp:include>
        <!--**********************************
            Footer end
        ***********************************-->
    <!--**********************************
        Main wrapper end
    ***********************************-->

    <!--**********************************
        Scripts
    ***********************************-->
      <script src="<c:url value="/resources/plugins/common/common.min.js" />"></script>
    <script src="<c:url value="/resources/js/custom.min.js" />"></script>
    <script src="<c:url value="/resources/js/settings.js" />"></script>
    <script src="<c:url value="/resources/js/gleek.js" />"></script>
    <script src="<c:url value="/resources/js/styleSwitcher.js" />"></script>

</body>

</html>