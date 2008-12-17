$('#job_list').html('<%= escape_javascript(render(:partial => @jobs)) %>');

//	TODO: update the title
//	TODO: update the rss link