package co.jyy.project.VO;

import java.sql.Date;

import lombok.Data;

@Data
public class ChatRoomVO {

	private int ChatRoomNum;
	private String sender;
	private String recipient;
	private Date updateDate;
	private String message;
	private String userImage;
	private String readYN;
	private String selfImage;
}
