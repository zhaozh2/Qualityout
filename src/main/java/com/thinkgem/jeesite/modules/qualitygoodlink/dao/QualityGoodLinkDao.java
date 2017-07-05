/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.qualitygoodlink.dao;

import java.util.List;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.qualitygoodlink.entity.QualityGoodLink;

/**
 * 友情链接DAO接口
 * @author zhaozh
 * @version 2017-05-12
 */
@MyBatisDao
public interface QualityGoodLinkDao extends CrudDao<QualityGoodLink> {
	public List<QualityGoodLink> findListByIndex(QualityGoodLink qualityGoodLink) ;
}