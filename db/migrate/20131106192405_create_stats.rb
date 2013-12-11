class CreateStats < ActiveRecord::Migration
  def change
    create_table :stats do |t|
      t.references 	:users
      t.integer 	:c_answers
      t.integer 	:f_answers
      t.integer		:quizzes_taken
      t.integer 	:difficulty_1
      t.integer		:difficulty_2
      t.integer		:difficulty_3
      t.integer         :correct_answers_beginning
      t.integer         :correct_answers_middle
      t.integer         :correct_answers_end
      t.integer         :false_answers_beginning
      t.integer         :false_answers_middle
      t.integer         :false_answers_end

      t.timestamps
    end
  end
end
