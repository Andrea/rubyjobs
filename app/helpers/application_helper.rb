# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def param_present?(param_name)
    params[param_name] && !params[param_name].blank?
  end
end
