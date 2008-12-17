namespace :db do

  desc 'Drops, then recreates and carries out migrations on your database.' 
  task :clean => ['db:drop', 'db:create', 'db:migrate']

  desc "Populate development database with some records to get you up and running."
  task(:seed => :environment) do
    Rake::Task['db:clean'].invoke 

    ['Work from home', 'Dublin', 'Limerick', 'Cork'].each {|name| Location.create(:name => name) }
    ['Contract', 'Permanent', 'Other'].each {|name| Type.create(:name => name) }

    Job.create(:title => 'Merb Developer',
      :company_name => 'Titus Inc.', :company_website => 'titusonmerb.com',
      :company_email =>'info@testtitus.com', :location_id => Location.all[0].id, :type_id => 1,
      :how_to_apply => 'Email us at jobs [at] testtitus [dot] com',
      :description => 'Super job for the right person.')

    Job.create(:title => 'Rails Developer',
      :company_name => 'Peter Consulting', :company_website => 'peteronmerb.com',
      :company_email =>'info@testpeter.com', :location_id => Location.all[1].id, :type_id => 1,
      :how_to_apply => 'Fill out the pplication form on our website',
      :description => 'Needs 1 year of development experience.')

			1.upto(30) do |i|
				Job.create(:title => "Another Job #{i}",
		  		:company_name => "Company #{i}", :company_website => 'somewebsite.com',
		      :company_email =>'info@somewebsite.com', :location_id => Location.all[1], :type_id => 2,
		      :how_to_apply => "Call us on 01-123456#{i}",
		      :description => 'Some description here', :created_at => (i*1.5).days.ago)
			end
  end
end
