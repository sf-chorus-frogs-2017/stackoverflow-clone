require 'Faker'

User.all.destroy_all
Question.all.destroy_all
Answer.all.destroy_all
Comment.all.destroy_all
Vote.all.destroy_all

user1 = User.new(display_name: 'tom', email: 'tom@tom.com', password: 'tomtom')
user1.save!
user2 = User.new(display_name: 'tima', email: 'tima@tima.com', password: 'timatima')
user2.save!
user3 = User.new(display_name: 'g', email: 'g@g.com', password: 'gg')
user3.save!

question1 = Question.new(title: "How do i do ajax???!!!!", body: Faker::Hacker.say_something_smart, user: user1)
question1.save!

answer1 = Answer.new(body: Faker::Hacker.say_something_smart, question: question1, user: user2)
answer1.save!

question_comment1 = Comment.new(user: user2, body: Faker::Hacker.say_something_smart, commentable: question1)
question_comment1.save!
answer_comment1 = Comment.new(user: user1, body: "Thanks, you helped me out!", commentable: answer1)
answer_comment1.save!

question_vote_1 = Vote.new(user: user2, voteable: question1)
question_vote_1.save!

answer_vote_1 = Vote.new(user: user1, voteable: answer1)
answer_vote_1.save!

comment_vote_1 = Vote.new(user: user2, voteable: answer_comment1)
comment_vote_1.save!

question_vote_2 = Vote.new(user: user2, voteable: question_comment1)
question_vote_2.save!
