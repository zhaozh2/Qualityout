var ACWS = {};
ACWS.ajax = function(url, inputData, callback, options) {
	options = options || {};
	options.url = url;
	options.type = "POST";
	options.dataType = 'json';
	options.data = "param=" + encodeURIComponent(JSON.stringify(inputData));
	options.success = function(outputData) {
		if (typeof callback == 'function') {
			callback(outputData);
		}
	};
	options.error = function(data) {
	};
	$.ajax(options);
}
