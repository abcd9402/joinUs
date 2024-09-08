package co.jyy.project.service;

import java.util.List;

import org.springframework.stereotype.Service;

import co.jyy.project.VO.BannerVO;

@Service
public interface BannerService {

	
	public List<BannerVO> bannerMain();
	
}
