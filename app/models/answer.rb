class Answer < ActiveRecord::Base
  attr_accessible :text, :question_id
  validates :text, presence: true, length: { maximum: 500 }
  validates :question_id, presence: true

  belongs_to :question
  has_many :question_answers
end