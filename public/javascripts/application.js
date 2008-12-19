$(document).ajaxSend(function(event, request, settings) {
	if (typeof(window.AUTH_TOKEN) == "undefined") return;
	settings.data = settings.data || "";
	settings.data += (settings.data ? "&" : "") + "authenticity_token=" + encodeURIComponent(window.AUTH_TOKEN);
});

jQuery.ajaxSetup({
	'beforeSend': function(xhr) { xhr.setRequestHeader("Accept", "text/javascript") }
});

$(function() {
	$('#search_term').delayedObserver(0.5, function(value, object) {
		$.get("/jobs", { search: value }, null, "script");
	});
});