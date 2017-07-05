<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>首页</title>
<meta name="decorator" content="cms_default_${site.theme}" />
<meta name="description" content="JeeSite ${site.description}" />
<meta name="keywords" content="JeeSite ${site.keywords}" />
<script type="text/javascript" src="huaxin/common/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="huaxin/common/Marquee.js"></script>
<script src="http://webapi.amap.com/maps?v=1.3&key=ed8b0e2710318f9259d17868d73d5fb1"></script>
    
<style type="text/css">
/* #marquee3 */
.marqueebox {
	position: relative;
}

#marquee3 {
	height: 210px;
	overflow: hidden;
}

#marquee3 ul li {
	float: left;
}

#marquee3 ul li img {
	display: block;
}

#mar3Nav {
	position: absolute;
	right: 10px;
	bottom: 10px;
}

#mar3Nav li {
	float: left;
	margin: 0 3px;
	width: 16px;
	height: 16px;
	background: #333;
	border: 1px solid #FFF;
	cursor: pointer;
	line-height: 16px;
	font-family: Arial;
	font-size: 10px;
	color: #FFF;
	text-align: center;
}

#mar3Nav li.navOn {
	background: #FF6600;
}

.div1 {
	height: 3px;
}
</style>

<script type="text/javascript">
var map;
$(function(){
	//一次滚动一屏
	$('#marquee3').kxbdSuperMarquee({
		distance:345,
		time:4,
		navId:'#mar3Nav',
		direction:'left'
	});
	map = new AMap.Map('mapdiv', {
		resizeEnable: true,
	    zoom:15,
	    center: [120.727984,30.74017]
	});
	addMarker();
	
	$('#link1').change(function(){ 
		var p1=$(this).children('option:selected').val();//这就是selected的值 
		window.open(p1,"link");//页面跳转并传参 
	}); 
	$('#link2').change(function(){ 
		var p1=$(this).children('option:selected').val();//这就是selected的值 
		window.open(p1,"link");//页面跳转并传参 
	}); 
	$('#link3').change(function(){ 
		var p1=$(this).children('option:selected').val();//这就是selected的值 
		window.open(p1,"link");//页面跳转并传参 
	}); 
	$('#link4').change(function(){ 
		var p1=$(this).children('option:selected').val();//这就是selected的值 
		window.open(p1,"link");//页面跳转并传参 
	}); 
});

