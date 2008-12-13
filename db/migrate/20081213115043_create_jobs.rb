class CreateJobs < ActiveRecord::Migration
  def self.up
    create_table :jobs do |t|
			
			t.column :company_name,							:string, :limit => 50
			t.column :company_website,					:string, :limit => 300
			t.column :company_email,						:string, :limit => 200
			
			t.column :type_id,									:integer
			t.column :location_id,							:integer
			t.column :title,										:string, :limit => 50
			t.column :description,							:string, :limit => 1000
			t.column :how_to_apply,							:string, :limit => 100

      t.timestamps
    end
  end

  def self.down
    drop_table :jobs
  end
end
