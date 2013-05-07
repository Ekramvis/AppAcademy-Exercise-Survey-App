class Question < ActiveRecord::Base
  attr_accessible :text, :poll_id
  validates :text, presence: true, length: { maximum: 500 }
  validates :poll_id, presence: true

  belongs_to :poll
  has_many :answers
end