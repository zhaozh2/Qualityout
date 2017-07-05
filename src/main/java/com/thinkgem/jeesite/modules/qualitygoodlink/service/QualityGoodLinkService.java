/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.qualitygoodlink.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.qualitygoodlink.entity.QualityGoodLink;
import com.thinkgem.jeesite.modules.oa.dao.LeaveDao;
import com.thinkgem.jeesite.modules.qualitygoodlink.dao.QualityGoodLinkDao;

/**
 * 友情链接Service
 * @author zhaozh
 * @version 2017-05-12
 */
@Service
@Transactional(readOnly = true)
public class QualityGoodLinkService extends CrudService<QualityGoodLinkDao, QualityGoodLink> {

	@Autowired
	private QualityGoodLinkDao linkdao;
	
	public QualityGoodLink get(String id) {
		return super.get(id);
	}
	
	public List<QualityGoodLink> findList(QualityGoodLink qualityGoodLink) {
		return super.findList(qualityGoodLink);
	}
	
	public Page<QualityGoodLink> findPage(Page<QualityGoodLink> page, QualityGoodLink qualityGoodLink) {
		return super.findPage(page, qualityGoodLink);
	}
	
	@Transactional(readOnly = false)
	public void save(QualityGoodLink qualityGoodLink) {
		super.save(qualityGoodLink);
	}
	
	@Transactional(readOnly = false)
	public void delete(QualityGoodLink qualityGoodLink) {
		super.delete(qualityGoodLink);
	}
	
	public List<QualityGoodLink> findListByIndex(int start,int end) {
		QualityGoodLink g = new QualityGoodLink();
		g.setStart(start);
		g.setEnd(end);
		List<QualityGoodLink> list = linkdao.findListByIndex(g);
		return list;
	}
	
	public List<QualityGoodLink> getFlyLink(){
		QualityGoodLink g = new QualityGoodLink();
		return linkdao.getFlyLink(g);
	}
}