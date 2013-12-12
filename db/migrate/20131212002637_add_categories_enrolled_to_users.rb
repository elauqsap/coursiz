class AddCategoriesEnrolledToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :categories_enrolled, :string
  end
end
