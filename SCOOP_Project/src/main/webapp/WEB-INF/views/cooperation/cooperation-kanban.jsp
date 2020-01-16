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
    <link href="<c:url value='/resources/css/style.css' />" rel="stylesheet">

</head>
<style>
.myinfo{
 border: 0;
 border-bottom: 1px solid #c8c8c8;
 background-color: white;
}
.form-control[readonly]{
	background-color: white;
}
.kanban{
  float: left;
}
.realkan{
  margin:2%;
  border: 1px solid #c8c8c8;
  min-height: 400px;
  height:400px;
  padding: 4%;
  border-radius: 0.625rem;
  overflow: auto;
}
.drags{
  border: 1px solid #c8c8c8;
  height: 40px;
  font-size: 14px;
  padding: 10px;
  border-radius: 0.625rem;
}
h5{
  margin-bottom: 10%;
}
</style>
<script>
function allowDrop(ev) {
  ev.preventDefault();
}

function drag(ev) {
  ev.dataTransfer.setData("text", ev.target.id);
}
var tseq = document.location.href.split("tseq=")[1]; 
function drop(ev) {
  ev.preventDefault();
  var data = ev.dataTransfer.getData("text");
 

  console.log(document.getElementById(data).getAttribute("name"));
  if(ev.target.parentElement.getAttribute("id")=="todolist"){
	  if(document.getElementById(data).getAttribute("name")!=0){
	    ev.target.appendChild(document.getElementById(data));
	    $.ajax({
		    url:'kanbanEdit.do', //request 보낼 서버의 경로
		    type:'post', // 메소드(get, post, put 등)
		    data:{'tiseq':document.getElementById(data).getAttribute("id"),
		    	'isprocess':0,
		    	'tseq':tseq
		    	}, //보낼 데이터
		    success: function(data) {
		    	Swal.fire({
		    		  title: "변경 성공",
		    		  text: "변경 성공",
		    		  icon: "success",
		    		  button: "확인"
		    		})
		    },
		    error: function(err) {
		    	Swal.fire({
		    		  title: "변경 실패",
		    		  text: "변경 실패",
		    		  icon: "error",
		    		  button: "확인"
		    		})
		    }
		});
	  }
	} else if(ev.target.parentElement.getAttribute("id")=="doing"){
		if(document.getElementById(data).getAttribute("name")!=1){
		    ev.target.appendChild(document.getElementById(data));
		    $.ajax({
			    url:'kanbanEdit.do', //request 보낼 서버의 경로
			    type:'post', // 메소드(get, post, put 등)
			    data:{'tiseq':document.getElementById(data).getAttribute("id"),
			    	'isprocess':1,
			    	'tseq':tseq
			    	}, //보낼 데이터
			    success: function(data) {
			    	Swal.fire({
			    		  title: "변경 성공",
			    		  text: "변경 성공",
			    		  icon: "success",
			    		  button: "확인"
			    		})
			    },
			    error: function(err) {
			    	Swal.fire({
			    		  title: "변경 실패",
			    		  text: "변경 실패",
			    		  icon: "error",
			    		  button: "확인"
			    		})
			    }
			});
		  }
	} else if(ev.target.parentElement.getAttribute("id")=="validate"){
		if(document.getElementById(data).getAttribute("name")!=2){
		    ev.target.appendChild(document.getElementById(data));
		    $.ajax({
			    url:'kanbanEdit.do', //request 보낼 서버의 경로
			    type:'post', // 메소드(get, post, put 등)
			    data:{'tiseq':document.getElementById(data).getAttribute("id"),
			    	'isprocess':2,
			    	'tseq':tseq
			    	}, //보낼 데이터
			    success: function(data) {
			    	Swal.fire({
			    		  title: "변경 성공",
			    		  text: "변경 성공",
			    		  icon: "success",
			    		  button: "확인"
			    		})
			    },
			    error: function(err) {
			    	Swal.fire({
			    		  title: "변경 실패",
			    		  text: "변경 실패",
			    		  icon: "error",
			    		  button: "확인"
			    		})
			    }
			});
		  }
	} else if(ev.target.parentElement.getAttribute("id")=="complete"){
		if(document.getElementById(data).getAttribute("name")!=3){
		    ev.target.appendChild(document.getElementById(data));
		    $.ajax({
			    url:'kanbanEdit.do', //request 보낼 서버의 경로
			    type:'post', // 메소드(get, post, put 등)
			    data:{'tiseq':document.getElementById(data).getAttribute("id"),
			    	'isprocess':3,
			    	'tseq':tseq
			    	}, //보낼 데이터
			    success: function(data) {
			    	Swal.fire({
			    		  title: "변경 성공",
			    		  text: "변경 성공",
			    		  icon: "success",
			    		  button: "확인"
			    		})
			    },
			    error: function(err) {
			    	Swal.fire({
			    		  title: "변경 실패",
			    		  text: "변경 실패",
			    		  icon: "error",
			    		  button: "확인"
			    		})
			    }
			});
		  }
	}
 
}
</script>
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
				<h3>쫀쬬니</h3>
			</div>
		</div>
		<div class="row" style="margin-left: 2%;">
			<ul class="nav nav-pills">
			    <li class="nav-item">
			      <a class="nav-link" href="./cooperation-issue.jsp">협업공간 이슈</a>
			    </li>
			    <li class="nav-item">
			      <a class="nav-link" href="./cooperation-kanban.jsp">칸반</a>
			    </li>
			    <li class="nav-item">
			      <a class="nav-link" href="./cooperation-cal.jsp">캘린더</a>
			    </li>
		    </ul>
		</div>
		<hr style="margin-top: 0;margin-left: 2%; margin-right: 2%">
		<div class="row" style="margin-left: 2%; margin-right: 2%;">
			<div id="todolist" class="col-sm-3 kanban">
			<div class="realkan" ondrop="drop(event)" ondragover="allowDrop(event)" style="border-top: 4px solid #888">
			<h5>발의됨</h5>
			  <c:forEach items="${tissuelist}" var="tl">
			  	  <c:set value="${tl.tseq}" var="tseq"></c:set>
			  	  <c:if test="${tl.isprocess==0 }">
			  	  <div draggable="true" ondragstart="drag(event)" id="${tl.tiseq }" name="${tl.isprocess }" class="drags">${tl.tititle}
			      </div>
			  	  </c:if>
			  </c:forEach>
			  <div draggable="true" ondragstart="drag(event)" id="drag1" class="drags">발의안건 1</div>
			  <div draggable="true" ondragstart="drag(event)" id="drag2" class="drags">발의안건 2</div>
			  <div draggable="true" ondragstart="drag(event)" id="drag3" class="drags">발의안건 3</div>
			  <div draggable="true" ondragstart="drag(event)" id="drag4" class="drags">발의안건 4</div>
			  <div draggable="true" ondragstart="drag(event)" id="drag5" class="drags">발의안건 5</div>
			  <div draggable="true" ondragstart="drag(event)" id="drag6" class="drags">발의안건 6</div>
			  <div draggable="true" ondragstart="drag(event)" id="drag7" class="drags">발의안건 7</div>
			  <div draggable="true" ondragstart="drag(event)" id="drag8" class="drags">발의안건 8</div>
			  <div draggable="true" ondragstart="drag(event)" id="drag9" class="drags">발의안건 9</div>
			  <div draggable="true" ondragstart="drag(event)" id="drag10" class="drags">발의안건 10</div>
			</div>
			</div>
			<div id="doing" class="col-sm-3 kanban">
				<div class="realkan" ondrop="drop(event)" ondragover="allowDrop(event)" style="border-top: 4px solid #2671bd">
				<h5>진행중</h5>
				<c:forEach items="${tissuelist}" var="tl">
			  	  <c:if test="${tl.isprocess==1 }">
			  	  <div draggable="true" ondragstart="drag(event)" id="${tl.tiseq }" name="${tl.isprocess }" class="drags">${tl.tititle}
			      </div>
			  	  </c:if>
				  </c:forEach>
				</div>
			</div>
			<div id="validate" class="col-sm-3 kanban" ondrop="drop(event)">
				<div class="realkan" ondrop="drop(event)" ondragover="allowDrop(event)" style="border-top: 4px solid #cca352">
				<h5>일시중지</h5>
				<c:forEach items="${tissuelist}" var="tl">
			  	  <c:if test="${tl.isprocess==2 }">
			  	  <div draggable="true" ondragstart="drag(event)" id="${tl.tiseq }" name="${tl.isprocess }" class="drags">${tl.tititle}
			      </div>
			  	  </c:if>
			  </c:forEach>
				</div>
			</div>
			<div id="complete" class="col-sm-3 kanban" ondrop="drop(event)">
				<div class="realkan" ondrop="drop(event)" ondragover="allowDrop(event)" style="border-top: 4px solid #26805c">
				<h5>완료</h5>
				<c:forEach items="${tissuelist}" var="tl">
			  	  <c:if test="${tl.isprocess==3 }">
			  	  <div draggable="true" ondragstart="drag(event)" id="${tl.tiseq }" name="${tl.isprocess }" class="drags">${tl.tititle}
			      </div>
			  	  </c:if>
			  </c:forEach>
				</div>
			</div>
		</div>
            <!-- #/ container -->
            </div>
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
    </div>
    <!--**********************************
        Main wrapper end
    ***********************************-->

    <!--**********************************
        Scripts
    ***********************************-->
    <script src="<c:url value='/resources/plugins/common/common.min.js' />"></script>
    <script src="<c:url value='/resources/js/custom.min.js' />"></script>
    <script src="<c:url value='/resources/js/settings.js' />"></script>
    <script src="<c:url value='/resources/js/gleek.js' />"></script>
    <script src="<c:url value='/resources/js/styleSwitcher.js' />"></script>

</body>

</html>