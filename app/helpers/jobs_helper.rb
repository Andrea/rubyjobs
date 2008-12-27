module JobsHelper
  def rss_link_attributes
    (params[:search] && !params[:search].empty?) ? {:search=>"#{params[:search]}"} : {}
  end
end
