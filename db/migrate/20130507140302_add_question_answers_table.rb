class AddQuestionAnswersTable < ActiveRecord::Migration
  def change
    create_table :question_answers do |t|
      t.integer :user_id
      t.integer :answer_id

      t.timestamps
    end
  end
end
