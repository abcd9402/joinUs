
/* 240911  매치 페이지 JS */

function showModal(name){
	console.log(name);
	$(name).modal('show');		
}

function applyModal(num){
	
	
	$.ajax({
		url : "/board/apply",
		type : "GET",
		data : {
			"num" : num,
		},
		success: function(data){
			if(data == ""){
				alert("오류");
			}else{
/*				let dataJSON = JSON.parse(data)*/
				let dataJSON = data;
				console.log(dataJSON);
				
				myform.boardNum.value = dataJSON.boardNum;
				myform.userId.value = dataJSON.userId;
				myform.boardTitle.value = dataJSON.boardTitle;
				$('#detail-title').text(dataJSON.boardTitle);
				$('#detail-id').text(dataJSON.userId);
				$('#detail-date').text(dataJSON.date);
				$('#detail-time').text(dataJSON.reservationTime + "시");
				$('#detail-content').text(dataJSON.boardContent);
				/*$('#detail-image').src("/resources/image/images/(dataJSON.boardCategory).png");*/
				detailimage.src = "/resources/image/images/"+(dataJSON.boardCategory)+".png";
				
				$('#applyMo').modal('show');
				
				
			}
			
		}
	});
	
}



function sendMatch(){
	
	
	if(myform.applyContent.value == ''){
		alert('신청 내용 입력해주세요.');
		return;
	}
	
	$.post("/board/apply", $("#myform").serialize(), function(data) {
		if (data == "success") {
			alert("지원하였습니다.");
			location.href = "/board/list";
		} else if(data == "jungbok"){
			alert("이미 신청한 상태입니다.");
			return;
		}else{
			alert("오류");
			return;
		}
	});
	
	
}




function showPlace(category){
	console.log(category);
	var place = document.getElementById('placeArea');
	var musical = document.getElementById('musicalPlace');
	var movie = document.getElementById('moviePlace');
	var concert = document.getElementById('concertPlace');
	if(category == ''){
		place.style.display = "none";
	}else if(category == 'movie'){
		place.style.display = "block";
		movie.style.display = "block";
		concert.style.display = "none";
		musical.style.display = "none";
	}else if(category == 'concert'){
		place.style.display = "block";
		concert.style.display = "block";
		movie.style.display = "none";
		musical.style.display = "none";
	}else if(category == 'musical'){
		place.style.display = "block";
		musical.style.display = "block";
		movie.style.display = "none";
		concert.style.display = "none";
	}
}



function confirmPlace(place){
	console.log(place);
	var addressX = document.getElementById('addressX');
	var addressY = document.getElementById('addressY');
	var img = document.getElementById('imageArea');
	var mapreg = document.getElementById('mapreg');
	var boardCategory = document.getElementById('boardCategory');
	
	if(place == 'gun'){
		/*addressX.value = 37.5385;
		addressY.value = 127.0732;*/
		addressY.value = 37.5385;
		addressX.value = 127.0732;
	}else if(place == 'wang'){
		addressY.value = 37.5621;
		addressX.value = 127.0383;
	}else if(place == 'woung'){
		addressY.value = 37.5302;
		addressX.value = 126.9638;
	}else if(place == 'gang'){
		addressY.value = 37.5365;
		addressX.value = 127.0959;
	}else if(place == 'hae'){
		addressY.value = 37.5525;
		addressX.value = 126.9999;
	}else if(place == 'gwang'){
		addressY.value = 37.5244;
		addressX.value = 127.0246;
	}else if(place == 'dosan'){
		addressY.value = 37.5725;
		addressX.value = 127.001;
	}else if(place == 'blue'){
		addressY.value = 37.5412;
		addressX.value = 127.0029;
	}else if(place == 'lg'){
		addressY.value = 37.5653;
		addressX.value = 126.8295;
	}else if(place == 'woori'){
		addressY.value = 37.518;
		addressX.value = 127.1252;
	}else if(place == 'worker'){
		addressY.value = 37.5557;
		addressX.value = 127.1106;
	}else if(place == ''){
		addressY.value = '';
		addressX.value = '';
	}
	
	mapreg.style.display = "block";
	
	if(boardCategory.value == "musical"){
		img.src="/resources/image/images/musical.png";
	}else if(boardCategory.value == "movie"){
		img.src="/resources/image/images/movie.png";
	}else if(boardCategory.value == "concert"){
		img.src="/resources/image/images/concert.png";
	} 
}








