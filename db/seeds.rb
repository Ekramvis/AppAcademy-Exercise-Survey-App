# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

ActiveRecord::Base.transaction do
  t1 = Team.create!(
    name: 'AppSquad'
  )

  t2 = Team.create!(
    name: 'Blue'
  )

  u1 = User.create!(
    :name => 'Nikias'
  )

  u2 = User.create!(
    :name => 'Angelo',
    :team_id => 1
  )

  u3 = User.create!(
    :name => 'Jonathan',
    :team_id => 1
  )

  u4 = User.create!(
    :name => 'Kush',
    :team_id => 2
  )

  poll1 = Poll.create!(
    name: 'Best Car',
    user_id: 1,
    team_id: 1
  )

  question1 = Question.create!(
    text: 'What\'s the best car?',
    poll_id: 1
  )

  answer1 = Answer.create!(
    text: 'Ferrari',
    question_id: 1
  )

  answer2 = Answer.create!(
    text: 'Lambo',
    question_id: 1
  )

  qa_for_u2 = QuestionAnswer.create!(
    answer_id: 1,
    user_id: 2
  )

  qa_for_u3 = QuestionAnswer.create!(
    answer_id: 1,
    user_id: 3
  )
end