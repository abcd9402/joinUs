package co.jyy.project.service;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import co.jyy.project.DAO.BoardDAO;
import co.jyy.project.VO.ApplyVO;
import co.jyy.project.VO.BoardVO;
import co.jyy.project.VO.SearchVO;
import lombok.RequiredArgsConstructor;

@Repository
@Service
@RequiredArgsConstructor
public class BoardServiceImpl implements BoardService {
	
	
	private final BoardDAO BDAO;
	
	@Override
	public BoardVO search(SearchVO SVO) {
	
		BoardVO BVO =BDAO.search(SVO);
	
		return BVO;
	}

	@Override
	public void boardInsert(BoardVO BVO) {

		BDAO.boardInsert(BVO);
		
	}

	@Override
	public List<BoardVO> boardList(SearchVO SVO) {
		
		List<BoardVO> BVOList = BDAO.boardList(SVO); 
		
		return BVOList;
	}

	@Override
	public void boardDel(int num) {

		BDAO.boardDel(num);
		
	}

	@Override
	public List<ApplyVO> applyList(int num, String userId) {

		List<ApplyVO> applyList = BDAO.applyList(num,userId);
		
		return applyList;
	}

	@Override
	public BoardVO selectBoard(int num) {

		BoardVO BVO = BDAO.selectBoard(num);
		
		return BVO;
	}

	@Override
	public ApplyVO selectApply(ApplyVO AVO) {
		
		ApplyVO applyVO = BDAO.selectApply(AVO);
		
		return applyVO;
	}

	@Override
	public void insertApply(ApplyVO AVO) {

		BDAO.insertApply(AVO);
		
	}

	@Override
	public void rejectApply(String name, int num) {
		
		BDAO.rejectApply(name,num);
		
	}

	@Override
	public void approveApply(String name, int num) {
		
		BDAO.approveApply(name,num);
		
	}

	@Override
	public void endApply(String name, int num) {

		BDAO.endApply(name,num);
		
	}

	@Override
	public void endBoard(int num) {
		
		BDAO.endBoard(num);
		
	}

}
