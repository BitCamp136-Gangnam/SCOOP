<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<jsp:include page="/WEB-INF/views/commons/title.jsp"></jsp:include>
<!-- Favicon icon -->
<!-- Pignose Calender -->
<link
	href="<c:url value="/resources/plugins/pg-calendar/css/pignose.calendar.min.css" />"
	rel="stylesheet">
<!-- Chartist -->
<link rel="stylesheet"
	href="<c:url value="/resources/plugins/chartist/css/chartist.min.css" />">
<link rel="stylesheet"
	href="<c:url value="/resources/plugins/chartist-plugin-tooltips/css/chartist-plugin-tooltip.css" />">
<!-- Custom Stylesheet -->
<link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">

</head>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		//더보기 스타일 변경
		$('#load').mouseover(function() {
			$(this).css("color", "#E71D36");
		});
		$('#load').mouseout(function() {
			$(this).css("color", "#464a53");
		});
		var temp = 0;
		var moreEventArray = document.querySelectorAll("#one > #ialarm ");
		if (moreEventArray.length <= 10) {
			$('#load').remove();
			$('#loadPlus').remove();
			$('.tooltip').remove();
		}
		$(moreEventArray).attr("hidden", "hidden");
		$(moreEventArray).slice(0, 10).removeAttr("hidden");
		$(moreEventArray).slice(0, 10);
		temp = 10;
		$("#load").click(function(e) {
			console.log(moreEventArray);
			/* console.log($('.card'));
			console.log($('.card > a'));
			console.log($('.card > a > .row'));
			console.log($(".card > a > .row").val()); */
			console.log("if");
			$(moreEventArray).slice(temp, temp + 10).removeAttr("hidden");
			temp += 10;
			if (moreEventArray.length < temp + 10) {
				$(moreEventArray).slice(temp, 10).removeAttr("hidden");
				if (temp - moreEventArray.length >= 0) {
					$('#load').remove();
					$('#loadPlus').remove();
					$('.tooltip').remove();
				}

			}

		});

	});
</script>


