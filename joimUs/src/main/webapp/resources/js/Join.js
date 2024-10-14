
/* 240826  회원가입 페이지 JS */


//메일 주소 변경
function selectEmail(mail){
    $("#emailBack").val(mail);
    var emailFront=$("#emailFront").val();
    var emailBack=$("#emailBack").val();
    $("#mail").val(emailFront+"@"+emailBack);
}


//이메일 주소 합치기
function combineEmail(){
    
    var emailFront=$("#emailFront").val();
    var emailBack=$("#emailBack").val();
    $("#selectValue").val("");
    
    $("#mail").val(emailFront+"@"+emailBack);
    
}

//실시간 비밀번호 재확인
function passCheck(pass,passCheck){
    
    if(pass !=passCheck){
    	document.getElementById('passCh').innerHTML="* 비밀번호가 일치하지 않습니다."
    }else{
        $("#passCh").hide();
        document.getElementById('passCh').innerHTML=""
    }
}



//240903수정본  이미지 업로드 및 미리보기 함수
/*function previewImg(event){*/
$(document).ready(function(){
	$('#img').on("change", function() {
	
	console.log(event);

if (!$(this)[0].files[0]) return;
	
	var  folder, obj, hidden, datas;
	
	file = $(this)[0].files[0];
	hidden = $(this).data('hidden');
	folder='user';
	datas = new FormData();
	datas.append('image', file);
	datas.append('folder', folder);
	
	console.log(datas);
	
	$.ajax({
		url: '/upload/image',
		type: 'POST',
		data: datas,
		dataType: 'json',
		cache: false,
		contentType: false,
		processData: false,
		success: function (data) {
			console.log(data);
			var html = '<img src="' + data.url + '" class="w-100 h-100" style="object-fit:cover;">';
			console.log(html);
			$("#previewImg").html(html);
			$('#userImage').val(data.url);

		},
		error : function (jqXHR, textStatus, errorThrown) {
			alert('ERRORS: ' + textStatus);
		}
	});

	$(this).val(null);

    
});
});


//우편주소 찾기(다음 API)
function addressFind() {
	new daum.Postcode({
		oncomplete: function(data) {
			// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

			// 각 주소의 노출 규칙에 따라 주소를 조합한다.
			// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			var addr = ''; // 주소 변수
			var extraAddr = ''; // 참고항목 변수

			//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
			if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
				addr = data.roadAddress;
			} else { // 사용자가 지번 주소를 선택했을 경우(J)
				addr = data.jibunAddress;
			}

			// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
			if (data.userSelectedType === 'R') {
				//법정동명이 있을 경우 추가한다. (법정리는 제외)
				// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
				if (data.bname != '' && /[동|로|가]$/g.test(data.bname)) {
					extraAddr += data.bname;
				}
				// 건물명이 있고, 공동주택일 경우 추가한다.
				if (data.buildingName !== '' && data.apartment === 'Y') {
					extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
				}
				// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
				if (extraAddr !== '') {
					extraAddr = extraAddr;
				}
				// 조합된 참고항목을 해당 필드에 넣는다.
				document.getElementById("addressDetail1").value = extraAddr;
				document.getElementById("addressDetail").value = extraAddr;

			} else {
				document.getElementById("addressDetail1").value = '';
				document.getElementById("addressDetail").value = '';
			}

			// 우편번호와 주소 정보를 해당 필드에 넣는다.
			document.getElementById('addressNumber').value = data.zonecode;
			document.getElementById("address").value = addr;
//			
			// 커서를 상세주소 필드로 이동한다.
			document.getElementById("addressDetail2").focus();
		}
	}).open();
}

 

//240903 상세주소와 참고항목 합치기
function adr(){
	
	var addressDetail1 = document.getElementById("addressDetail1").value
	var addressDetail2 = document.getElementById("addressDetail2").value;
	
	document.getElementById("addressDetail").value = addressDetail1 + addressDetail2;  
	
	
}




//240903 아이디 중복체크 함수
function idCheck(id){
	
	var datas;
	console.log(id);
	
	datas = new FormData();
	datas.append('userId', id);
	console.log(datas);
	
	$.ajax({
		url: '/join/idCheck',
		type: 'POST',
		data: datas,
		cache: false,
		contentType: false,
		processData: false,
		success: function (data) {
			alert('중복된 아이디입니다.');

		},
		error : function (jqXHR, textStatus, errorThrown) {
			alert('사용 가능한 아이디입니다.');
			document.getElementById('idChk').setAttribute('disabled',true);
			
		}
	});
}



//240903 회원가입 유효성 및 완료 
function joinConfirm(){
	
	
	if ($("userId").val() == "") {
		alert("아이디를 입력해주세요.")
		$("#userId").focus();
		return false;
	}
	
	if (document.getElementById('idChk').getAttribute('disabled') != "true") {
		alert("아이디 중복 확인해주세요.")
		$("userId").focus();
		return false;
	}
	
	if($("#userImage").val() == ""){
		alert("이미지를 등록해주세요.")
		return false;
	}
	
	if($("#password").val() == ""){
		alert("비밀번호를 입력해주세요.")
		$("#password").focus();
		return false;
	}
	
	if(document.getElementById('passCh').innerHTML != ""){
		alert("비밀번호를 확인해주세요.")
		$("#password").focus();
		return false;
	}
	
	if($("#name").val() == ""){
		alert("이름을 입력해주세요.")
		$("#name").focus();
		return false;
	}
	
	if($("#emailFront").val() == "" || $("#emailBack").val() == ""){
		alert("이메일을 입력해주세요.")
		$("#emailFront").focus();
		return false;
	}
	
	if($("#addressDetail").val() == "" ){
		alert("주소를 입력해주세요.")
		return false;
	}
	
	$("#confirm").click();
	
}