class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers
  has_many :comments, as: :commentable
  has_many :votes, as: :voteable

  validates :title, :body, presence: true
  validates :title, length: { in: (15...80) }
  validates :body, length: { in: (50..4000) }

  def get_total_votes
    self.votes.count
  end

  def get_total_answers
    self.answers.count
  end

end
