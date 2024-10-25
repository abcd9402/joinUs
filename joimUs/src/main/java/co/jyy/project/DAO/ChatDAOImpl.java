package co.jyy.project.DAO;

import java.util.List;

import org.springframework.stereotype.Repository;

import co.jyy.project.VO.ChatRoomVO;
import co.jyy.project.VO.ChatVO;
import co.jyy.project.VO.UserVO;
import co.jyy.project.mapper.ChatMapper;
import co.jyy.project.mapper.UserMapper;
import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class ChatDAOImpl implements ChatDAO{

	
	private final ChatMapper CMapper;
	private final UserMapper UMapper;
	
	@Override
	public List<ChatVO> readYN(String id) {
		List<ChatVO> cVO = CMapper.readYN(id);
		return cVO;
	}

	@Override
	public List<ChatRoomVO> chatList(String id) {
		
		List<ChatRoomVO> chatRoomVO = CMapper.chatList(id);
		
		return chatRoomVO;
	}

	@Override
	public void chatRoomInsert(ChatRoomVO CRVO) {
		String userImage = CRVO.getRecipient();
		UserVO uVO = UMapper.selectUser(userImage);
		String selfImage = CRVO.getSender();
		UserVO uVO2 = UMapper.selectUser(selfImage);
		if(uVO != null && uVO2 != null) {
			System.out.println(uVO);
			CRVO.setUserImage(uVO.getUserImage());
			CRVO.setSelfImage(uVO2.getUserImage());
			System.out.println(CRVO);
			CMapper.chatRoomInsert(CRVO);
			
			ChatRoomVO CRVO2 = CMapper.selectChatRoom(CRVO);
			System.out.println("CRVO2: "+CRVO2);
			if(CRVO2 != null) {
				CMapper.insertChat(CRVO2);
			}

		}
		
		
	}

	@Override
	public List<ChatVO> chatCommentList(int num) {

		List<ChatVO> CVO = CMapper.chatCommentList(num);
		System.out.println(CVO);
		
		return CVO;
	}

	@Override
	public void readUpdate(ChatVO cvo) {
		if(cvo.getReadYN() != "Y") {
			if(cvo.getSessionId().equals(cvo.getSender()) && (cvo.getReadYN().equals("R"))) {
				CMapper.readUpdate(cvo);
				CMapper.readUpdate2(cvo);
			}else if(cvo.getSessionId() != cvo.getSender() && (cvo.getReadYN().equals("N"))) {
				CMapper.readUpdate(cvo);
				CMapper.readUpdate2(cvo);
			}	
		}
		
		
		
	}

	@Override
	public void insertChat(ChatVO cvo) {
		System.out.println("session: "+cvo.getSessionId());
		System.out.println(cvo.getSender());
		if(cvo.getSessionId().equals(cvo.getSender())) {
			System.out.println("11111111");
			CMapper.insertChatMessage(cvo);
			CMapper.updateChatRoom(cvo);
		}else {
			System.out.println("2222222222222");
			CMapper.insertChatMessage2(cvo);
			CMapper.updateChatRoom2(cvo);
		}
		
		
		
	}
	

}
