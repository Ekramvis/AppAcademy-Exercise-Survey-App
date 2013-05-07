class QuestionAnswer < ActiveRecord::Base
  attr_accessible :user_id, :answer_id

  validates :user_id, :presence => true
  validates :answer_id, :presence => true
  validate :unique_qa
  validate :own_question

  # validates :user_id, :uniqueness => { :scope => :answer_id }

  belongs_to :user
  belongs_to :answer

  has_one :question, :through => :answer


  def unique_qa
    possible_answer_ids = self.question.answers.map { |answer| answer.id }
    answer = self.user.question_answers.where('? IN (?)', self.answer_id, possible_answer_ids)
    errors.add(:user_id, "Can't answer same question.") unless answer.empty?
  end


  def own_question
    if self.user.questions_created.include?(self.question)
      errors.add(:user_id, "Can't answer own question.")
    end
  end


end