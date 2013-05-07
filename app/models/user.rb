class User < ActiveRecord::Base
  attr_accessible :name, :team_id
  validates :name, :presence => true, length: { maximum: 20 }

  belongs_to :team
  has_many :polls
  has_many :questions_created, :through => :polls, :source => :questions


  has_many :question_answers

  has_many :questions_answered, :through => :question_answers, :source => :question
end