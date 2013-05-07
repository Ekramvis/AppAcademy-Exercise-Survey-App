class Answer < ActiveRecord::Base
  attr_accessible :text, :question_id
  validates :text, presence: true, length: { maximum: 500 }
  validates :question_id, presence: true

  belongs_to :question
  has_many :question_answers, :dependent => :destroy

  after_destroy :log_destroy_action

  def log_destroy_action
    puts 'Answer destroyed'
  end
end