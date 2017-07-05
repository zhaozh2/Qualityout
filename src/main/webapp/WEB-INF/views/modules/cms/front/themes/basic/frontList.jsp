<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<title>${category.name}</title>
	<meta name="decorator" content="cms_default_${site.theme}"/>
	<meta name="description" content="${category.description}" />
	<meta name="keywords" content="${category.keywords}" />
</head>
<body>
	<div class="row">
		<div class="span3">
			<div class="tzgg">
				<img src="/huaxin/img/tzgg.jpg" alt="公告图标">
				<h2>栏目导航</h2>
				<div class="listl">
					<div class="tzlist">
						<ul>
							<cms:frontCategoryList categoryList="${categoryList}" />
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div class="span9">
		 <ul class="breadcrumb">
		    <cms:frontCurrentPosition category="${category}"/>
		 </ul>
	   </div>
       <div class="span9">
		  <c:if test="${category.module eq 'article'}">
			<ul style="margin-left: 0;"><c:forEach items="${page.list}" var="article">
				<li style="border-bottom: 1px dotted #7a7a7a;line-height: 31px;"><span class="pull-right"><fmt:formatDate value="${article.updateDate}" pattern="yyyy.MM.dd"/></span><a href="${article.url}" style="color:${article.color}">${fns:abbr(article.title,96)}</a></li>
			</c:forEach></ul>
			<div class="pagination">${page}</div>
			<script type="text/javascript">
				function page(n,s){
					location="${ctx}/list-${category.id}${urlSuffix}?pageNo="+n+"&pageSize="+s;
				}
			</script>
		  </c:if>
		  <c:if test="${category.module eq 'link'}">
			<ul style="margin-left: 0;"><c:forEach items="${page.list}" var="link">
				<li style="border-bottom: 1px dotted #7a7a7a;line-height: 31px;"><a href="${link.href}" target="_blank" style="color:${link.color}"><c:out value="${link.title}" /></a></li>
			</c:forEach></ul>
		  </c:if>
  	  </div>
   </div>
</body>
</html>