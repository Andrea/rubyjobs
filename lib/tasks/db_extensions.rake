namespace :db do

  desc 'Drops, then recreates and carries out migrations on your database.' 
  task :clean => ['db:drop', 'db:create', 'db:migrate']

  desc "Populate development database with some records to get you up and running."
  task(:seed => :environment) do
    Rake::Task['db:clean'].invoke 

    ['Home', 'Dublin', 'Limerick', 'Cork'].each {|name| Location.create(:name => name) }
    ['Contract', 'Permanent', 'Other'].each {|name| Type.create(:name => name) }

    Job.create(:title => 'Merb Developer',
      :company_name => 'Titus Inc.', :company_website => 'titusonmerb.com',
      :company_email =>'info@testtitus.com', :location_id => Location.all[0], :type_id => 1,
      :how_to_apply => 'Email',
      :description => 'Super job for the right person.')

    Job.create(:title => 'Rails Developer',
      :company_name => 'Peter Consulting', :company_website => 'peteronmerb.com',
      :company_email =>'info@testpeter.com', :location_id => Location.all[1], :type_id => 1,
      :how_to_apply => 'Application Form',
      :description => 'Needs 1 year of development experience.')

  end
end
