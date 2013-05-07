class User < ActiveRecord::Base
  attr_accessible :name, :team_id
  validates :name, :presence => true, length: { maximum: 20 }

  belongs_to :team
  has_many :polls
  has_many :question_answers
end