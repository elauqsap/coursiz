class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
    	t.string :name
    	t.string :real_name
      t.timestamps
    end
  end
end
