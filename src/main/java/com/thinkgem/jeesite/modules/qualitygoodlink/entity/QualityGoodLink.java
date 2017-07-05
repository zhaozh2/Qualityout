/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.qualitygoodlink.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 友情链接Entity
 * 
 * @author zhaozh
 * @version 2017-05-12
 */
public class QualityGoodLink extends DataEntity<QualityGoodLink> {

	private static final long serialVersionUID = 1L;
	private String name; // 名称
	private String url; // 地址
	private String status; // 状态
	private int start; // 开始
	private int end; // 结束
	private String type; // 列号

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public QualityGoodLink() {
		super();
	}

	public QualityGoodLink(String id) {
		super(id);
	}

	@Length(min = 0, max = 255, message = "名称长度必须介于 0 和 255 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Length(min = 0, max = 255, message = "地址长度必须介于 0 和 255 之间")
	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	@Length(min = 0, max = 8, message = "状态长度必须介于 0 和 8 之间")
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

}