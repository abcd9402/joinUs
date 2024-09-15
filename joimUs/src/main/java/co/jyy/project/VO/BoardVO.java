package co.jyy.project.VO;

import java.sql.Date;

import lombok.Data;

@Data
public class BoardVO {

	private int boardNum;
	private String userId;
	private String boardTitle;
	private String boardContent;
	private String boardCategory;
	private String boardStatus;
	private String boardPlace;
	private float addressX;
	private float addressY;
	private Date reservationDate;
	private int reservationTime;
	private String date;
	
	
	
}
