<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ref" value="${ref+1}" />
<!-- Page level plugin CSS-->
<link href="<c:url value="/resources/chat/vendor/datatables/dataTables.bootstrap4.css" />" rel="stylesheet">

<!-- Custom styles for this template-->
<link href="<c:url value="/resources/chat/css/sb-admin.css" />" rel="stylesheet">

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
  
  
<!--**********************************
            Footer start
        ***********************************-->
<link href="<c:url value="/resources/css/chat.css" />" rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.5.0/css/all.css"
	integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU"
	crossorigin="anonymous">
<script type="text/javascript">
	let wsocket;
	
	$(function() {
		connect();

/* 		$('#dataTable').DataTable({
		 	"searching": false,
		 	"ordering": false
 		}); */
 		
		$("#createChat").click( function() {
			backAndForth();
		});

		$(window).on("beforeunload", function(){
			disconnect();
	    });

	    $('#dataTable tbody').on( 'click', 'button', function () {
	    	openChat($(this).attr("id"));
	    });
	})
	
		
	const steps = ['방 제목', '최대 인원'];
	const swalQueueStep = Swal.mixin({
	  confirmButtonText: 'Next',
	  cancelButtonText: 'Back',
	  progressSteps: ['1','2'],
	  input: 'text',
	  inputAttributes: {
	    required: true
	  },
	  reverseButtons: true,
	  validationMessage: '필수 입력사항입니다.'
	})

	 async function backAndForth () {
	  const values = [];
	  let currentStep;

	  for (currentStep = 0; currentStep < steps.length;) {
	    const result = await swalQueueStep.fire({
	      title: steps[currentStep],
	      inputValue: values[currentStep],
	      showCancelButton: currentStep > 0,
	      currentProgressStep: currentStep
	    })
	
	    if (result.value) {
	      values[currentStep] = result.value
	      currentStep++
	    } else if (result.dismiss === 'cancel') {
	      currentStep--
	    } else {
	      break
	    }
	  }

	  if (currentStep === steps.length) {
	    let data = { cmd : "createChatRoom", 
	    	    	name : values[0], 
	    	    	max : values[1],
	    	    	ref : "${ref}"
	    	    		};

	    wsocket.send(JSON.stringify(data));   
	    openChat(data.name);
	  }
	}

	 function connect() {
		wsocket = new WebSocket("ws://192.168.6.16:8090/SCOOP/Chat-ws.do?cmd=on"); 
		wsocket.onmessage = onMessage;
		wsocket.onclose = onClose;
	}

	function disconnect() { 
		wsocket.close();
	}
	
	function onMessage(evt) { 
		var data = JSON.parse(evt.data); 
		setChatRooms(data);
		
	}
	
	function onClose(evt) {
		
	}

	function setChatRooms(data){
		let num = 1;
		$('#dataTable > tbody').empty();
		$.each(data.rooms, function(index, element){
			let room = $("<tr></tr>");
			room.append("<td>" + (num++) + "</td>");
			room.append("<td>"+element.name+"</td>");
			room.append("<td>"+element.users.length+ " / " +element.max+"</td>");
 			let btn = $("<button>입장</button>");
			if(element.users.length == element.max)
				btn.attr("disabled",true);

			btn.attr("id", element.name);
			room.append($("<td></td>").append(btn));
			 $('#dataTable > tbody').append(room);
		})
	}
		
    function sendSocket(jsonData) {
    
    }

    function openChat(room){
    	let url = "Chat.do?room="+room;
    	let name = room;
    	let option = "width = 500, height = 500, top = 100, left = 200, location = no, channelmode = yes";
        window.open(url, name, option);
    }
