package co.jyy.project.mapper;

import java.util.List;

import co.jyy.project.VO.ChatRoomVO;
import co.jyy.project.VO.ChatVO;

public interface ChatMapper {

	public List<ChatVO> readYN(String id);
	
	public List<ChatRoomVO> chatList(String id);
	
	public void chatRoomInsert(ChatRoomVO CRVO);
	
	public ChatRoomVO selectChatRoom(ChatRoomVO CRVO);
	
	public void insertChat(ChatRoomVO CRVO);
	
	public List<ChatVO> chatCommentList(int num);
	
	public void readUpdate(ChatVO cvo);
	public void readUpdate2(ChatVO cvo);
	
	public void insertChatMessage(ChatVO cvo);
	
	public void insertChatMessage2(ChatVO cvo);
	
	public void updateChatRoom(ChatVO cvo);
	
	public void updateChatRoom2(ChatVO cvo);

	
	
}
