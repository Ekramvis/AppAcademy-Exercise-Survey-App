class AnswerIdToIndexQuestionAnswers < ActiveRecord::Migration
  def change
  	add_index :question_answers, :answer_id
  end
end
