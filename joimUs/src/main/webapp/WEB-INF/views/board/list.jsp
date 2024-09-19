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
								data-title="${match.boardTitle}"
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
			user: '${user.userId}',
			boardUser: '${match.userId}',
			title: '${match.boardPlace}',
			icon: marker_${match.boardCategory},
			image: '/resources/image/images/'+'${match.boardCategory}'+'.png',
			latlng: new kakao.maps.LatLng(${match.addressY}, ${match.addressX}),
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
		console.log(positions[i]);
		var infowindow = new kakao.maps.InfoWindow({
			content : '<div class="text-center"><img width="200" src="' + positions[i].image + '"><div class="font-weight-bold p-1 text-truncate">' + positions[i].title + '</div></div>'
		});

		kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
		kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
		kakao.maps.event.addListener(marker, 'click', makeClickListener(positions[i].idx, positions[i].user, positions[i].boardUser));

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

	function makeClickListener(idx,user,boarder) {
		return function() {
			
			console.log(boarder);
			console.log(user);
			if(boarder == user){
				applyList(idx);
			}else{
				applyModal(idx);
			}
			
			tmpwindow.close();
		};
	}

	var tmpwindow = new kakao.maps.InfoWindow();
	$(document).ready(function(){
		$('.card-img-top').on('click', function(){
			var position = $(this).data('position').split(',');
			var latlng = new kakao.maps.LatLng(position[0], position[1])
			console.log($(this).data(''));
			tmpwindow.close();
			tmpwindow = new kakao.maps.InfoWindow({
				position: latlng,
				content : '<div class="text-center"><img width="200" src="' + $(this).prop("src") + '"><div class="font-weight-bold p-1 text-truncate">' +  $(this).data('title')  + '</div></div>'
			});
			tmpwindow.open(map, markers[$(this).data('idx')]);

			if (map.getLevel() >= 3) map.setLevel(3);
			map.panTo(latlng);
		});
	})
	
	
	
</script>

<%@include file="../includes/footer.jsp"%>
