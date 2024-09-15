package co.jyy.project.DAO;

import java.util.List;

import org.springframework.stereotype.Repository;

import co.jyy.project.VO.ApplyVO;
import co.jyy.project.VO.BoardVO;
import co.jyy.project.VO.SearchVO;
import co.jyy.project.mapper.BoardMapper;
import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class BoardDAOImpl implements BoardDAO{

	
	private final BoardMapper BMapper;
	
	@Override
	public BoardVO search(SearchVO SVO) {

		BoardVO BVO = BMapper.search(SVO);
		
		return BVO;
	}

	@Override
	public void boardInsert(BoardVO BVO) {

		BMapper.boardInsert(BVO);
		
	}

	@Override
	public List<BoardVO> boardList(SearchVO SVO) {
		
		List<BoardVO> BVOList = BMapper.boardList(SVO); 
		
		
		return BVOList;
	}

	@Override
	public void boardDel(int num) {
		
		BMapper.boardDel(num);
		
	}

	@Override
	public List<ApplyVO> applyList(int num, String userId) {

		List<ApplyVO> applyList = BMapper.applyList(num,userId);
		
		return applyList;
	}

	@Override
	public BoardVO selectBoard(int num) {

		BoardVO BVO = BMapper.selectBoard(num);
		
		return BVO;
	}

	@Override
	public ApplyVO selectApply(ApplyVO AVO) {

		ApplyVO applyVO = BMapper.selectApply(AVO);
		
		return applyVO;
	}

	@Override
	public void insertApply(ApplyVO AVO) {
		
		BMapper.insertApply(AVO);
		
	}

	@Override
	public void rejectApply(String name, int num) {

		BMapper.rejectApply(name,num);
		
	}

	@Override
	public void approveApply(String name, int num) {
		
		BMapper.approveApply(name,num);
		
	}

	@Override
	public void endApply(String name, int num) {

		BMapper.endApply(name,num);
		
	}

	@Override
	public void endBoard(int num) {

		BMapper.endBoard(num);
		
	}

}
