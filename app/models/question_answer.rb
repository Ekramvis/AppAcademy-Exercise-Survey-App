class QuestionAnswer < ActiveRecord::Base
  attr_accessible :user_id, :answer_id

  validates :user_id, :presence => true
  validates :answer_id, :presence => true

  belongs_to :user
  belongs_to :answer
end