require 'Faker'
User.all.destroy_all
Question.all.destroy_all
Answer.all.destroy_all
Comment.all.destroy_all
Vote.all.destroy_all



user1 = User.new(display_name: 'tom', email: 'tom@tom.com', password_hash: 'tomtom')
user1.save!
user2 = User.new(display_name: 'tima', email: 'tima@tima.com', password_hash: 'timatima')
user2.save!
user3 = User.new(display_name: 'g', email: 'g@g.com', password_hash: 'gg')
user3.save!

question1 = Question.new(title: Faker::Hacker.adjective, description: Faker::Hacker.say_something_smart)
question1.save!

answer1 = Answer.new(body: Faker::Hacker.say_something_smart)
answer1.save!

question_comment1 = Comment.new(user: user2, body: Faker::Hacker.say_something_smart, commentable_id: question1.id, commentable_type: 'Question')
question_comment1.save!
answer_comment1 = Comment.new(user: user1, body: "Thanks, you helped me out!", commentable_id: answer1.id, commentable_type: 'Answer')
answer_comment1.save!

question_vote_1 = Vote.new(user: user2, voteable_id: 1, voteable_type: 'Question')
question_vote_1.save!

answer_vote_1 = Vote.new(user: user1, voteable_id: 1, voteable_type: 'Answer')
answer_vote_1.save!

comment_vote_1 = Vote.new(user: user2, voteable_id: 2, voteable_type: 'Comment')
comment_vote_1.save!

# question_vote_2 = Vote.new(user: user2, voteable: question_comment1 , voteable_type: 'Comment')
# SEE IF THIS WORKS
question_vote_2 = Vote.new(user: user2, voteable: question_comment1)
question_vote_2.save!
