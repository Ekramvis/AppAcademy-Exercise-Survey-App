class Poll < ActiveRecord::Base
  attr_accessible :name, :user_id, :team_id
  validates :name, presence: true, length: { maximum: 20 }
  validates :user_id, presence: true

  belongs_to :user
  has_many :questions,:dependent => :destroy
end