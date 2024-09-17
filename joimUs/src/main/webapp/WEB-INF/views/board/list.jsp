<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ include file="../includes/header.jsp"%>
<!-- 함수 파일 -->
<script src="/resources/js/Board.js"></script>
<%@ include file="../modal/boardRegist.jsp"%>
<%@ include file="../modal/boardDel.jsp"%>
<%@ include file="../modal/applyList.jsp"%>
<%@ include file="../modal/apply.jsp"%>
<%@ include file="../modal/applyInfo.jsp"%>

<main>
	<section class="d-flex" style="padding-top:10px;">
		<div class="w-50" style="height: calc(100vh - 66px);overflow-y: auto;">
			<form class="px-5 pt-4 pb-3" action="./list" method="get">
				<div class="form-row">
					<div class="col">
						<div class="form-group">
							<select class="form-control" name="category">
								<option value="">카테고리</option>
								<option value="movie"${searchVO.category == "movie" ? " selected" : ""}>영화</option>
								<option value="musical"${searchVO.category == "musical" ? " selected" : ""}>뮤지컬</option>
								<option value="concert"${searchVO.category == "concert" ? " selected" : ""}>콘서트</option>
							</select>
						</div>
					</div>

					<div class="col">
						<input type="text" class="form-control" name="keyword" value="${searchVO.keyword}" placeholder="아이디/제목 검색">
					</div>
					<div class="col">
						<button type="submit" class="btn btn-primary align-bottom mr-1">검색</button>
					</div>
					<div class="col text-right">	
						<button type="button" class="btn btn-success align-bottom mr-1 text-white" onclick="showModal(registModal)"><i class="bi bi-plus"></i> 등록하기</button>
					</div>

				</div>
			</form>

			<div class="px-5 pt-0 pb-5">
				<div class="row">
					<c:forEach var="match" items="${blist}">
					<div class="col-xl-4 col-lg-6 col-md-12 mb-3">
						<div class="card h-100">
							<input type="hidden" id="boardNum" value="${match.boardNum}"/> 
							<img src="/resources/image/images/${match.boardCategory}.png" style="cursor:pointer; height:150px;"  
								data-idx="${match.boardNum}"
								data-position="${match.addressY},${match.addressX}"
								class="card-img-top">
							<div class="position-absolute" style="top:10px;left:10px">
								<img src="/resources/image/icon/${match.boardCategory}.png" width="40">
							</div>
							<div class="card-body">
								<h5 class="card-title text-truncate">${match.boardTitle}</h5>
								<p class="card-text">
									<div class="text-truncate"><i class="bi bi-calendar3 mr-2 text-dark"></i><fmt:formatDate value="${match.reservationDate}" pattern="yyyy.MM.dd." /> ${match.reservationTime}시</div>
									<div class="text-truncate"><i class="bi bi-geo-alt-fill mr-2 text-dark"></i>${match.boardPlace}</div>
									<%-- <div><i class="bi bi-people-fill mr-2 text-dark"></i>${match.board_TotalPeople}명</div> --%>
								</p>
								<c:if test="${user.userId eq match.userId }">
								<div class="d-flex">
									<!-- <a href="/mypage/matchreceive" class="btn btn-outline-primary w-50">신청보기</a>&nbsp; -->
									<a href="#" onclick="applyList(${match.boardNum})" class="btn btn-outline-primary w-50">신청보기</a>&nbsp;
									<a href="javascript:popupDel(${match.boardNum});" class="btn btn-outline-danger w-50">매칭 삭제</a>
								</div>
								</c:if>
								<%-- <c:if test="${ user.userId ne match.userId }"><button onclick="showInfo(${match.boardNum});" class="btn btn-outline-primary btn-block text-truncate">상세보기 및 매칭신청</button></c:if> --%>
 								<c:if test="${ user.userId ne match.userId }"><button onclick="applyModal(${match.boardNum});" class="btn btn-outline-primary btn-block text-truncate">상세보기 및 매칭신청</button></c:if>
							</div>
						</div>
					</div>
					</c:forEach>
				
					<c:if test="${fn:length(blist) == 0 }">
					<div class="col h3 text-center">:: 검색 결과가 없습니다. ::</div>
					</c:if>
				</div>
			</div>
		</div>

		<div class="w-50">
			<div id="map" style="width:100%;height:100%;"></div>
		</div>
	</section>
</main>

