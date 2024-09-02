
/* 240826  회원가입 페이지 JS */


//메일 주소 변경
function selectEmail(mail){
    $("#emailBack").val(mail);
    var emailFront=$("#emailFront").val();
    var emailBack=$("#emailBack").val();
    $("#email").val(emailFront+"@"+emailBack);
}


//이메일 주소 합치기
function combineEmail(){
    
    var emailFront=$("#emailFront").val();
    var emailBack=$("#emailBack").val();
    $("#email").val(emailFront+"@"+emailBack);
    
}

//실시간 비밀번호 재확인
function passCheck(pass,passCheck){
    
    if(pass !=passCheck){
    	document.getElementById('passCh').innerHTML="* 비밀번호가 일치하지 않습니다."
    }else{
        $("#passCh").hide();
    }
}



//240903수정본  이미지 업로드 및 미리보기 함수
/*function previewImg(event){*/
$(document).ready(function(){
	$('#img').on("change", function() {
	
	console.log(event);
	/*if (!$(this)[0].files[0]) return;
	
	var reader = new FileReader();
    
    reader.onload = function(event) {
        var img = document.createElement("img");
        img.setAttribute("src", event.target.result);
        
        //0826 이미지 변경 시 추가되던거 수정
        document.querySelector("div#previewImg").innerHTML="";
        document.querySelector("div#previewImg").appendChild(img);
        img.style.width='150px';
        img.style.height='150px';
        
    };

    reader.readAsDataURL(event.target.files[0]);
*/	
if (!$(this)[0].files[0]) return;
	
	var  folder, obj, hidden, datas;
	
	file = $(this)[0].files[0];
	hidden = $(this).data('hidden');
	folder='user';
	datas = new FormData();
	datas.append('image', file);
	datas.append('folder', folder);
	
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


function addressFind(){
    new daum.Postcode({
        oncomplete: function(data) {
            console.log('aaaa');
            // // 팝업을 통한 검색 결과 항목 클릭 시 실행
            // alert('aaaa');
            var addr = ''; // 주소_결과값이 없을 경우 공백 
            var extraAddr = ''; // 참고항목
            // alert('aaaa');
            // // //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            // if (data.userSelectedType === 'R') { // 도로명 주소를 선택
            //     addr = data.roadAddress;
            // } else { // 지번 주소를 선택
            //     addr = data.jibunAddress;
            // }
            // alert('bbbb');
            // if(data.userSelectedType === 'R'){
            //     if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
            //         extraAddr += data.bname;
            //     }
            //     if(data.buildingName !== '' && data.apartment === 'Y'){
            //         extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            //     }
            //     if(extraAddr !== ''){
            //         extraAddr = ' (' + extraAddr + ')';
            //     }
            // } else {
            //     document.getElementById("UserOrigin").value = '';
            // }
            
            // 선택된 우편번호와 주소 정보를 input 박스에 넣는다.
            document.getElementById('addressNum').value = data.zonecode;
            document.getElementById("addressOrigin").value = addr;
            
            document.getElementById("addressOrigin").value += extraAddr;
            document.getElementById("addressAdd").focus(); // 우편번호 + 주소 입력이 완료되었음으로 상세주소로 포커스 이동

        }
    }).open();


}