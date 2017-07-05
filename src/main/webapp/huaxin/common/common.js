/** ************************图形相关**start********************** */
// 初始化echart配置
function doinitEchart() {
	// 路径配置
	require.config({
		paths : {
			echarts : '/acwsui/js/echarts/build/dist'
		}
	});

	require(
			[ 'echarts', 'echarts/chart/line', 'echarts/chart/bar',
					'echarts/chart/scatter', 'echarts/chart/pie',
					'echarts/chart/radar' ], requireCallback);
}

var echarts;
function requireCallback(ec) {
	echarts = ec;
}

// 绘制图形
function doDrawEchart(outputData) {
	window.setTimeout(function() {
		doDraw(outputData);
	}, 200);
}
var myChart;
function doDraw(outputData) {
	var divid = outputData.DIVID;
	var type = outputData.MAKETYPE;
	myChart = echarts.init(document.getElementById(divid));
	var option = outputData.OPTION;
	var optionjson = "";
	if (type == 'js') {
		optionjson = option;
	} else {
		optionjson = eval('(' + option + ')');
	}
	myChart.setOption(optionjson);
}

/** ************************图形相关**end********************** */

// 显示遮盖
function showmask_() {
	$("#mask").empty();
	var maskstr = '<div class="loading-container">'
			+ '<div class="loading-progress">' + '<div class="rotator">'
			+ '<div class="rotator">' + '<div class="rotator colored">'
			+ '<div class="rotator">' + '<div class="rotator colored">'
			+ '<div class="rotator colored"></div>'
			+ '<div class="rotator"></div>' + '</div>'
			+ '<div class="rotator colored"></div>' + '</div>'
			+ '<div class="rotator"></div>' + '</div>'
			+ '<div class="rotator"></div>' + '</div>'
			+ '<div class="rotator"></div>' + '</div>'
			+ '<div class="rotator"></div>' + '</div>' + '</div>';
	$("#mask").append(maskstr);
}
// 隐藏遮盖
function hidemask_() {
	$(".loading-container").addClass("loading-inactive");
}
/** ************************遮盖**end********************** */
// 获取日期
function getDay(day) {
	var today = new Date();

	var targetday_milliseconds = today.getTime() + 1000 * 60 * 60 * 24 * day;

	today.setTime(targetday_milliseconds); // 注意，这行是关键代码

	var tYear = today.getFullYear();
	var tMonth = today.getMonth();
	var tDate = today.getDate();
	tMonth = doHandleMonth(tMonth + 1);
	tDate = doHandleMonth(tDate);
	return tYear + "/" + tMonth + "/" + tDate;
}
function doHandleMonth(month) {
	var m = month;
	if (month.toString().length == 1) {
		m = "0" + month;
	}
	return m;
}

/** ************************遮盖**start********************** */
// 显示遮盖
function showmask() {
	$("#mask").empty();
	var maskstr = "<div class='theme-popover'><div class='theme-popbod dform'>数据正在加载中，请稍后...</div></div>";
	$("#mask").append(maskstr);
	$('.theme-popover-mask').fadeIn(100);
	$('.theme-popover').slideDown(200);
}
// 隐藏遮盖
function hidemask() {
	$('.theme-popover-mask').fadeOut(100);
	$('.theme-popover').slideUp(200);
}
/** ************************遮盖**end********************** */

/** ************************Uploadify文档上传**start********************** */
// 初始化上传组件
function doInitUploadify() {
	$('#file_upload').uploadify({
		'auto' : false,// 关闭自动上传
		'swf' : '/acwsui/js/jquery/uploadify/uploadify.swf',
		'uploader' : '/acws.file_uploadify',
		// 'method' : 'post',// 方法，服务端可以用$_POST数组获取数据
		'debug' : false,
		'buttonText' : '<i class="fa fa-plus"></i>数据导入',// 设置按钮文本
		'multi' : true,// 允许同时上传多张图片
		'uploadLimit' : 10,// 一次最多只允许上传10张图片
		'fileTypeDesc' : 'Data Files',// 只允许上传图像
		'fileTypeExts' : '*.txt; *.xlsx; *.csv;*.xls',// 限制允许上传的后缀
		'fileSizeLimit' : '20000KB',// 限制上传的图片不得超过200KB
		'onQueueComplete' : onQueueComplete,
		'onSelect' : onSelect,
		'onClearQueue' : onClearQueue
	// 上传队列全部完成后执行的回调函数
	});
}

// word导出
function exportWord_(json) {
	var par;
	par = JSON.stringify(json);
	par = encodeURI(encodeURI(par));
	console.info(par);
	document.getElementById("fileDownIFrame").src = "/acws.wordExport?par="
			+ par;
}

// 显示/隐藏菜单
function nav_() {
	if ($("#nav-list").css('display') == 'none') {
		$('#nav-list').show(200);
	} else {
		$('#nav-list').hide(200);
	}
}

function showdatetimepicker_() {
	$('#datetime').datetimepicker('show');
}

function showenddate_() {
	$('#endtime').datetimepicker('show');
}