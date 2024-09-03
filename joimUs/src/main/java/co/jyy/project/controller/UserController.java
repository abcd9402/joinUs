package co.jyy.project.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import co.jyy.project.VO.AddressVO;
import co.jyy.project.VO.UserVO;
import co.jyy.project.service.UserService;
import jdk.nashorn.internal.ir.RuntimeNode.Request;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class UserController {

	private final UserService UService;
	
	
	@GetMapping("/join")
	public String join() {
		System.out.println("컨트롤");
	
		return "/join/join";
		
		
	}
	
	
	//240903 유저 이미지 업로드 함수
	@PostMapping("/upload/image")
	@ResponseBody
    public String uplaodImage(HttpServletRequest request, @RequestParam("image") MultipartFile file, @RequestParam("folder") String folder) throws IOException {
		String uploadFolder = request.getSession().getServletContext().getRealPath("/resources/image");
		File uploadPath = new File(uploadFolder, folder);
		if(uploadPath.exists() == false) {
			
			uploadPath.mkdirs();
		}

		/* 파일 이름 */
		SimpleDateFormat sDate = new SimpleDateFormat("yyyyMMddhhmmssSSS");
		String fileName = file.getOriginalFilename();
		String fileExt = fileName.substring(fileName.lastIndexOf(".") + 1);
		String uploadFileName = sDate.format(new Date()) + "." + fileExt;
		
		/* 파일 위치, 파일 이름을 합친 File 객체 */
		File saveFile = new File(uploadPath, uploadFileName);
		
		/* 파일 저장 */
		try {
			file.transferTo(saveFile);
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println(String.format("{\"url\": \"/resources/image/%s/%s\"}", folder, uploadFileName));
		return String.format("{\"url\": \"/resources/image/%s/%s\"}", folder, uploadFileName);
	}
	
	//240903 id중복 체크 클래스
	@PostMapping("/join/idCheck")
	@ResponseBody
	public String idCheck(@RequestParam("userId") String userId) throws IOException {
		System.out.println("check");
		String idCHk;
		System.out.println("id: "+userId);
		
		UserVO uVO = UService.findId(userId);
		idCHk =uVO.getUserId();
		System.out.println(uVO);
		
		if(uVO.getUserId() == null) {
			System.out.println("중복없음");
		}else {
			System.out.println("중복");
			idCHk=uVO.getUserId();
			
		}
		System.out.println(idCHk);
		
		return idCHk;
	}
	
	
	//240903 유저 회원가입db 삽입
	@PostMapping("/join/confirm")
	public String confirm(HttpServletRequest request, UserVO uVO,AddressVO aVO) {
		System.out.println("회원가입 시작");
		System.out.println(uVO);
		System.out.println(aVO);
		
		
		UService.insertUser(uVO); //유저 정보 삽입
		UService.insertAddress(aVO); //주소 정보 삽입
		
		System.out.println("해치웟나?");
		
		return "/join/join";
	} 
	
}
