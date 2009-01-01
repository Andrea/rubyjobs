require File.dirname(__FILE__) + '/../spec_helper'
require File.dirname(__FILE__) + '/../factory'
include Factory

describe Job do
	describe "when creating a job" do
		it "should have an action_key" do
			@job = Factory.create_job
			@job.action_key.should_not be_nil
		end
		
		it "should have a unique action_key" do
			@job1 = Factory.create_job
			@job2 = Factory.create_job
			@job1.action_key.should_not == @job2.action_key
		end
	end
	
	describe "when saving a job" do
		it "the action_key should be the same as before the save" do
			@job1 = Factory.create_job
			pre_save_action_key = @job1.action_key
			@job1.save!
			@job1.action_key.should == pre_save_action_key
		end
	end
	
	describe "validations" do
		it "should be valid with valid attributes" do
			@job = Factory.create_job
			@job.should be_valid
		end
		
		it "should ensure that a company_name is provided" do
			@job = Factory.new_job(:company_name => nil)
			@job.should_not be_valid
			@job.errors.on(:company_name).should_not be_nil
		end
		
		it "should ensure that a company_email is provided" do
			@job = Factory.new_job(:company_email => nil)
			@job.should_not be_valid
			@job.errors.on(:company_email).should_not be_nil
		end

		it "should ensure that company_email is a valid email" do
			@job = Factory.new_job(:company_email => 'invalid@email')
			@job.should_not be_valid
			@job.errors.on(:company_email).should_not be_nil
		end

		it "should ensure that a type_id is provided" do
			@job = Factory.new_job(:type_id => nil)
			@job.should_not be_valid
			@job.errors.on(:type_id).should_not be_nil
		end

		it "should ensure that a location_id is provided" do
			@job = Factory.new_job(:location_id => nil)
			@job.should_not be_valid
			@job.errors.on(:location_id).should_not be_nil
		end

		it "should ensure that a title is provided" do
			@job = Factory.new_job(:title => nil)
			@job.should_not be_valid
			@job.errors.on(:title).should_not be_nil
		end

		it "should ensure that a description is provided" do
			@job = Factory.new_job(:description => nil)
			@job.should_not be_valid
			@job.errors.on(:description).should_not be_nil
		end

		it "should ensure that a how_to_apply is provided" do
			@job = Factory.new_job(:how_to_apply => nil)
			@job.should_not be_valid
			@job.errors.on(:how_to_apply).should_not be_nil
		end
	end

	describe "searching" do
		it "should be searchable" do
			Job.should respond_to(:search_for)
		end
		
		it "should search the company_name" do
			Job.search_for('google').length.should == 0
			Factory.create_job(:company_name => 'Google')
			Job.search_for('google').length.should == 1
		end
		
		it "should search the title" do
			Job.search_for('contract').length.should == 0
			Factory.create_job(:title => 'Developer needed (contract)')
			Job.search_for('contract').length.should == 1
		end
		
		it "should search the description" do
			Job.search_for('june 2009').length.should == 0
			Factory.create_job(:description => 'This job starts in June 2009')
			Job.search_for('june 2009').length.should == 1
		end
		
		it "should search the how_to_apply" do
			Job.search_for('jobs@acme.org').length.should == 0
			Factory.create_job(:how_to_apply => 'email us - jobs@acme.org')
			Job.search_for('jobs@acme.org').length.should == 1
		end
		
		it "should search the location" do
			Job.search_for('dublin').length.should == 0
			location = Factory.create_location(:name => 'Dublin')
			Factory.create_job(:location_id => location.id)
			Job.search_for('dublin').length.should == 1
		end
		
		it "should search the type" do
			Job.search_for('permanent').length.should == 0
			type = Factory.create_type(:name => 'Permanent')
			Factory.create_job(:type_id => type.id)
			Job.search_for('permanent').length.should == 1
		end
	end
end
