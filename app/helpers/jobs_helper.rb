module JobsHelper
  def rss_link_attributes
    param_present?(:search) ? {:search => "#{params[:search]}"} : {}
  end
end
