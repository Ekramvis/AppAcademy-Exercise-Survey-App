class Team < ActiveRecord::Base
  attr_accessible :name

  validates :name, presence: true, length: { :maximum => 20 }

  has_many :users, :dependent => :nullify
end