</script>
<script type="text/javascript">
	$(function() {
		$('#chatopen')
				.click(
						function() {
							if ($(this).attr('name') == 'on') {
								$(this)
										.attr('src',
												"<c:url value='/resources/images/chat/chatclose.png' />");
								$(this).attr('name', 'off');
								$('#chatdivopen').show();
							} else {
								$(this)
										.attr('src',
												"<c:url value='/resources/images/chat/chatopen.png' />");
								$(this).attr('name', 'on');
								$('#chatdivopen').hide();
							}
						});
		$('#helpopen').click(function() {
			if ($(this).attr('name') == 'on') {
				$(this).attr('name', 'off');
				$('#helpdivopen').show();
				$('#closeopen').show();
			}
		});
		$('#closeopen').click(function() {
			$('#helpopen').attr('name', 'on');
			$('#helpdivopen').hide();
			$('#closeopen').hide();
		})
		$(document).keydown(function(event) {
			if (event.ctrlKey && event.keyCode == 191) {
				console.log("됏냐?");
				if ($('#helpopen').attr('name') == 'on') {
					$('#helpopen').attr('name', 'off');
					$('#helpdivopen').show();
					$('#closeopen').show();
				} else {
					$('#helpopen').attr('name', 'on');
					$('#helpdivopen').hide();
					$('#closeopen').hide();
				}
			}
		});
	});
</script>
<style>
#chatopen {
	position: fixed;
	bottom: 16px;
	right: 16px;
	font-size: 18px;
	z-index: 1;
}

#chatdivopen {
	display: none;
	width: 500px;
	position: fixed;
	bottom: 60px;
	right: 16px;
	font-size: 18px;
	z-index: 1;
}

#helpopen {
	position: fixed;
	bottom: 16px;
	left: 16px;
	font-size: 18px;
	z-index: 1;
}

#helpdivopen {
	background-color: #222;
	width: 245px;
	height: 100%;
	display: none;
	position: fixed;
	bottom: 0;
	left: 0;
	font-size: 18px;
	z-index: 4;
	padding: 0px 15px 0px 13px;
	overflow: auto;
}

#closeopen {
	position: fixed;
	bottom: 96%;
	left: 200px;
	font-size: 18px;
	z-index: 5;
}

.accordion {
	background-color: #222;
	color: white;
	cursor: pointer;
	padding: 10px;
	width: 100%;
	border: none;
	text-align: left;
	outline: none;
	font-size: 12px;
	transition: 0.4s;
}

.activeacc, .accordion:hover {
	background-color: #222;
}

.panel {
	padding: 0 13px;
	display: none;
	overflow: hidden;
	font-size: 12px;
	transition: max-height 0.2s ease-out;
}

::-webkit-scrollbar {
	width: 3px;
}

::-webkit-scrollbar-track {
	background-color: rgba(255,255,255,0.3);
}

::-webkit-scrollbar-thumb {
	background-color: #ad2d45;
	border-radius: 25px;
}

::-webkit-scrollbar-thumb:hover {
	background: #ad2d45;
}

::-webkit-scrollbar-button:start:decrement, ::-webkit-scrollbar-button:end:increment
	{
	width: 3px;
	height: 3px;
	background: rgba(61, 56, 57,0.5);
}
</style>
<div class="footer">
	<div class="copyright">
		<p>
			Copyright &copy; Designed & Developed by <a
				href="https://themeforest.net/user/quixlab">Quixlab</a> 2018
		</p>
	</div>
</div>
<!-- chat 시작 -->
			<div id="chatdivopen">
				<div class="card">
					<div class="card-header">
						<i class="fas fa-comments"></i> 실시간 채팅
						<button id="createChat" class="btn btn-primary mb-3" type="button">채팅방	만들기</button>
					</div>
					<div class="card-body" style="padding-top: 0; height: 200px;">
						<div class="table-responsive">
							<table class="table table-bordered" id="dataTable">
								<thead>
									<tr>
										<th width="10%">NO</th>
										<th width="60%">NAME</th>
										<th width="10%">USER</th>
										<th width="10%">ENTER</th>
									</tr>
								</thead>
								<tbody>

								</tbody>
							</table>
						</div>
					</div>
				</div>

			</div>
