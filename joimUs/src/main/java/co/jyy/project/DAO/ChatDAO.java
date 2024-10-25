package co.jyy.project.DAO;

import java.util.List;

import org.springframework.stereotype.Service;

import co.jyy.project.VO.ChatRoomVO;
import co.jyy.project.VO.ChatVO;

@Service
public interface ChatDAO {
	
	public List<ChatVO> readYN(String id);
	
	public List<ChatRoomVO> chatList(String id);
	
	public void chatRoomInsert(ChatRoomVO CRVO);
	
	public List<ChatVO> chatCommentList(int num);
	
	public void readUpdate(ChatVO cvo);

	public void insertChat(ChatVO cvo);
	
}