<%-- <div class="modal fade" id="modal-info" tabindex="-1" role="dialog">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="detail-title"></h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				
				<div class="border mb-3" id="map-detail" style="width:100%;height:200px;"></div>

				<div><span class="badge badge-pill badge-primary mr-2" style="width:80px;">개설자</span><span id="detail-id"></span></div>
				<div class="d-flex">
					<div class="mr-2"><span class="badge badge-pill badge-primary" style="width:80px;">경기장</span></div>
					<div id="detail-place"></div>
				</div>
				<div><span class="badge badge-pill badge-primary mr-2" style="width:80px;">시 간</span><span id="detail-time"></span></div>
				<div><span class="badge badge-pill badge-primary mr-2" style="width:80px;">인 원</span><span id="detail-people"></span></div>
				<div class="d-flex">
					<div class="mr-2"><span class="badge badge-pill badge-primary" style="width:80px;">내 용</span></div>
					<div id="detail-content"></div>
				</div>

				<form id="myform" name="myform">
			        <input type="hidden" id="boardNum" name="boardNum" value="">
			        <input type="hidden" name="userId" value="${user.userId }">
			        <input type="hidden" name="BOARD_TITLE" value="">
			        <input type="hidden" name="NOTICE_MSG_USER" value="">
			        <input type="hidden" name="NOTICE_MSG_PLACE" value="">
			        <input type="hidden" name="NOTICE_MSG_TIME" value="">
				
					<div class="form-group mb-0">
						<label for="NOTICE_MSG_Content" class="col-form-label">신청내용</label>
						<input type="text" class="form-control" id="NOTICE_MSG_Content" name="NOTICE_MSG_Content">
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary btn-block" onclick="sendMatch()">신청하기</button>
			</div>
		</div>
	</div>
</div> --%>

<%-- <div class="modal fade" id="registModal" tabindex="-1" role="dialog">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">매치 등록하기</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form name="boardReg" id="boardReg">
					<input type="hidden" name="board_Id" value="${user.user_id}">
					<input type="hidden" name="board_Sport_Address" value="${user.user_sport_address}">
					<input type="hidden" name="board_Sport_Playground" value="${user.user_sport_detailaddress}">
					<input type="hidden" name="board_Sport_Address_X" value="${user.user_sport_address_x}">
					<input type="hidden" name="board_Sport_Address_Y" value="${user.user_sport_address_y}">
					<input type="hidden" name="board_Sport_Address_IMG" value="${user.user_sport_address_img}">
					
					<div class="form-group mb-1">
						<label class="col-form-label">경기 장소</label>
						<div class="font-weight-bold">${user.user_sport_address}</div>
					</div>
					<div class="border mb-0" id="map-reg" style="width:100%;height:200px;"></div>
					<div class="d-flex">
						<div class="form-group mb-0 w-50 pr-1">
							<label for="boardCategory" class="col-form-label">종목</label>
							<select name="boardCategory" id="boardCategory" class="form-control">
								<option value="">종목선택</option>
								<option value="movie">영화</option>
								<option value="musical">뮤지컬</option>
								<option value="concert">콘서트</option>
							</select>
						</div>
						<div class="form-group mb-0 w-50 pl-1">
							<label for="board_TotalPeople" class="col-form-label">인원수</label>
							<input type="number" class="form-control" name="board_TotalPeople" id="board_TotalPeople">
						</div>
					</div>
					<div class="form-group mb-0">
						<label for="board_ReservationDate" class="col-form-label">경기 시간</label>
						<div class="d-flex">
							<div class="w-50 pr-1"><input type="date" class="form-control" name="board_ReservationDate" id="board_ReservationDate"></div>
							<div class="w-50 pl-1">
								<select name="board_ReservationTime" class="form-control">
									<option value="">시간 선택</option>
									<option value="8">8시</option>
									<option value="9">9시</option>
									<option value="10">10시</option>
									<option value="11">11시</option>
									<option value="12">12시</option>
									<option value="13">13시</option>
									<option value="14">14시</option>
									<option value="15">15시</option>
									<option value="16">16시</option>
									<option value="17">17시</option>
									<option value="18">18시</option>
									<option value="19">19시</option>
									<option value="20">20시</option>
									<option value="21">21시</option>
								</select>
							</div>
						</div>
					</div>

					<div class="form-group mb-0">
						<label for="board_Title" class="col-form-label">제목</label>
						<input type="text" class="form-control" name="board_Title" id="board_Title">
					</div>
					<div class="form-group mb-0">
						<label for="board_Content" class="col-form-label">내용</label>
						<textarea class="form-control" name="board_Content" id="board_Content"></textarea>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary btn-block" onclick="regMatch()">등록하기</button>
			</div>
		</div>
	</div>
</div> --%>

 <!-- 매칭 삭제modal-->
