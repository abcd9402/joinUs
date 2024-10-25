package co.jyy.project.service;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import co.jyy.project.DAO.BoardDAO;
import co.jyy.project.DAO.ChatDAO;
import co.jyy.project.DAO.UserDAO;
import co.jyy.project.VO.ChatRoomVO;
import co.jyy.project.VO.ChatVO;
import lombok.RequiredArgsConstructor;

@Repository
@Service
@RequiredArgsConstructor
public class ChatServiceImpl implements ChatService{
	
	
	
	private final ChatDAO CDao;
	
	@Override
	public List<ChatVO> readYN(String id) {
		List<ChatVO> cVO = CDao.readYN(id);
		return cVO;
	}

	@Override
	public List<ChatRoomVO> chatList(String id) {

		List<ChatRoomVO> chatRoomVO = CDao.chatList(id);
		return chatRoomVO;
	}

	@Override
	public void chatRoomInsert(ChatRoomVO CRVO) {

		CDao.chatRoomInsert(CRVO);
		
	}

	@Override
	public List<ChatVO> chatCommentList(int num) {
		
		List<ChatVO> chatRoomVO = CDao.chatCommentList(num);
		return chatRoomVO;
	}

	@Override
	public void readUpdate(ChatVO cvo) {
		
		CDao.readUpdate(cvo);
		
	}

	@Override
	public void insertChat(ChatVO cvo) {
		
		CDao.insertChat(cvo);
		
	}
	

}
