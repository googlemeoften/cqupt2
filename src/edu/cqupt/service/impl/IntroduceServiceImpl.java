package edu.cqupt.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.cqupt.mapper.IntroduceMapper;
import edu.cqupt.po.introduce.Introduce;
import edu.cqupt.service.IntroduceService;
/**
 * <p>Description:概述业务层</p>
 * @author dave
 * @date 2015-9-4
 */
@Service("introduceService")
public class IntroduceServiceImpl implements IntroduceService {

	@Autowired
	private IntroduceMapper introduceMapper;

	public void addIntroduce(Introduce introduce) {
		introduceMapper.addIntroduce(introduce);
	}

	public void editIntroduce(Introduce introduce) {
		introduceMapper.updateIntroduce(introduce);
	}

	public Introduce findIntroduce() {
		
		return introduceMapper.findIntroduce();
	}

}
