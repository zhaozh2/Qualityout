<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<%@ taglib prefix="sitemesh"
	uri="http://www.opensymphony.com/sitemesh/decorator"%>
<!DOCTYPE html>
<html>
<head>
<link href="/huaxin/css/list.css" rel="stylesheet" type="text/css">
<title><sitemesh:title default="欢迎光临" /></title>
<%@include file="/WEB-INF/views/modules/cms/front/include/head.jsp"%>
<!-- Baidu tongji analytics -->
<script>
	var _hmt = _hmt || [];
	(function() {
		var hm = document.createElement("script");
		hm.src = "//hm.baidu.com/hm.js?82116c626a8d504a5c0675073362ef6f";
		var s = document.getElementsByTagName("script")[0];
		s.parentNode.insertBefore(hm, s);
	})();
</script>
<sitemesh:head />
<script>
	function init() {
		logdate();
		setInterval('changeimg()', 10000);
		setInterval('logdate()', 1000);
	}
	function logdate() {
		var date = new Date();
		var seperator2 = ":";
		var month = date.getMonth() + 1;
		var strDate = date.getDate();
		if (month >= 1 && month <= 9) {
			month = "0" + month;
		}
		if (strDate >= 0 && strDate <= 9) {
			strDate = "0" + strDate;
		}

		var hour = date.getHours();
		var minutes = date.getMinutes();
		var seconds = date.getSeconds();
		if (hour >= 0 && hour <= 9) {
			hour = "0" + hour;
		}
		if (minutes >= 0 && minutes <= 9) {
			minutes = "0" + minutes;
		}
		if (seconds >= 0 && seconds <= 9) {
			seconds = "0" + seconds;
		}
		var a = new Array("日", "一", "二", "三", "四", "五", "六");
		var week = date.getDay();
		var str = "今天是  星期" + a[week];
		var currentdate = date.getFullYear() + " 年 " + month + " 月 " + strDate
				+ " 日 " + hour + seperator2 + minutes + seperator2 + seconds
				+ "  &nbsp;" + str;
		$('#logdate').html(currentdate);
	}
	
	var num = 1;
	function changeimg() {
		$('#Image1').attr("src","/huaxin/img/ad_"+num+".png");
		num++;
		if(num==4){
			num = 1;
		}
	};
	
	function _search(){
		var url = "/f/search?pageNo=1&t=article&cid=&a=0&pageSize=30&q=";
		window.location.href = url;
	}
</script>
</head>
<body onload="init();">
	<table width="940" border="0" align="center" cellspacing="0"
		cellpadding="0">
		<tbody>
			<tr>
				<td height="30" colspan="7" background="/huaxin/img/bk.png"><table
						width="940" border="0" cellspacing="0" cellpadding="0">
						<tbody>
							<tr>
								<td class="STYLE3">欢迎访问嘉兴市交通工程质量安全监督站</td>
								<td><div align="center" class="STYLE3">加为收藏</div></td>
							</tr>
						</tbody>
					</table></td>
			</tr>
			<tr>
				<td height="172" colspan="7" background="/huaxin/img/ad.png"><table
						width="344" height="172" border="0" align="right" cellpadding="0"
						cellspacing="0">
						<tbody>
							<tr>
								<td align="right">
									<img src="/huaxin/img/ad_1.png" id="Image1" width="344" height="172">
								</td>
							</tr>
						</tbody>
					</table></td>
			</tr>
			<tr>
				<td height="35" colspan="7" background="/huaxin/img/bk1.png"
					class="STYLE3"><div id="logdate"
						style="position: relative; left: 10px;width: 50%;float: left;"></div>
					<div style="position: relative;text-align: right;height: 20px;bottom: 5px"><input class="btn btn-primary" id="searchparam" type="button" placeholder="标题" value="全站搜索" onclick="_search(this.value);"/></div>
				</td>
			</tr>
		</tbody>
	</table>
	<div style="text-align: center;">
		<div class="navbar navbar-fixed-top"
			style="position: static; width: 940px; margin: 0 auto;"
			align="center">
			<div class="navbar-inner">
				<div class="container">
					<div class="nav-collapse">
						<ul id="main_nav" class="nav nav-pills">
							<li class="${not empty isIndex && isIndex ? 'active' : ''}"><a
								href="${ctx}/index-1${fns:getUrlSuffix()}"><span>${site.id eq '1'?'首　 页':'返回主站'}</span></a></li>
							<c:forEach items="${fnc:getMainNavList(site.id)}" var="category"
								varStatus="status">
								<c:if test="${status.index lt 6}">
									<c:set var="menuCategoryId" value=",${category.id}," />
									<li
										class="${requestScope.category.id eq category.id||fn:indexOf(requestScope.category.parentIds,menuCategoryId) ge 1?'active':''}"><a
										href="${category.url}" target="${category.target}"><span>${category.name}</span></a></li>
								</c:if>
							</c:forEach>
						</ul>
					</div>
					<!--/.nav-collapse -->
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="content">
			<sitemesh:body />
		</div>
		<div style="margin-top: 0px; color: #fff;">
			<table width="940" border="0" align="center" cellspacing="0">
				<tbody>
					<tr>
						<td height="32" background="/huaxin/img/db.png"><table
								width="500" border="0" align="center">
								<tbody>
									<tr>
										<td><div align="center">
												<span class="STYLE1">免责声明</span>
											</div></td>
										<td><div align="center">
												<span class="STYLE1">联系我们</span>
											</div></td>
										<td><div align="center">
												<span class="STYLE1">收藏本站</span>
											</div></td>
										<td><div align="center">
												<span class="STYLE1">意见建议</span>
											</div></td>
									</tr>
								</tbody>
							</table></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<!-- /container -->
	<div style="text-align: center;">
		版权所有（c） 嘉兴市交通工程质量安全监督站  &nbsp; &nbsp; &nbsp; &nbsp; 网络备案号 ：浙（ICP）备
			42562556 号
	</div>
	<div style="text-align: center;">
		地址：嘉兴市经济技术开发区城南街道万历路78号 &nbsp; &nbsp; &nbsp; &nbsp;电话：0573-83683668
			&nbsp; &nbsp; &nbsp; &nbsp;邮编：314001
	</div>
	<div style="text-align: center;">技术支持：浙江易审软件技术有限公司</div>
</body>
<script type="text/javascript">document.write(unescape("%3Cdiv style='text-align: center;' %3E%3Cspan id='_ideConac' %3E%3C/span%3E%3C/div%3E%3Cscript src='http://dcs.conac.cn/js/12/190/0000/60200239/CA121900000602002390002.js' type='text/javascript'%3E%3C/script%3E"));</script>
</html>