function addMarker() {
    marker = new AMap.Marker({
        icon: "http://webapi.amap.com/theme/v1.3/markers/n/mark_b.png",
        position: [120.727984,30.74017]
    });
    marker.setMap(map);
}
</script>
</head>
<body>
	<table width="940" align="center" cellpadding="0">
		<tr>
			<td width="690" height="866" valign="top">
				<c:forEach items="${categoryList}" var="tpl">
				<c:if test="${tpl.inList eq '1' && tpl.module ne '' && tpl.name eq '新闻动态'}">
					<div class="row" style="margin-left:-8px;">
			    	<div class="span10" style="width:690px; margin: 2px 0 0 6px;border: solid 1px #ddd;">
			    		<h4 style="background: url(huaxin/img/picnews.png);height: 33px;width: 100%;color: #fff;"><small><a href="${ctx}/list-${tpl.id}${urlSuffix}" class="pull-right" style="padding: 9px;">更多</a></small><div style="padding: 4px 20px;">${tpl.name}</div></h4>
						<div style="width:50%;float: left;">
						<div class="marqueebox">
							<div id="marquee3">
								<ul style="margin:0px;">
									<c:forEach items="${fnc:getArticleList(site.id, tpl.id, 5, '')}" var="article">
										<li><a target="_blank" href="${ctx}/view-${article.category.id}-${article.id}${urlSuffix}" title=""><img style="width: 345px; height: 210px;" src="${article.image}" /></a></li>
									</c:forEach>
								</ul>
							</div>
							<div id="mar3Nav"></div>
						</div>
						</div>
						<div style="width:50%;float: right;">
							<c:if test="${tpl.module eq 'article'}">
				    			<ul style="margin: 5px;"><c:forEach items="${fnc:getArticleList(site.id, tpl.id, 10, '')}" var="article">
									<li><span class="pull-right"><fmt:formatDate value="${article.updateDate}" pattern="yyyy.MM.dd"/></span><a href="${ctx}/view-${article.category.id}-${article.id}${urlSuffix}" style="color:${article.color}">${fns:abbr(article.title,30)}</a></li>
								</c:forEach></ul>
							</c:if>
							<c:if test="${tpl.module eq 'link'}">
				    			<ul style="margin: 5px;"><c:forEach items="${fnc:getLinkList(site.id, tpl.id, 10, '')}" var="link">
									<li><a target="_blank" href="${link.href}" style="color:${link.color}">${fns:abbr(link.title,30)}</a></li>
								</c:forEach></ul>
							</c:if>
						</div>
			    	</div>
			    	</div>
				</c:if>
			  </c:forEach>
			  <c:set var="index" value="1"/>
			  <c:forEach items="${categoryList}" var="tpl">
				<c:if test="${tpl.inList eq '1' && tpl.module ne '' && tpl.name ne '测试栏目' && tpl.name ne '新闻动态'}">
					<c:set var="index" value="${index+1}"/>
					${index % 2 eq 0 ? '<div class="row" style="margin-left:-8px;">':''}
			    	<div class="span5" style="width:340px; margin: 8px 0 0 6px;border: solid 1px #ddd;height: 160px;">
			    		<h4 style="background: url(huaxin/img/dh.png);height: 33px;width: 340px;color: #fff;"><small><a href="${ctx}/list-${tpl.id}${urlSuffix}" class="pull-right" style="padding: 9px;">更多</a></small><div style="padding: 4px 20px;">${tpl.name}</div></h4>
						<c:if test="${tpl.module eq 'article'}">
			    			<ul style="margin: 5px;"><c:forEach items="${fnc:getArticleList(site.id, tpl.id, 5, '')}" var="article">
								<li><span class="pull-right"><fmt:formatDate value="${article.updateDate}" pattern="yyyy.MM.dd"/></span><a href="${ctx}/view-${article.category.id}-${article.id}${urlSuffix}" style="color:${article.color}">${fns:abbr(article.title,40)}</a></li>
							</c:forEach></ul>
						</c:if>
						<c:if test="${tpl.module eq 'link'}">
			    			<ul style="margin: 5px;"><c:forEach items="${fnc:getLinkList(site.id, tpl.id, 5, '')}" var="link">
								<li><a target="_blank" href="${link.href}" style="color:${link.color}">${fns:abbr(link.title,40)}</a></li>
							</c:forEach></ul>
						</c:if>
			    	</div>
			    	${index eq 3 ? '<div class="span10" style="width:690px; margin: 2px 0 0 6px;border: solid 1px #ddd;"><h4 style="background: url(huaxin/img/picnews.png);height: 33px;width: 100%;color: #fff;"><div style="padding: 4px 20px;">办事指南</div></h4></div>':''}
			    	${index % 2 ne 0 ? '</div>':''}
				</c:if>
			  </c:forEach>
			</td>
			<td valign="top"><table width="250" align="right">
					<tr>
						<td><table width="250" align="right">
								<tr>
									<td><img src="huaxin/img/out03.png" width="250" height="51" /></td>
								</tr>
								<tr>
									<td><img src="huaxin/img/out06.png" width="250" height="51"  /></td>
								</tr>
								<tr>
									<td><img src="huaxin/img/out08.png" width="250" height="51"  /></td>
								</tr>
								<tr>
									<td><img src="huaxin/img/out10.png" width="250" height="51"/></td>
								</tr>
							</table></td>
					</tr>
					<tr>
						<td><table width="250" align="right" cellpadding="0">
								<tr>
									<td><div style="background: url(huaxin/img/zwgk.png);width: 250px;height: 34px;"><span style="position: relative;left: 16px;top: 12px;font-size: 14px;font-family: Helvetica,Georgia,Arial,sans-serif;">政务公开</span></div></td>
								</tr>
								<tr>
									<td height="97" valign="top"><table width="250"
											align="center" style="border: 1px solid #ddd">
											<tr>
												<td height="70" align="center"><a
													href="${ctx}/list-11.html"> <img
														src="huaxin/img/work.png" width="40" height="40" />
												</a></td>
												<td align="center"><a href="${ctx}/list-12.html"> <img
														src="huaxin/img/ren.png" width="50" height="50" />
												</a></td>
											</tr>
											<tr>
												<td align="center" class="STYLE4">主要职能</td>
												<td align="center" class="STYLE4">领导介绍</td>
											</tr>
											<tr>
												<td height="70" align="center"><a
													href="${ctx}/list-13.html"><img src="huaxin/img/p1.png"
														width="40" height="40" /></a></td>
												<td align="center"><a href="${ctx}/list-14.html"><img
														src="huaxin/img/open.png" width="40" height="40" /></a></td>
											</tr>
											<tr>
												<td align="center" class="STYLE4">机构设置</td>
												<td align="center" class="STYLE4">权利公开</td>
											</tr>
											<tr>
												<td height="62" align="center"><a
													href="${ctx}/list-15.html"><img
														src="huaxin/img/position.png" width="40" height="40" /></a></td>
												<td align="center"><a href="${ctx}/list-16.html"><img
														src="huaxin/img/icon_monitor.png" width="40" height="40" /></a></td>
											</tr>
											<tr>
												<td height="24" align="center" class="STYLE4">职责公开</td>
												<td align="center" class="STYLE4">监督平台</td>
											</tr>
										</table></td>
								</tr>
							</table></td>
					</tr>
					<tr>
						<td><table width="250" align="right">
								<tr>
									<td><a href="/f/guestbook"><img src="huaxin/img/out27.png" width="250"
										height="50" /></a></td>
								</tr>
								<tr>
									<td><a href="/f/guestbook"><img src="huaxin/img/out30.png" width="250"
										height="50" /></a></td>
								</tr>
								<tr>
									<td><div id="mapdiv" style="width:100%;height:250px;"></div>
									<div class="jzxx"><br>地址:嘉兴市南湖区万历路78号 <br>传真:0573-83680313 <br>邮编:311215<br>
									邮箱:jxzjz2009@163.com</div>
									</td>
								</tr>
							</table></td>
					</tr>
				</table></td>
		</tr>
	</table>
	<div style="margin-top: 10px; background: #efefef;">
			<div style="height: 22px;padding: 5px">友情链接：</div>
			<table width="940" border="0" align="center" cellspacing="0">
				<tbody>
					<tr>
						<td height="32"><select id="link1">
								<c:forEach items="${fnc:getGoodLinkList(10,1)}" var="category"
									varStatus="status">
									<option value="${category.url}">${category.name}</option>
								</c:forEach>
						</select></td>
						<td><div align="center">
								<select id="link2">
									<c:forEach items="${fnc:getGoodLinkList(10,2)}"
										var="category" varStatus="status">
										<option value="${category.url}">${category.name}</option>
									</c:forEach>
								</select>
							</div></td>
						<td><div align="center">
								<select id="link3">
									<c:forEach items="${fnc:getGoodLinkList(10,3)}"
										var="category" varStatus="status">
										<option value="${category.url}">${category.name}</option>
									</c:forEach>
								</select>
							</div></td>
						<td><div align="center">
								<select id="link4">
									<c:forEach items="${fnc:getGoodLinkList(10,4)}"
										var="category" varStatus="status">
										<option value="${category.url}">${category.name}</option>
									</c:forEach>
								</select>
							</div></td>
					</tr>
				</tbody>
			</table>
		</div>
</body>
</html>