package co.jyy.project.controller;

import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import co.jyy.project.VO.AddressVO;
import co.jyy.project.VO.ApplyVO;
import co.jyy.project.VO.BoardVO;
import co.jyy.project.VO.SearchVO;
import co.jyy.project.VO.UserVO;
import co.jyy.project.service.BoardService;
import co.jyy.project.service.UserService;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class BoardController {

	private final BoardService BService;
	private final UserService UService;
	
	//매치 페이지이동
	@GetMapping("/board/list")
	public String board(HttpSession session,Model m, SearchVO SVO) {
		
		/* session.getAttribute("user"); */
		List<BoardVO> BList = BService.boardList(SVO);
		UserVO UVO = (UserVO)session.getAttribute("user");
		AddressVO AVO = UService.userAddress(UVO); 
		System.out.println(SVO);
		System.out.println(BList);
		m.addAttribute("blist",BList);
		m.addAttribute("searchVO", SVO);
		m.addAttribute("address", AVO);
		return "/board/list";
	}
	
	/*
	 * @GetMapping("board/search") public String boardSearch(Model m,SearchVO SVO) {
	 * 
	 * BoardVO BVO = BService.search(SVO);
	 * 
	 * 
	 * 
	 * return "board/search"; }
	 */
	
	@PostMapping("board/boardInsert")
	@ResponseBody
	public String boardInsert(BoardVO BVO, HttpSession session, HttpServletRequest request) {
		
		String result = null;
		UserVO UVO =(UserVO)session.getAttribute("user");
		if(request.getParameter("movieSelect") != "") {
			BVO.setBoardPlace(request.getParameter("movieSelect"));
		}else if(request.getParameter("concertSelect") != "") {
			BVO.setBoardPlace(request.getParameter("concertSelect"));
		}else if(request.getParameter("musicalSelect") != "") {
			BVO.setBoardPlace(request.getParameter("musicalSelect"));
		}
		
		BVO.setUserId(UVO.getUserId());
		System.out.println(UVO);
		System.out.println(BVO);
		
		BService.boardInsert(BVO);
		
		
		
		result = "success";
		return  result;
	}
	
	@PostMapping("board/boardDel")
	@ResponseBody
	public String boardDel(HttpServletRequest request) {
		
		String result = null;
		System.out.println(request);
		System.out.println(request.getParameter("boardNum"));
		int num = Integer.valueOf(request.getParameter("boardNum"));
		System.out.println(num);
		BService.boardDel(num);
		
		result="success";
		
		return result;
	}
	
	
	
	/* @GetMapping("/board/apply") */
	@RequestMapping(value="board/apply", method=RequestMethod.GET , produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String boardApply(HttpServletRequest request, Model m,BoardVO BVO) throws Exception {
		
		int num = Integer.valueOf(request.getParameter("num"));
		
		BVO = BService.selectBoard(num);
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		BVO.setDate(format.format(BVO.getReservationDate()));
		//mapper String 변환
		ObjectMapper mapper = new ObjectMapper();
        String resultJson = mapper.writeValueAsString(BVO);
        
		
		return resultJson;
	}
	
	@PostMapping("/board/apply")
	@ResponseBody
	public String apply(ApplyVO applyVO) throws Exception {
		
		String result = null;
		
		System.out.println(applyVO);
		ApplyVO AVO = null;
		
		AVO = BService.selectApply(applyVO);
		
		System.out.println(AVO);
		if(AVO == null) {
			
			BService.insertApply(applyVO);
			
			result="success";
		}else {
			result = "jungbok";
		}
		
		
		return result;
		
	}
	
	/* @GetMapping("board/applyList") */
	@RequestMapping(value="board/applyList", method=RequestMethod.GET , produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String applyList(HttpServletRequest request, HttpSession session, Model m) throws Exception {
		
		UserVO UVO =(UserVO)session.getAttribute("user");
		String result = null;
		System.out.println(request);
		
		System.out.println(request.getParameter("boardNum"));
		System.out.println(UVO.getUserId());
		int num = Integer.valueOf(request.getParameter("boardNum"));
		String userId = UVO.getUserId();
		
		List<ApplyVO> applyList = BService.applyList(num,userId);
		
		//mapper String 변환
		ObjectMapper mapper = new ObjectMapper();
        String resultJson = mapper.writeValueAsString(applyList);
		
		m.addAttribute("apply", applyList);
		System.out.println(resultJson);
		
		result="success";
		
		return resultJson;
	}
	
	
	@GetMapping("/board/reject")
	@ResponseBody
	public String reject(HttpServletRequest request) throws Exception {
		
		String result = null;
		
		String name = request.getParameter("name");
		int num = Integer.valueOf(request.getParameter("num"));
		
		BService.rejectApply(name,num); 
		
		result = "success";
		
		return result;
	
	}
	
	@GetMapping("/board/approve")
	@ResponseBody
	public String approve(HttpServletRequest request) throws Exception {
		
		String result = null;
		
		String name = request.getParameter("name");
		int num = Integer.valueOf(request.getParameter("num"));
		
		BService.approveApply(name,num);
		BService.endApply(name,num);
		BService.endBoard(num);
		
		result = "success";
		return result;
	}

	
	
	@RequestMapping(value="board/applyInfo", method=RequestMethod.POST , produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String applyInfo(HttpServletRequest request, Model m) throws Exception {
		
		String result = null;
		
		String id = request.getParameter("id");
		
		UserVO UVO = BService.applyInfo(id);
		String[] answer = {};
        answer = UVO.getAddress().split(" ");
        UVO.setAddress(answer[0]+" "+answer[1]);
		
		
		ObjectMapper mapper = new ObjectMapper();
        String resultJson = mapper.writeValueAsString(UVO);
		
		
		return resultJson;
		
		
	}

}

