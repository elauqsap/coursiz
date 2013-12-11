class CreateAdminTasks < ActiveRecord::Migration
  def change
    create_table :admin_tasks do |t|
      t.references 	:user
      t.string		:request_type
      t.text		:request
      t.timestamps
    end
  end
end
