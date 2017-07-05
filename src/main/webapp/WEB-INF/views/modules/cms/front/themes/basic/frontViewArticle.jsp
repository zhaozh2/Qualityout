<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<title>${article.title} - ${category.name}</title>
	<meta name="decorator" content="cms_default_${site.theme}"/>
	<meta name="description" content="${article.description} ${category.description}" />
	<meta name="keywords" content="${article.keywords} ${category.keywords}" />
	<script type="text/javascript">
		$(document).ready(function() {
			if ("${category.allowComment}"=="1" && "${article.articleData.allowComment}"=="1"){
				$("#comment").show();
				page(1);
			}
			var files = '${article.files}';
			var file = files.split('|');
			for(var i=0;i<file.length;i++){
				if(file[i]!=''){
					var filename = chineseFromUtf8Url(file[i].substring(file[i].lastIndexOf("/")+1,file[i].length));
					$('#filesPreview').append('<li><a href="'+file[i]+'" url="'+file[i]+'" target="_blank">'+filename+'</a>&nbsp;&nbsp;</li>');
				}
			}
		});
		function page(n,s){
			$.get("${ctx}/comment",{theme: '${site.theme}', 'category.id': '${category.id}',
				contentId: '${article.id}', title: '${article.title}', pageNo: n, pageSize: s, date: new Date().getTime()
			},function(data){
				$("#comment").html(data);
			});
		}
		
		function   chineseFromUtf8Url(strUtf8)    
		{ 
		var   bstr   =   ""; 
		var   nOffset   =   0; //   processing   point   on   strUtf8 
		   
		if(   strUtf8   ==   ""   ) 
		      return   ""; 
		   
		strUtf8   =   strUtf8.toLowerCase(); 
		nOffset   =   strUtf8.indexOf("%e"); 
		if(   nOffset   ==   -1   ) 
		      return   strUtf8; 
		       
		while(   nOffset   !=   -1   ) 
		{ 
		      bstr   +=   strUtf8.substr(0,   nOffset); 
		      strUtf8   =   strUtf8.substr(nOffset,   strUtf8.length   -   nOffset); 
		      if(   strUtf8   ==   ""   ||   strUtf8.length   <   9   )       //   bad   string 
		          return   bstr; 
		       
		      bstr   +=   utf8CodeToChineseChar(strUtf8.substr(0,   9)); 
		      strUtf8   =   strUtf8.substr(9,   strUtf8.length   -   9); 
		      nOffset   =   strUtf8.indexOf("%e"); 
		} 
		   
		return   bstr   +   strUtf8; 
		} 
		   
		 
		   
		function   utf8CodeToChineseChar(strUtf8) 
		{ 
		      var   iCode,   iCode1,   iCode2; 
		      iCode   =   parseInt("0x"   +   strUtf8.substr(1,   2)); 
		      iCode1   =   parseInt("0x"   +   strUtf8.substr(4,   2)); 
		      iCode2   =   parseInt("0x"   +   strUtf8.substr(7,   2)); 
		       
		      return   String.fromCharCode(((iCode   &   0x0F)   <<   12)   |    
		((iCode1   &   0x3F)   <<     6)   | 
		(iCode2   &   0x3F)); 
		} 
		   
		</script>
</head>
<body>
	<div class="row">
	   <div class="span12">
		 <ul class="breadcrumb">
		    <cms:frontCurrentPosition category="${category}"/>
		 </ul>
	   </div>
	   <div class="span12">
	     <div class="row">
	       <div class="span12">
			<h3 style="color:#555555;font-size:20px;text-align:center;">${article.title}</h3>
			<h5 style="text-align:center;border-bottom:1px solid #ddd;padding-bottom:15px;margin:5px 0 15px 0;"><fmt:formatDate value="${article.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/></h5>
			<c:if test="${not empty article.description}"><div>摘要：${article.description}</div></c:if>
			<div>${article.articleData.content}</div>
			<div class="control-group">
				<label class="control-label">附件：</label>
				<div class="controls">
				<ol id="filesPreview">
				</ol>
				</div>
			</div>
			<div style="border-top:1px solid #ddd;padding:10px;margin-top: 15px;">发布者：${article.user.name} &nbsp; 点击数：${article.hits} &nbsp;</div>
  	       </div>
  	     </div>
  	  </div>
   </div>
</body>
</html>