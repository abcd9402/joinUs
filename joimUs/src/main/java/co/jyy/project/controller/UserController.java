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

import co.jyy.project.VO.UserVO;
import co.jyy.project.service.UserService;
import jdk.nashorn.internal.ir.RuntimeNode.Request;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class UserController {

	private final UserService UService;
	
	
	@GetMapping("/join")
	public String join(Model m) {
		System.out.println("컨트롤");
		UserVO UVO = UService.User_Test();
		
		System.out.println(UVO);
		String gg=UVO.getTest();
		System.out.println(gg);
		m.addAttribute("gg",gg );
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
	
	
	
	
}
