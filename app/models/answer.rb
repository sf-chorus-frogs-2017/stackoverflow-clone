class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  has_many :votes, as: :voteable
  has_many :comments, as: :commentable

  def get_total_votes
    self.votes.sum(:vote_value)
  end
end