<style>
.newissue {
	border-bottom: 1px solid #c8c8c8;
	padding-top: 0.7%;
	padding-bottom: 0.7%;
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

			<div class="container-fluid">
				<div class="card">
					<div class="row" style="margin-left: 2%; margin-top: 3%">
						<select id="selectMenu" name="menu" class="nav-item"
							onchange="changeItem()" style="color: #76838f; border: 0">
							<option value="99" style="color: #76838f">새로운 이슈 선택</option>
							<option value="0" style="color: #76838f">새로운 팀이슈</option>
							<option value="1" style="color: #76838f">새로운 댓글</option>
							<option value="3" style="color: #76838f">새로운 공지사항</option>
						</select>
						<ul class="nav nav-pills">
							<!-- <li class="nav-item dropdown"><a
                        class="nav-link dropdown-toggle" data-toggle="dropdown" href="#">정렬</a>
                        <div class="dropdown-menu">
                           <a class="dropdown-item" data-toggle="tab" href="#">안읽음</a> <a
                              class="dropdown-item" data-toggle="tab" href="#">읽음</a>
                        </div></li>
                     <li class="nav-item"><a class="nav-link active"
                        data-toggle="tab" href="#">협업 진행률</a></li>
                     <li class="nav-item"><a class="nav-link active"
                        data-toggle="tab" href="#">이슈 업데이트</a></li> -->
							<li class="nav-item"><a href="mention.do" class="nav-link" style="color: #E71D36">@멘션</a></li>
						</ul>
					</div>
					<hr style="margin-top: 0; margin-left: 2%; margin-right: 2%">
					<div class="row">
						<div class="col-sm-6"style="margin: 2% 2% 2% 7%; border-radius: 0.5rem;" id="one">
							<div class="row" style="margin-left: 2%; margin-right: 2%">
								<div class="col-sm-3 newissue" id="al">
									<p>
										<b>협업공간</b>
									</p>
								</div>
								<div class="col-sm-6 newissue" id="ti">
									<p>
										<b>제목</b>
									</p>
								</div>
								<div class="col-sm-3 newissue" id="day">
									<p>
										<b>시간</b>
									</p>
								</div>
							</div>
							<c:forEach items="${mentions}" var="m">
								<div class="row countRow"
									style="margin-left: 2%; margin-right: 2%" id="ialarm">
									<div class="col-sm-3 newissue" id="al">
										<a href="projectDetail.do?tseq=${m.tseq}">${m.pname}</a>
									</div>
									<div class="col-sm-6 newissue" id="ti">
										<a href="teamissueDetail.do?tiseq=${m.tiseq}">${m.tititle}</a>
									</div>
									<div class="col-sm-3 newissue" id="day">
										<p>${fn:substring(m.tidate,0,16)}</p>
									</div>

								</div>
							</c:forEach>
							<div id="loadPlus" data-toggle="tooltip" data-placement="bottom"title="더 보기">
								<div id="load" class="iconify"style="font-size: 40px; color: #464a53; cursor: pointer; margin-left:295px; margin-top: 1%;"data-icon="mdi:chevron-double-down" data-inline="false">더보기</div>
							</div>
						</div>
						
						<div class="col-sm-4">
							<select id="selectDash" name="selectDash" class="form-control"
								style="margin-top: 7%;">
								<%-- <option value="${sessionScope.email}">여기는 select공간</option> --%>
								<c:choose>
									<c:when test="${fn:length(pjtlist) > 0}">
										<c:forEach items="${pjtlist}" var="p">
											<option value="${p.tseq}">${p.pname}</option>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<option value="-1">참여한 팀이 없습니다</option>
									</c:otherwise>
								</c:choose>

							</select>
							<div
								style="width: 100%; height: 550px; margin: 5% 0 5% 0; float: right; padding-top: 2%; padding-bottom: 2%; border-radius: 0.5rem;">
								<!-- 차트 -->
								<canvas id="myChart"></canvas>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
		<!--**********************************
            Content body end
        ***********************************-->


		<jsp:include page="/WEB-INF/views/commons/footer.jsp"></jsp:include>

	</div>
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

	<!-- Chartjs -->
	<script
		src="<c:url value="/resources/plugins/chart.js/Chart.bundle.min.js" />"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
	<!-- Circle progress -->
	<script
		src="<c:url value="/resources/plugins/circle-progress/circle-progress.min.js" />"></script>
	<!-- Datamap -->
	<script src="<c:url value="/resources/plugins/d3v3/index.js"/>"></script>
	<script
		src="<c:url value="/resources/plugins/topojson/topojson.min.js"/>"></script>
	<script
		src="<c:url value="/resources/plugins/datamaps/datamaps.world.min.js"/>"></script>
	<!-- Morrisjs -->
	<script
		src="<c:url value="/resources/plugins/raphael/raphael.min.js"/>"></script>
	<script src="<c:url value="/resources/plugins/morris/morris.min.js"/>"></script>
	<!-- Pignose Calender -->
	<script src="<c:url value="/resources/plugins/moment/moment.min.js"/>"></script>
	<script
		src="<c:url value="/resources/plugins/pg-calendar/js/pignose.calendar.min.js"/>"></script>
	<!-- ChartistJS -->
	<script
		src="<c:url value="/resources/plugins/chartist/js/chartist.min.js"/>"></script>
	<script
		src="<c:url value="/resources/plugins/chartist-plugin-tooltips/js/chartist-plugin-tooltip.min.js"/>"></script>

	<script src="<c:url value="/resources/js/dashboard/dashboard-1.js"/>"></script>
	<script type="text/javascript">
		/* 팀 선택시 차트 변경 */
		$('#selectDash').change(
				function() {
					let tseq = $(this).val();
					console.log(tseq);
					/* 비동기 차트 데이터 불러오기 */
					$.ajax({
						url : "selectChart.do",
						type : "POST",
						data : {
							"tseq" : tseq
						},
						success : function(data) {
							console.log(data);
							/* 차트 생성 */
							let ctx = document.getElementById('myChart')
									.getContext('2d');
							let myChart = new Chart(ctx, {
								type : 'doughnut',
								data : {
									labels : [ '발의됨', '진행중', '일시중지', '완료' ],
									datasets : [ {
										label : '# of Votes',
										data : [ data.initiative,
												data.progress, data.pause,
												data.complete ],
										backgroundColor : [
												'rgba(255, 99, 132, 0.2)',
												'rgba(54, 162, 235, 0.2)',
												'rgba(255, 206, 86, 0.2)',
												'rgba(75, 192, 192, 0.2)' ],
										borderColor : [
												'rgba(255, 99, 132, 1)',
												'rgba(54, 162, 235, 1)',
												'rgba(255, 206, 86, 1)',
												'rgba(75, 192, 192, 1)' ],
										borderWidth : 1
									} ]
								},
								options : {
									title : {
										display : true,
										text : '칸반 일정 진행도'
									},
								/* responsive : false, */

								}
							});
						}
					})
				})

		function changeItem() {
			var itemidSelect = document.getElementById('selectMenu');
			var itemId = itemidSelect.options[itemidSelect.selectedIndex].value;
			console.log("itemid :" + itemId);
			if (itemId == 0) {
				location.href = "userindex.do";
			} else if (itemId == 1) {
				location.href = "newReply.do";
			} else if (itemId == 2) {
				location.href = "newVote.do";
			} else if (itemId == 3) {
				location.href = "newNotice.do";
			}
		}
	</script>
	<script type="text/javascript">
		$(function() {
			/* default 차트 */
			let tseq = $('#selectDash').children().val();
			console.log(' val : ' + tseq);

			/* 팀이 있을시 제일 첫 팀 차트 생성 */
			if (tseq > 0) {
				$.ajax({
					url : "selectChart.do",
					type : "POST",
					data : {
						"tseq" : tseq
					},
					success : function(data) {
						console.log(data);
						let ctx = document.getElementById('myChart')
								.getContext('2d');
						let myChart = new Chart(ctx, {
							type : 'doughnut',
							data : {
								labels : [ '발의됨', '진행중', '일시중지', '완료' ],
								datasets : [ {
									label : 'Scoop',
									data : [ data.initiative, data.progress,
											data.pause, data.complete ],
									backgroundColor : [
											'rgba(255, 99, 132, 0.2)',
											'rgba(54, 162, 235, 0.2)',
											'rgba(255, 206, 86, 0.2)',
											'rgba(75, 192, 192, 0.2)' ],
									borderColor : [ 'rgba(255, 99, 132, 1)',
											'rgba(54, 162, 235, 1)',
											'rgba(255, 206, 86, 1)',
											'rgba(75, 192, 192, 1)' ],
									borderWidth : 1
								} ]
							},
							options : {
								legend : {
									position : 'top',
								},
								title : {
									display : true,
									text : '칸반 일정 진행도'
								},
							/* responsive : false, */

							}
						});
					}
				})
			}
		})
	</script>
</body>
</html>