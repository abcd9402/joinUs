package co.jyy.project.service;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import co.jyy.project.DAO.BannerDAO;
import co.jyy.project.DAO.UserDAO;
import co.jyy.project.VO.BannerVO;
import lombok.RequiredArgsConstructor;

@Repository
@Service
@RequiredArgsConstructor
public class BannerServiceImpl implements BannerService {

	private final BannerDAO BDAO;
	
	public List<BannerVO> bannerMain() {
		
		List<BannerVO> BVO;
		
		BVO = BDAO.bannerMain();
		
		return BVO;
	}
}
