class CreateQuizzes < ActiveRecord::Migration
  def change
    create_table :quizzes do |t|
    	t.references 	:category
        t.string        :category_name
        t.integer       :difficulty
    	t.integer 		:question_number
    	t.text		    :question
    	t.text		    :answer
    	t.text		    :false_1
    	t.text		    :false_2
    	t.text		    :false_3

    	t.timestamps
    end
  end
end
