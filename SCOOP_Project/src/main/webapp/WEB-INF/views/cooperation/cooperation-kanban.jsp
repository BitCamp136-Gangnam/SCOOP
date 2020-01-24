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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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
$(function(){
	//칸반 진행사항 별 갯수 세기
	$('#todolistCnt').text($('#first').children().length-1);
	$('#doingCnt').text($('#second').children().length-1);
  	$('#validateCnt').text($('#third').children().length-1);
  	$('#completeCnt').text($('#fourth').children().length-1);
});
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

	//칸반 진행사항 별 갯수 변경
  	$('#todolistCnt').text($('#first').children().length-1);
  	$('#doingCnt').text($('#second').children().length-1);
  	$('#validateCnt').text($('#third').children().length-1);
  	$('#completeCnt').text($('#fourth').children().length-1);
  
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
            <div class="container-fluid">
        <div class="card">
		<div class="row" style="margin: 2% 2% 15px 2%">
			<div class="col-sm-12" style="padding-left: 0">
				<h3 style="padding-left: 1%;">${tpj.pname}
					<c:if test="${rank == 100}">
            			<i class="fas fa-cog" id="myModal_Edit_Icon" style="margin-left: 5px;cursor: pointer; font-size: 15px" data-toggle="modal" data-target="#myModal_Edit" ></i>
            		</c:if>
				</h3>
				<p style="padding-left: 1%;margin-bottom: 0px;">[${tpj.pcontent}]</p>
			</div>
		</div>
		<div class="row" style="margin-left: 2%;">
			<ul class="nav nav-pills">
			    <li class="nav-item">
			      <a class="nav-link"  href="projectDetail.do?tseq=${tpj.tseq}">팀이슈</a>
			    </li>
			    <li class="nav-item">
			      <a class="nav-link"  href="./private-cal.jsp">팀 캘린더</a>
			    </li>
			    <li class="nav-item">
			      <a class="nav-link" href="cooperation-kanban.do?tseq=${tpj.tseq}">칸반</a>
			    </li>
		    </ul>
		</div>
		<hr style="margin-top: 0;margin-left: 2%; margin-right: 2%;margin-bottom: 0px;">
		<div class="row" style="margin-left: 2%; margin-right: 2%;">
			<div id="todolist" class="col-sm-3 kanban">
			<div class="realkan" id="first" ondrop="drop(event)" ondragover="allowDrop(event)" style="border-top: 4px solid #888;height: 500px;overflow: auto;">
			<div style="margin-bottom: 7%;">
			<div class="iconify" data-icon="uil:file-exclamation-alt" data-inline="false" style="width: 25px;height: auto;"></div>
			<span style="font-size:15px;padding-top:1%;">발의됨(<span id="todolistCnt">0</span>)</span><hr>
			</div>
			
			  <c:forEach items="${tissuelist}" var="tl">
			  	  <c:set value="${tl.tseq}" var="tseq"></c:set>
			  	  <c:if test="${tl.isprocess==0 }">
			  	  <div draggable="true" ondragstart="drag(event)" id="${tl.tiseq }" name="${tl.isprocess }" class="drags" style="margin-bottom: 5%;" >${tl.tititle}
			  	  <a href="teamissueDetail.do?tiseq=${tl.tiseq}" ></a> 
			      </div>
			  	  </c:if>
			  </c:forEach>
			</div>
			</div>
			<div id="doing" class="col-sm-3 kanban">
				<div class="realkan"id="second" ondrop="drop(event)" ondragover="allowDrop(event)" style="border-top: 4px solid #2671bd;height: 500px;overflow: auto">
				<div style="margin-bottom: 7%;">
				<div class="iconify" data-icon="uil:file-edit-alt" data-inline="false"style="width: 25px;height: auto;color:#2671bd"></div>
				<span style="font-size:15px;padding-top:1%;">진행중 (<span id="doingCnt">0</span>)</span><hr>
				</div>
				
				<c:forEach items="${tissuelist}" var="tl">
			  	  <c:if test="${tl.isprocess==1 }">
			  	  <div draggable="true" ondragstart="drag(event)" id="${tl.tiseq }" name="${tl.isprocess }" class="drags" style="margin-bottom: 5%;">${tl.tititle}
			  	  <a href="teamissueDetail.do?tiseq=${tl.tiseq}"></a>
			      </div>
			  	  </c:if>
				  </c:forEach>
				</div>
			</div>
			<div id="validate" class="col-sm-3 kanban" ondrop="drop(event)">
				<div class="realkan" id="third" ondrop="drop(event)" ondragover="allowDrop(event)" style="border-top: 4px solid #cca352;height: 500px;overflow: auto">
				<div style="margin-bottom: 7%;">
				<div class="iconify" data-icon="uil:file-block-alt" data-inline="false" style="width: 25px;height: auto;color:#cca352"></div>
				<span style="font-size:15px;padding-top:1%;">일시중지 (<span id="validateCnt">0</span>)</span><hr>
				</div>
				
				<c:forEach items="${tissuelist}" var="tl">
			  	  <c:if test="${tl.isprocess==2 }">
			  	  <div draggable="true" ondragstart="drag(event)" id="${tl.tiseq }" name="${tl.isprocess }" class="drags" style="margin-bottom: 5%;">${tl.tititle}
			  	  <a href="teamissueDetail.do?tiseq=${tl.tiseq}"></a>
			      </div>
			  	  </c:if>
			  </c:forEach>
				</div>
			</div>
			<div id="complete" class="col-sm-3 kanban" ondrop="drop(event)">
				<div class="realkan" id="fourth" ondrop="drop(event)" ondragover="allowDrop(event)" style="border-top: 4px solid #26805c;height: 500px;overflow: auto">
				<div style="margin-bottom: 7%;">
				<div class="iconify" data-icon="uil:file-check-alt" data-inline="false" style="width: 25px;height: auto;color:#26805c"></div>
				<span style="font-size:15px;padding-top:1%;">완료 (<span id="completeCnt">0</span>)</span><hr>
				</div>
				
				<c:forEach items="${tissuelist}" var="tl">
			  	  <c:if test="${tl.isprocess==3 }">
			  	  <div draggable="true" ondragstart="drag(event)" id="${tl.tiseq }" name="${tl.isprocess }" class="drags" style="margin-bottom: 5%;">${tl.tititle}
			  	  <a href="teamissueDetail.do?tiseq=${tl.tiseq}"></a>
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