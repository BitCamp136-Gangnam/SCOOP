<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<link href="<c:url value="/resources/chat/vendor/datatables/dataTables.bootstrap4.css" />" rel="stylesheet">

<!-- Custom styles for this template-->
<%-- <link href="<c:url value="/resources/chat/css/sb-admin.css" />" rel="stylesheet"> --%>

 <!-- Bootstrap core JavaScript-->
  <script src="<c:url value="/resources/chat/vendor/jquery/jquery.min.js" />"></script>
  <script src="<c:url value="/resources/chat/vendor/bootstrap/js/bootstrap.bundle.min.js" />"></script>

  <!-- Core plugin JavaScript-->
  <script src="<c:url value="/resources/chat/vendor/jquery-easing/jquery.easing.min.js" />"></script>

  <!-- Custom scripts for all pages-->
  <script src="<c:url value="/resources/chat/js/sb-admin.min.js" />"></script>
  
  <script type="text/javascript" src="<c:url value="/resources/chat/js/commonAlert.js" />"></script>
  
  <!-- sweetalert2 -->
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
  <script src="sweetalert2.all.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/promise-polyfill"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<link href="https://fonts.googleapis.com/css?family=Gothic+A1|Hi+Melody|Jua|Nanum+Pen+Script&display=swap"
	rel="stylesheet">
<link href="<c:url value="/resources/chat/css/style_message.css" />" rel="stylesheet">
<script type="text/javascript">
	//웹소켓 변수 선언
	//var wsocket;

	$(function() {
		connect();
		$('#message').keypress(function(event) {
			var keycode = (event.keyCode ? event.keyCode : event.which);
			if (keycode == '13'){
				send($('#message').val());
				window.scrollTo(500, 500);
			}

			event.stopPropagation();
		});

		$('#sendBtn').click(function() {
			send($('#message').val());
		});
		
		$('#closeBtn').click(function() {
			self.close();
		});

       $(window).on("beforeunload", function() {
			disconnect();
	    });
	})
	
	function connect() { //입장 버튼 클릭시 작동 함수(웹소켓 생성)
		wsocket = new WebSocket("ws://192.168.6.16:8090/SCOOP/Chat-ws.do?cmd=join&room=${room}");

		//해당 함수 정의
		wsocket.onmessage = onMessage;
	}
	
	function disconnect() {
		wsocket.close();
	}

	function onMessage(evt) { 
		var data = JSON.parse(evt.data);
		appendMessage(data);
	}

	function send(message) {
		let data = { message : message
						, cmd : "message"
						, room : "${room}"
						, img : "${sessionScope.img}"
						 };
		
		wsocket.send(JSON.stringify(data));
		console.log(data.img);
		$("#message").val("");
	}

	function appendMessage(data) {
		console.log(data);
		console.log(data.img);
		var src = "";
        if(data.img==''){
           src = '/SCOOP/resources/images/avatar/avatar.png';
        }else{
           src = '/SCOOP/user/upload/'+data.img;
        }
        console.log(src);
 		if (data.type == "my") {
			 let messageBox = "<div class='direct-chat-msg right clearfix'>"
									+ "	<div class='direct-chat-info text-right'>"
									+ "	<span class='direct-chat-name'>"+ data.sender +"</span>"
									+ "	</div>"
									+ "	<div class='direct-chat-text' style='float:right;'>" + data.message + "</div>"
									+ "</div>";
									
			$("#chatMessageArea").append(messageBox);
		} else if(data.type == "memberInfo"){
			$("#chatMessageArea").append( "<div class='center-message clearfix'>" + data.message + "</div>");
			setChattingMember(data.users);
		} else {
			let messageBox = "<div class='direct-chat-msg clearfix row'>"
									+ "<div class = 'col-sm-1'>"
									+'<img class="img-circle" alt="멤버 프로필 사진 넣는 곳" src="'+src+'" style="float:left;width:40px;height: 40px;padding-top: 1%;margin-left: 10px;margin-right: 10px;">'
									+ "</div>"
									+ "<div class = 'col-sm-11'>"
									+ "	<div class='direct-chat-info'>"
									+ "	<span class='direct-chat-name pull-left'>"+ data.sender +"</span>"
									+ "	</div>"
									+ "	<div class='direct-chat-text'>" + data.message + "</div>"
									+ "</div>"
									+ "</div>";
									
			$("#chatMessageArea").append(messageBox);
		}
		/* let chatAreaHeight = $(".box-body").height();
		console.log(chatAreaHeight);
		console.log($("#chatMessageArea").height());
		let maxScroll = $("#chatMessageArea").height() - chatAreaHeight;
		console.log("scroll");
		console.log(maxScroll);
		$(".box-body").scrollTop(maxScroll); */
		$('#chatMessageArea').scrollTop($('#chatMessageArea')[0].scrollHeight);
	}
	
	function setChattingMember(members){
		$("#memberArea").empty();
		$.each(members, function(index, element){
			let sp = $("<span></span>");
			if(element == "${sessionScope.userid}")
				sp.css("background-color","yellow");
			
			sp.append(element);
			$("#memberArea").append( $("<li style=' padding-left: 10px;'></li>").append(sp));
		})
	}
	
</script>
</head>
<style>


</style>
<body id="page-top">
<div class="col-md-12">
      <!-- DIRECT CHAT PRIMARY -->
      <div class="box box-primary direct-chat direct-chat-primary">
        <div class="box-header with-border">
          <h3 class="box-title"> <%=request.getParameter("room").split("/")[0] %></h3>
<!--           <div class="box-tools pull-right">

             <div class="btn-group gurdeepoushan">
				  <button  class="btn btn-box-tool"  data-toggle="dropdown" type="button" aria-expanded="false">
				   		<i class="fas fa-user-friends"></i>
				   </button>
				  <ul id="memberArea" role="menu" class="dropdown-menu pull-right">
					
				  </ul>
				</div>
            <button type="button" class="btn btn-box-tool" id="closeBtn">
            	<i class="fa fa-times"></i>
           	</button>
          </div> -->
        </div>
        <!-- /.box-header -->
        <div class="box-body">
          <!-- Conversations are loaded here -->
          <div id="chatMessageArea" class="direct-chat-messages" style="height: 300px">
           
          </div>
    
          <!-- /.direct-chat-pane -->
        </div>

        <div id="allChatDiv" class="box-footer" style="position: fixed; bottom: 0">
            <div class="input-group">
              <input type="text" id="message" placeholder="Message" class="form-control">
                  <span class="input-group-btn">
                    <button id="sendBtn" class="btn btn-primary btn-flat">Send</button>
                  </span>
            </div>
        </div>
        <!-- /.box-footer-->
      </div>
      <!--/.direct-chat -->
    </div>
    
</body>

</html>