<!-- <div class="modal fade" id="modaldel" tabindex="-1" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" >매칭 삭제</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form id="del" name="del" >
				<input type="hidden" id="num" class="num" name="BOARD_NUM" />
				<div class="text-center">
					<div class="form-check form-check-inline">
						삭제 하시겠습니까?
					</div>
				</div>
				</form>
			</div>
			<div class="modal-footer">
				<button class="btn btn-primary" onclick="senddel()">삭제</button>
				<button  onclick="$('#modaldel').modal('hide');" class="btn btn-primary">취소</button>
			</div>
		</div>
	</div>
</div> -->


<!--지도 API-->
<script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=71a69cbaf42ac4f9af2ad27683a0d577"></script>
<script>
	var mapContainer = document.getElementById('map'),
		mapOption = {
			center: new kakao.maps.LatLng(37.5666805, 126.9784147),	
			level: 6
		};

	var map = new daum.maps.Map(mapContainer, mapOption);
	var mapTypeControl = new kakao.maps.MapTypeControl();
	map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

	var zoomControl = new kakao.maps.ZoomControl();
	map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

	var bounds = new kakao.maps.LatLngBounds();

	var imageSize = new kakao.maps.Size(40, 40);
	var imageOption = {offset: new kakao.maps.Point(20, 0)};
	var marker_concert = new kakao.maps.MarkerImage('/resources/image/images/concert.png', imageSize, imageOption);
	var marker_movie = new kakao.maps.MarkerImage('/resources/image/images/movie.png', imageSize, imageOption);
	var marker_musical = new kakao.maps.MarkerImage('/resources/image/images/musical.png', imageSize, imageOption);
	var markers = [];
	var positions = [
<c:forEach var="match" items="${blist}">
		{
			idx: ${match.boardNum},
			title: '${match.boardPlace}',
			icon: marker_${match.boardCategory},
			image: '/resources/image/images/'+${match.boardCategory}+'.png',
			latlng: new kakao.maps.LatLng(${match.addressY}, ${match.addressX})
		},
</c:forEach>
	];

	for (var i = 0; i < positions.length; i++) {
		var marker = new kakao.maps.Marker({
			map: map,
			position : positions[i].latlng,
			image: positions[i].icon
		});

		bounds.extend(positions[i].latlng);

		var infowindow = new kakao.maps.InfoWindow({
			content : '<div class="text-center"><img width="200" src="' + positions[i].image + '"><div class="font-weight-bold p-1 text-truncate">' + positions[i].title + '</div></div>'
		});

		kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
		kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
		kakao.maps.event.addListener(marker, 'click', makeClickListener(positions[i].idx));

		markers.push(marker);
	}
	if (positions.length > 0) map.setBounds(bounds);

	function makeOverListener(map, marker, infowindow) {
		return function() {
			infowindow.open(map, marker);
		};
	}

	function makeOutListener(infowindow) {
		return function() {
			infowindow.close();
		};
	}

	function makeClickListener(idx) {
		return function() {
			showInfo(idx);
			tmpwindow.close();
		};
	}

	var tmpwindow = new kakao.maps.InfoWindow();
	$(document).ready(function(){
		$('.card-img-top').on('click', function(){
			var position = $(this).data('position').split(',');
			var latlng = new kakao.maps.LatLng(position[0], position[1])

			tmpwindow.close();
			tmpwindow = new kakao.maps.InfoWindow({
				position: latlng,
				content : '<div class="text-center"><img width="200" src="' + $(this).prop("src") + '"><div class="font-weight-bold p-1 text-truncate">' + $(this).data('playground') + '</div></div>'
			});
			tmpwindow.open(map, markers[$(this).data('idx')]);

			if (map.getLevel() >= 3) map.setLevel(3);
			map.panTo(latlng);
		});
	});
	
	
	// 정보 보여주기
	function showInfo(num) {
		<c:if test="${ user.userId eq null }">
		alert("로그인을 하셔야 이용하실 수 있습니다.");
		return;
		</c:if>
		$.getJSON("/board/viewJson?boardNum="+num, function(data) {
			
			$('#map-detail').html('');
			$('#detail-title').text(data.board_Title);
			$('#detail-id').text(data.board_Id);
			$('#detail-place').text(data.board_Sport_Playground + " (주소: " + data.board_Sport_Address + ")");
			$('#detail-time').text(data.board_ReservationDate + " " + data.board_ReservationTime + "시");
			$('#detail-people').text(data.board_TotalPeople + "명");
			$('#detail-content').text(data.board_Content);
			myform.BOARD_NUM.value = data.board_Num;
			myform.BOARD_TITLE.value = data.board_Title;
			myform.NOTICE_MSG_USER.value = data.board_Id;
			myform.NOTICE_MSG_PLACE.value = data.board_Sport_Playground;
			myform.NOTICE_MSG_TIME.value = data.board_ReservationDate;
			
			$('#modal-info').modal('show').on('shown.bs.modal', function (event) {
				var mapPosition = new kakao.maps.LatLng(data.board_Sport_Address_Y, data.board_Sport_Address_X);
				var mapDetailContainer = document.getElementById('map-detail');
				var mapOption = { center: mapPosition, level: 3 };

				var map = new kakao.maps.Map(mapDetailContainer, mapOption);
				var mapTypeControl = new kakao.maps.MapTypeControl();
				map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
		
				var marker = new kakao.maps.Marker({position: mapPosition});
				marker.setMap(map);
			});
		});
	}

   /*  function sendMatch() {
    	if (myform.NOTICE_MSG_Content.value == "") {
    		alert("신청 내용을 입력해 주세요.");
    		myform.NOTICE_MSG_Content.focus();
    		
    		return;
    	} 
    	
    	$.post("/match/apply_suc", $("#myform").serialize(), function(data) {
	    	if (data == "suc") {
	    		alert("성공적으로 신청하였습니다.");
	    		$('#modal-info').modal('hide');
	    		$('#map-detail').html('');
	    		myform.reset();
	    	} else if (data == "exist") {
	    		alert("이미 신청하신 매치입니다.");
	    		$('#modal-info').modal('hide');
	    		$('#map-detail').html('');
	    	} else if (data == "no_point") {
	    		alert("볼이 부족하여 매치를 신청하실 수 없습니다. 볼을 충전해 주세요.");
	    		$('#modal-info').modal('hide');
	    		$('#map-detail').html('');
	    	} else {
	    		alert("오류가 발생하였습니다.");
	    	}
	    });	
    } */

	function showReg() {
	/* 	<c:if test="${ user.userId eq null }">
		alert("로그인을 하셔야 이용하실 수 있습니다.");
		return;
		</c:if> */
		$('#modal-reg').modal('show').on('shown.bs.modal', function (event) {
			var mapPosition = new kakao.maps.LatLng('${match.addressY}', '${match.addressX}');
			var mapContainer = document.getElementById('map-reg'),
			mapOption = { center: mapPosition, level: 3 };
	
			var map = new kakao.maps.Map(mapContainer, mapOption);
			var mapTypeControl = new kakao.maps.MapTypeControl();
			map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
	
			var marker = new kakao.maps.Marker({position: mapPosition});
			marker.setMap(map);
			
			var infowindow = new kakao.maps.InfoWindow({
				content : '<div class="text-center"><div class="font-weight-bold p-1 text-truncate">${address.addressDetail}</div></div>'
			});
			
			infowindow.open(map, marker);
		});
	}

	/* function regMatch() {
		if (boardReg.board_Category.value == "") {
			alert("종목을 선택해 주세요.");
			return;
		} 
		
		if (boardReg.board_TotalPeople.value == "") {
			alert("인원수를 입력해 주세요.");
			return;
		} 
		
		if (boardReg.board_ReservationDate.value == "") {
			alert("경기 날짜를 입력해 주세요.");
			return;
		} 
		
		if (boardReg.board_ReservationTime.value == "") {
			alert("경기 시간을 입력해 주세요.");
			return;
		} 

		if (boardReg.board_Title.value == "") {
			alert("제목을 입력해 주세요.");
			return;
		} 

		if (boardReg.board_Content.value == "") {
			alert("내용을 입력해 주세요.");
			return;
		} 
		
		$.post("/board/Board_Insert", $("#boardReg").serialize(), function(data) {
			if (data == "success") {
				alert("등록하였습니다.");
				location.href = "./list";
			} else if (data == "no_point") {
				alert("볼이 부족하여 매치를 만들 수 없습니다. 포인트를 충전해 주세요.");
				myform.reset();
				$('#modal-reg').modal('hide');
			} else {
				alert("오류가 발생하였습니다.");
				myform.reset();
			}
		});
	} */
	
	/* function popupDel(num){
		del.num.value = num;
		
		$('#modaldel').modal('show');		
	} */
	
	/* function senddel(){
		$.post("match/boardDel",$("#del").serialize(),function(data){
			if(data == 'suc'){
				location.href = "./list";
			}else{
				alert("오류가 발생하였습니다.");
				location.href = "./list";
			}
		});
	}	 */
	
	/* function showRegist(){
		$('#registModal').modal('show');		
	} */
</script>

<%@include file="../includes/footer.jsp"%>