function regMatch() {
	if (boardReg.boardCategory.value == "") {
		alert("종목을 선택해 주세요.");
		return;
	} 
	
	
	if (boardReg.reservationDate.value == "") {
		alert("경기 날짜를 입력해 주세요.");
		return;
	} 
	
	if (boardReg.reservationTime.value == "") {
		alert("경기 시간을 입력해 주세요.");
		return;
	} 

	if (boardReg.boardTitle.value == "") {
		alert("제목을 입력해 주세요.");
		return;
	} 

	if (boardReg.boardContent.value == "") {
		alert("내용을 입력해 주세요.");
		return;
	}
	
	$.post("/board/boardInsert", $("#boardReg").serialize(), function(data) {
		if (data == "success") {
			alert("등록하였습니다.");
			location.href = "/board/list";
		} else {
			alert("오류가 발생하였습니다.");
			myform.reset();
		}
	});
}



function popupDel(num){
	console.log(num);
	boardDelPop.boardNum.value = num;
	
	$('#modalDel').modal('show');		
}


function applyList(num){
	
	console.log(num);
	myform.boardNum.value= num;
	
	$.get("/board/applyList", $("#myform").serialize(), function(data) {
		
		console.log(data);
		/*let dataJSON = JSON.parse(data);*/
		let dataJSON = data;
		console.log(dataJSON);
		const userTableBody = document.querySelector('#table tbody');
        let i = 1;
        userTableBody.innerHTML='';
		dataJSON.forEach(apply => {
            const row = document.createElement('tr');
            row.innerHTML = `<td class="align-middle">`+ i++ +`</td>
								<td class="align-middle"><a href="#" onclick="applyInfo('${apply.applyId}')">${apply.applyId}</a></td>
								<td class="text-left align-middle">
									${apply.applyContent}<br>
								</td>
								<td class="align-middle">	
									<button class="btn btn-secondary btn-sm mr-1 rounded-pill"  type="button" onclick="approve('${apply.applyId}','${apply.boardNum}')" >수락</button>
									<button class="btn btn-danger btn-sm mr- rounded-pill" type="button" onclick="reject('${apply.applyId}','${apply.boardNum}')">거절</button>
								</td>`;
            userTableBody.appendChild(row);
        });
		
		if(dataJSON.length == 0){
			const row = document.createElement('tr');
            row.innerHTML = `<td class="text-center" colspan="100">:: 내용이 없습니다. ::</td>`
            userTableBody.appendChild(row);
		}
		
		$('#applyListModal').modal('show');
		
		/*if (data == "success") {
			
			$('#applyListModal').modal('show');
			
		} else {
			alert("오류가 발생하였습니다.");
			myform.reset();
		}*/
	});
		
}

function modalClose(name){
	console.log(name);
	if(name == 'applyListModal'){
		
		document.querySelector('#table tbody').innerHTML= '';
	}else if(name == 'applyMo'){
		console.log('aaaaaaaaaaaa');
		/*document.querySelector('#applyContent').val= '';*/
	}
	
	$(name).modal('hide');
}

function boardDel(num){
	
	$.post("/board/boardDel", $("#boardDelPop").serialize(), function(data) {
		if (data == "success") {
			alert("삭제했습니다.");
			location.href = "/board/list";
		} else {
			alert("오류가 발생하였습니다.");
			
		}
	});
	$('#modalDel').modal('hide');
}



function reject(name,num){
	
	$.ajax({
		url : "/board/reject",
		type : "GET",
		data : {
			"name" : name, 
			"num" : num,
		},
		success: function(data){
			if(data == "success"){
				alert("거절했습니다.");
				$('#applyListModal').modal('hide');
			}else{

				return;
				
			}
			
		}
	});
}

function approve(name,num){
	
	$.ajax({
		url : "/board/approve",
		type : "GET",
		data : {
			"name" : name, 
			"num" : num,
		},
		success: function(data){
			if(data == "success"){
				alert("승인했습니다.");
				$('#applyListModal').modal('hide');
			}else{
				return;
			}
			
		}
	});
	
}

function applyInfo(id){
	console.log(id);
	
	$.ajax({
		url : "/board/applyInfo",
		type : "POST",
		data : {
			"id" : id, 
		},
		success: function(data){
			console.log(data);
			console.log(data.userId);
			
			
			document.querySelector('#apId').textContent = '아이디: '+data.userId;
			document.querySelector('#apGender').textContent = '성별: '+data.gender;
			document.querySelector('#apMail').textContent = '메일: '+data.mail;
			document.querySelector('#apAd').textContent = '주소: '+data.address;
			document.querySelector('#applyImg').src = data.userImage;
				$('#applyIn').modal('show');
			
			
		}
	});
}
