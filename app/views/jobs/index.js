$('#job_list').html('<%= @jobs.any?  ? escape_javascript(render(:partial => @jobs)) : "<tr id=\"no_jobs\"><td>No jobs found!</td></tr>" %>');

<% if params[:search] && !params[:search].blank? %>
  $('#rss_link').attr('href', '<%= formatted_jobs_url(:rss, rss_link_attributes) %>' )
  $('#rss_search').html('RSS feed for \'<%= params[:search] %>\'')
<% else %>
  $('#rss_link').attr('href', '<%= formatted_jobs_url(:rss) %>' )
  $('#rss_search').html('RSS feed')
<% end %>

//	TODO: update the title
