package co.jyy.project.DAO;

import java.util.List;

import co.jyy.project.VO.ApplyVO;
import co.jyy.project.VO.BoardVO;
import co.jyy.project.VO.SearchVO;

public interface BoardDAO {
	
	
	public BoardVO search(SearchVO SVO);
	
	public void boardInsert(BoardVO BVO);
	
	public List<BoardVO> boardList(SearchVO SVO);

	public void boardDel(int num);
	
	public List<ApplyVO> applyList(int num,String userId);
	
	public BoardVO selectBoard(int num);
	
	public ApplyVO selectApply(ApplyVO AVO);

	public void insertApply(ApplyVO AVO);
	
	public void rejectApply(String name,int num);
	
	public void approveApply(String name,int num);

	public void endApply(String name,int num);
	
	public void endBoard(int num);
	
}
