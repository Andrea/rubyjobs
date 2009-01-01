class AddActionKeyToJobs < ActiveRecord::Migration
	def self.up
		add_column :jobs, :action_key, :string
	end

	def self.down
		remove_column :jobs, :action_key
	end
end