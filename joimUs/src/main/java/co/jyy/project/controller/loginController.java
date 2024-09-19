package co.jyy.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import co.jyy.project.VO.ApplyVO;
import co.jyy.project.VO.BoardVO;
import co.jyy.project.VO.UserVO;
import co.jyy.project.service.BannerService;
import co.jyy.project.service.UserService;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class loginController {

	private final UserService uService;
	private final BannerService bService;
	
	
	@PostMapping("/join/join")
	public String aaa() {
		return "/home";
	}
	
	//로그인 페이지
	@GetMapping("/login")
	public String log() {
		System.out.println("bbb");
		
		return "/login/login";
	}
	
	//아이디 찾기 페이지 이동
	@GetMapping("/login/missingId")
	public String missingId() {
		
		return "/login/missingId";
	}
	
	//비밀번호 찾기 페이지 이동
	@GetMapping("/login/missingPass")
	public String missingPass() {
		
		return "/login/missingPass";
	}
	
	//아이디 찾기
	@PostMapping("/user/findId")
	@ResponseBody
	public String findId(HttpServletRequest request ) {
		System.out.println("아이디 찾기");
		String name= request.getParameter("name");
		String mail= request.getParameter("mail");
		System.out.println(name+mail);
		UserVO uVO;
		String result;
		
		uVO = uService.findId(name,mail);
		
		if(uVO == null) {
			result = "1";
		}else {
			result = uVO.getUserId();
		}
		
		return result;
	}
	
	//비밀번호 찾기 인증번호 메일 보내기
	@PostMapping("/user/sendMail")
	@ResponseBody
	public String sendMail(HttpServletRequest request) {
		System.out.println("이메일 인증번호 전송");
		String name= request.getParameter("name");
		String mail= request.getParameter("mail");
		String userId= request.getParameter("id");
		UserVO  uVO;
		String result;
		uVO = uService.sendMail(userId,name,mail);
		System.out.println(uVO);
		if(uVO == null) {
			result="1";
		}else {
			result=uVO.getPassword();
		}
		
		return result;
	}
	
	
	//로그인
	@PostMapping("/login/login")
	@ResponseBody
	public String login(HttpServletRequest request, Model model) {
		System.out.println("로그인");
		
		String userId = request.getParameter("userId");
		String password = request.getParameter("password");
		UserVO uVO;
		String result;
		
		uVO = uService.login(userId,password);
		
		if(uVO == null) {
			result = "id";
			System.out.println(uVO+"1");
		}else if(uVO.getPassword().equals(password)) {
			
			result = "ok";
			model.addAttribute("bannerImg", bService.bannerMain());
			System.out.println(uVO+"2");
		}else {
			System.out.println(uVO+"3");
			uVO = null;
			result = "password";	
		}
		return result;
	}
	
	
	//로그인 성공
	@PostMapping("/login/ok")
	public String loginok(HttpServletRequest request,HttpSession session,Model model) {
			System.out.println("로그인");
			
			String userId = request.getParameter("userId");
			String password = request.getParameter("password");
			UserVO uVO;
			
			uVO = uService.login(userId,password);
			session.setAttribute("user", uVO);
			
			model.addAttribute("bannerImg", bService.bannerMain());
			
			return "/main";
		}
	
	//로그아웃
	@GetMapping("/login/logout")
	@ResponseBody
	public String logout(HttpSession session) {
		System.out.println("로그아웃");
		String result;
		
		session.invalidate();
		result = "1";
		
		return result;
	}
	
	
	@GetMapping("/login/Main")
	@ResponseBody	
	public String initMain(HttpServletRequest request) {
		
		String result="";
		String id = request.getParameter("id");
		BoardVO BVO = uService.selectApply(id); 
		if(BVO == null) {
			
		}else {
			result= Integer.toString(BVO.getBoardNum());
		}
		
		return result;
	}
}
