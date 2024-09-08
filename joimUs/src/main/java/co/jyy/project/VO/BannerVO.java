package co.jyy.project.VO;

import lombok.Data;

@Data
public class BannerVO {

	private int bannerNum; //글 번호(고유 번호)
	private String bannerImagine; //이미지 경로
	private String bannerCompany; // 회사명
	private	String bannerURL; //회사 주소
}
