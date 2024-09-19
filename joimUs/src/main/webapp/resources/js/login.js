/**
 * 240904  login폴더 파일 관련 js
 */



//아이디 찾기
function findId(name,mail){
	console.log(name+mail);
	
	$.ajax({
		url : "/user/findId",
		type : "POST",
		data : {
			"name" : name,
			"mail" : mail
		},
		success: function(data){
			if(data == "1"){
				alert("일치된 ID가 없습니다.");
			}else{
				alert("회원님의 ID: "+data+" 입니다.");
				location.href="/login";
			}
			
		}
	});
}



//이메일 전송
function sendMail(){
	var id = $("#userId").val();
	var name = $("#userName").val();
	var mail = $("#mail").val();
	
	$.ajax({
		url : "/user/sendMail",
		type : "POST",
		data : {
			"id" : id,
			"name" : name,
			"mail" : mail
		},
		success: function(data){
			if(data == "1"){
				alert("입력한 정보가 잘못되었습니다.");
			}else{

				let clientEmail= mail;
			    let EmailYn=isEmail(clientEmail);
			    
			    if(EmailYn == true){
			        console.log('이메일 형식');
			        
			        (function(){
			            // emailJS PublicKey
			           emailjs.init('zzcbXpDOjH8sF5VmK');
			        })();
			            
			            let toName = id;
			            let number = Math.random() * 100000 | 0;
			            console.log('인증 번호: '+ number);
			            certificationNumber = number;
			            var templateParams = {
			                name: toName,
			                contact_number: number,
			                recipient: clientEmail,
			              };
			              
			            // 서비스 id, 이메일 템플릿
			             emailjs.send('jung', 'template_r4acywm', templateParams);  //**********이메일 보내는거 임시 중단 추후 열어야함*********** */
			            
			            document.getElementById('sendMailBtn').setAttribute('disabled',true);
			            document.getElementById('certificationArea').removeAttribute('hidden');
			            document.getElementById('certiNum').value = number;
			            document.getElementById('pass').value = data;
			            alert("메일로 인증번호를 발송하였습니다.");
			    }else{
			    	alert('이메일을 확인해주세요.');
			        return
			    }
			}	
		}
	});
}

//비밀번호 찾기
function findpw(){
	
	var certificationNumber = document.getElementById('certificationNumber').value;
	var certiNum = document.getElementById('certiNum').value;
	var pass = document.getElementById('pass').value;
	if( certificationNumber == null){
		alert('인증번호를 입력해주세요.');
	}else if(certificationNumber == certiNum){
		alert('회원님의 비밀번호는 '+ pass +' 입니다.');
		location.href='/login';
	}else{
		alert('인증번호가 틀립니다.');
	}
}


/* 이메일 형식 확인 함수 */
function isEmail(email){
    var emailValue = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
    return emailValue.test(email);   
}




function login(){
	
	var userId = document.getElementById('userId').value;
	var password = document.getElementById('password').value;
	
	$.ajax({
		url : "/login/login",
		type : "POST",
		data : {
			"userId" : userId,
			"password" : password
		},
		success: function(data){
			console.log(data);
			if(data == "id"){
				alert("가입된 ID가 없습니다.");
				
			}else if(data == "password"){
				alert("비밀번호가 틀립니다.");
				
			}else{
				$("#submitBtn").click();
			}
			
		}
	});
}


//로그아웃
function logout(){
	console.log("logout");
	$.ajax({
		url : "/login/logout",
		type : "GET",
		data : {},
		success: function(data){
			console.log(data);
			
			location.href="/";
		}
	});
	
}
function applyModa(num){
	
	
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
				
				$('#applyEnd').modal('show');
				
				
			}
			
		}
	});
	
}

function matchList(){
	location.href="/board/list";
}


function initMain(id){
	console.log('init');
	console.log(id);
	if(id != ""){
		$.ajax({
			url : "/login/Main",
			type : "GET",
			data : {
				"id": id,
			},
			success: function(data){
				if(data != ""){
					console.log('aaaa');
					alert("요청이 승낙되었습니다.");
					var number = Number(data);
					console.log(typeof number);
					applyModa(data);
				}else{
					console.log('Bbbb');
				}
			}
		});
	}
}



