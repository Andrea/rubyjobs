class Job < ActiveRecord::Base
	validates_presence_of :company_name, :company_email, :type_id, :title, :description, :how_to_apply
	validates_format_of :company_email, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i, :message => "Invalid email"
	
end
