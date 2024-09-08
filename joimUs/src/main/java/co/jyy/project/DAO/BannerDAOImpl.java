package co.jyy.project.DAO;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import co.jyy.project.VO.BannerVO;
import co.jyy.project.mapper.BannerMapper;
import co.jyy.project.mapper.UserMapper;
import lombok.RequiredArgsConstructor;


@Repository
@RequiredArgsConstructor
public class BannerDAOImpl implements BannerDAO{

	private final BannerMapper BMapper;
	
	@Override
	public List<BannerVO > bannerMain() {
		
		List<BannerVO> BVO;
		
		try {
			BVO = BMapper.bannerMain();
		} catch (NullPointerException e) {
			System.out.println("nulllll");
			BVO=null;
		}
		return BVO;
	}

}
