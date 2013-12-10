class CreateAdminTasks < ActiveRecord::Migration
  def change
    create_table :admin_tasks do |t|
      t.references 	:user
      t.string		:type
      t.text		:request
      t.timestamps
    end
  end
end
