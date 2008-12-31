module JobsHelper
  def rss_link_attributes
    param_present?(:search) ? {:search => "#{params[:search]}"} : {}
  end
  
  def param_present?(param_name)
    params[param_name] && !params[param_name].blank?
  end
end