<!-- chat 끝 -->
<div id="helpdivopen" class="scrollbar">
	<h4 style="margin: 15%; margin-bottom: 5%; color: white">도움센터(Ctrl+/)</h4>
	<h5 style="color: white; padding-top: 15px;">추천 팁</h5>
	<p
		style="border-bottom: 1px solid rgba(255, 255, 255, 0.3); margin-bottom: 0px; color: rgba(255, 255, 255, 0.3); font-size: 12px; padding: 10px 0px 5px 0px;">새로운
		소식</p>
	<button class="accordion">이슈 업데이트</button>
	<div class="panel">
		<p>이미지 넣어줘야해~~</p>
	</div>
	<button class="accordion">호출됨</button>
	<div class="panel">
		<p>이미지 넣어줘야해~~~</p>
	</div>

	<p
		style="border-bottom: 1px solid rgba(255, 255, 255, 0.3); margin-bottom: 0px; color: rgba(255, 255, 255, 0.3); font-size: 12px; padding: 10px 0px 5px 0px;">협업공간</p>
	<button class="accordion">협업공간 만들기</button>
	<div class="panel">
		<p>이미지 넣어줘야해~~</p>
	</div>
	<button class="accordion">멤버 초대</button>
	<div class="panel">
		<p>이미지 넣어줘야해~~~</p>
	</div>
	<button class="accordion">협업공간 관리</button>
	<div class="panel">
		<p>이미지 넣어줘야해~~~</p>
	</div>

	<p
		style="border-bottom: 1px solid rgba(255, 255, 255, 0.3); margin-bottom: 0px; color: rgba(255, 255, 255, 0.3); font-size: 12px; padding: 10px 0px 5px 0px;">이슈</p>
	<button class="accordion">멘션</button>
	<div class="panel">
		<p>이미지 넣어줘야해~~</p>
	</div>
	<button class="accordion">소스 코드</button>
	<div class="panel">
		<p>이미지 넣어줘야해~~~</p>
	</div>
	<button class="accordion">구글 드라이브</button>
	<div class="panel">
		<p>이미지 넣어줘야해~~~</p>
	</div>
	<button class="accordion">파일 공유</button>
	<div class="panel">
		<p>이미지 넣어줘야해~~~</p>
	</div>
	<button class="accordion">관련 이슈 공유</button>
	<div class="panel">
		<p>이미지 넣어줘야해~~~</p>
	</div>
	<button class="accordion">의사결정 할당</button>
	<div class="panel">
		<p>이미지 넣어줘야해~~~</p>
	</div>
	<button class="accordion">할일 주기</button>
	<div class="panel">
		<p>이미지 넣어줘야해~~~</p>
	</div>
	<button class="accordion">일정 공유</button>
	<div class="panel">
		<p>이미지 넣어줘야해~~~</p>
	</div>

	<script>
		var acc = document.getElementsByClassName("accordion");
		var i;

		for (i = 0; i < acc.length; i++) {
			acc[i].addEventListener("click", function() {
				this.classList.toggle("activeacc");
				var panel = this.nextElementSibling;
				if (panel.style.display === "block") {
					panel.style.display = "none";
				} else {
					panel.style.display = "block";
				}
			});
		}
	</script>

</div>
<img src="<c:url value="/resources/images/chat/chatopen.png" />"
	id="chatopen" name="on" width=50px height=auto style="cursor: pointer;">
<img src="<c:url value="/resources/images/chat/questionmark.png" />"
	id="helpopen" name="on" width=50px height=auto style="cursor: pointer;">
<img src="<c:url value="/resources/images/chat/close.png" />"
	id="closeopen" name="on" width=20px height=auto
	style="cursor: pointer; display: none">
<!--**********************************
            Footer end
        ***********************************-->