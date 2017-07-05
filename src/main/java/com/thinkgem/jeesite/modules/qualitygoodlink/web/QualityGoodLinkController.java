/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.qualitygoodlink.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.qualitygoodlink.entity.QualityGoodLink;
import com.thinkgem.jeesite.modules.qualitygoodlink.service.QualityGoodLinkService;

/**
 * 友情链接Controller
 * @author zhaozh
 * @version 2017-05-12
 */
@Controller
@RequestMapping(value = "${adminPath}/qualitygoodlink/qualityGoodLink")
public class QualityGoodLinkController extends BaseController {

	@Autowired
	private QualityGoodLinkService qualityGoodLinkService;
	
	@ModelAttribute
	public QualityGoodLink get(@RequestParam(required=false) String id) {
		QualityGoodLink entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = qualityGoodLinkService.get(id);
		}
		if (entity == null){
			entity = new QualityGoodLink();
		}
		return entity;
	}
	
	@RequiresPermissions("qualitygoodlink:qualityGoodLink:view")
	@RequestMapping(value = {"list", ""})
	public String list(QualityGoodLink qualityGoodLink, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<QualityGoodLink> page = qualityGoodLinkService.findPage(new Page<QualityGoodLink>(request, response), qualityGoodLink); 
		model.addAttribute("page", page);
		return "modules/qualitygoodlink/qualityGoodLinkList";
	}

	@RequiresPermissions("qualitygoodlink:qualityGoodLink:view")
	@RequestMapping(value = "form")
	public String form(QualityGoodLink qualityGoodLink, Model model) {
		model.addAttribute("qualityGoodLink", qualityGoodLink);
		return "modules/qualitygoodlink/qualityGoodLinkForm";
	}

	@RequiresPermissions("qualitygoodlink:qualityGoodLink:edit")
	@RequestMapping(value = "save")
	public String save(QualityGoodLink qualityGoodLink, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, qualityGoodLink)){
			return form(qualityGoodLink, model);
		}
		qualityGoodLinkService.save(qualityGoodLink);
		addMessage(redirectAttributes, "保存友情链接成功");
		return "redirect:"+Global.getAdminPath()+"/qualitygoodlink/qualityGoodLink/?repage";
	}
	
	@RequiresPermissions("qualitygoodlink:qualityGoodLink:edit")
	@RequestMapping(value = "delete")
	public String delete(QualityGoodLink qualityGoodLink, RedirectAttributes redirectAttributes) {
		qualityGoodLinkService.delete(qualityGoodLink);
		addMessage(redirectAttributes, "删除友情链接成功");
		return "redirect:"+Global.getAdminPath()+"/qualitygoodlink/qualityGoodLink/?repage";
	}

}