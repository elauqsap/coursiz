class CreateQuizzes < ActiveRecord::Migration
  def change
    create_table :quizzes do |t|
    	t.integer 	:difficulty
    	t.string	:question
    	t.string	:answer
    	t.string	:false_1
    	t.string	:false_2
    	t.string	:false_3

    	t.timestamps
    end
  end
end
