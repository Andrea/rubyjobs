class SeedForDevelopment < ActiveRecord::Migration

  # This is a simple migration to seed the development database
  # during the early stages of development. It is probably better off as a rake
  # task however for now it should do here
  @@locations = ['Dublin', 'Limerick', 'Cork']
  @@types= ['Developer', 'Tester']
  @@jobs = ['Merb Developer', 'Rails Developer']
    
  def self.up

    @@locations.each {|name| Location.create(:name => name) }
   
    @@types.each {|name| Type.create(:name => name) }
    
    Job.create(:title => @@jobs[0],
      :company_name => 'Titus', :company_website => 'titusonmerb.com',
      :company_email =>'info@testtitus.com', :location_id => 1, :type_id => 1,
      :how_to_apply => 'Email', 
      :description => 'Super job for the right person.')
    
    Job.create(:title => @@jobs[1],
      :company_name => 'Peter', :company_website => 'peteronmerb.com',
      :company_email =>'info@testpeter.com', :location_id => 2, :type_id => 1,
      :how_to_apply => 'Application Form', 
      :description => 'Needs 1 year of development experience.')
  end

  def self.down
    @@types.each{|name| Type.destroy_all(:name => name)}
    @@locations.each{|name| Location.destroy_all(:name => name)}
    @@jobs.each{|title| Job.destroy_all(:title => title)}
  end
end
