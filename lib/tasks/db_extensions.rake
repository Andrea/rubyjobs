namespace :db do

  desc 'Drops, then recreates and carries out migrations on your database.' 
  task :clean_db => ['db:drop', 'db:create', 'db:migrate']

  desc "Populate development database with some records to get you up and running."
  task(:seed_db => :environment) do

    #TODO: DMG: Switch to using a factory, perhaps the factory module

    Rake::Task['db:clean_dev_db'].invoke 

    require 'app/models/location'

    locations = ['Dublin', 'Limerick', 'Cork']
    types= ['Developer', 'Tester']
    jobs = ['Merb Developer', 'Rails Developer']

    locations.each {|name| Location.create(:name => name) }

    types.each {|name| Type.create(:name => name) }

    Job.create(:title => jobs[0],
      :company_name => 'Titus', :company_website => 'titusonmerb.com',
      :company_email =>'info@testtitus.com', :location_id => 1, :type_id => 1,
      :how_to_apply => 'Email',
      :description => 'Super job for the right person.')

    Job.create(:title => jobs[1],
      :company_name => 'Peter', :company_website => 'peteronmerb.com',
      :company_email =>'info@testpeter.com', :location_id => 2, :type_id => 1,
      :how_to_apply => 'Application Form',
      :description => 'Needs 1 year of development experience.')

  end
end
