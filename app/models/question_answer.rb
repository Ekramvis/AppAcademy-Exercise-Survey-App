class QuestionAnswer < ActiveRecord::Base
  attr_accessible :user_id, :answer_id

  validates :user_id, :presence => true
  validates :answer_id, :presence => true

  validate :unique_qa
  validate :own_question
  validate :team_restricted

  belongs_to :user
  belongs_to :answer

  has_one :question, :through => :answer
  has_one :poll, :through => :question

  after_destroy :log_destroy_action

  def log_destroy_action
    puts 'QuestionAnswer destroyed'
  end

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

  def response_count
    QuestionAnswer.where(:answer_id => self.answer_id).count
  end

  def team_restricted
    poll_team_id = self.question.poll.team_id
    if poll_team_id != self.user.team_id && !poll_team_id.nil?
      errors.add(:user_id, "Poll is restricted.")
    end
  end
end