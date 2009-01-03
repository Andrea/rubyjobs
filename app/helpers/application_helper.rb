# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def param_present?(param_name)
    params[param_name] && !params[param_name].blank?
  end


  def main_nav
    jobs_list_linkable_actions = ['new','show', 'edit']

    if params[:controller] == 'jobs' and jobs_list_linkable_actions.include?(params[:action])
      jobs_list_link
    else
      new_job_link
    end
  end


  def new_job_link
    link_to('Post a new job >>', new_job_path)
  end

  
  def jobs_list_link
    link_to('<< Return to jobs list', :root)
  end
  
end
