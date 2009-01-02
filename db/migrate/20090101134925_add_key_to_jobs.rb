class AddKeyToJobs < ActiveRecord::Migration
	def self.up
		add_column :jobs, :key, :string
	end

	def self.down
		remove_column :jobs, :key
	end
end