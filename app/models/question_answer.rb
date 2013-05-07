class QuestionAnswer < ActiveRecord::Base
  attr_accessible :user_id, :answer_id

  validates :user_id, :presence => true
  validates :answer_id, :presence => true
  validate :unique_qa

  # validates :user_id, :uniqueness => { :scope => :answer_id }



  belongs_to :user
  belongs_to :answer

  has_one :question, :through => :answer


  def unique_qa
    QuestionAnswer.all.each do |qa_pair|
      if qa_pair.user_id == self.user_id && qa_pair.question.id == self.question.id
        return errors.add(:user_id, "cannot answer same question")
      end
    end
  end


end