<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>友情链接管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			
		});
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/qualitygoodlink/qualityGoodLink/">友情链接列表</a></li>
		<shiro:hasPermission name="qualitygoodlink:qualityGoodLink:edit"><li><a href="${ctx}/qualitygoodlink/qualityGoodLink/form">友情链接添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="qualityGoodLink" action="${ctx}/qualitygoodlink/qualityGoodLink/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>名称：</label>
				<form:input path="name" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			<li><label>状态：</label>
				<form:radiobuttons path="status" items="${fns:getDictList('quality_link_status')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>名称</th>
				<th>地址</th>
				<th>列号</th>
				<th>状态</th>
				<th>update_date</th>
				<shiro:hasPermission name="qualitygoodlink:qualityGoodLink:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="qualityGoodLink">
			<tr>
				<td><a href="${ctx}/qualitygoodlink/qualityGoodLink/form?id=${qualityGoodLink.id}">
					${qualityGoodLink.name}
				</a></td>
				<td>
					${qualityGoodLink.url}
				</td>
				<td>
					${qualityGoodLink.type}
				</td>
				<td>
					${fns:getDictLabel(qualityGoodLink.status, 'quality_link_status', '')}
				</td>
				<td>
					<fmt:formatDate value="${qualityGoodLink.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<shiro:hasPermission name="qualitygoodlink:qualityGoodLink:edit"><td>
    				<a href="${ctx}/qualitygoodlink/qualityGoodLink/form?id=${qualityGoodLink.id}">修改</a>
					<a href="${ctx}/qualitygoodlink/qualityGoodLink/delete?id=${qualityGoodLink.id}" onclick="return confirmx('确认要删除该友情链接吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>