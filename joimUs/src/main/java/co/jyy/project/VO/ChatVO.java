package co.jyy.project.VO;

import java.sql.Date;

import lombok.Data;

@Data
public class ChatVO {

	private int ChatNum;
	private int ChatRoomNum;
	private String sender;
	private String recipient;
	private String message;
	private String readYN;
	private Date createDate;
	private String userImage;
	private String selfImage;
	private String date;
	
	private String sessionId;
	
}
