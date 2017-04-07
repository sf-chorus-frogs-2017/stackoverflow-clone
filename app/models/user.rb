class User < ActiveRecord::Base
  include BCrypt

  has_many :questions
  has_many :answers
  has_many :votes_made, class_name: :vote

  validates :display_name, :email, :password_hash, presence: true
  validates :display_name, :email, uniqueness: true

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def authenticate(login_email, login_password)
    self.email == login_email && self.password == login_password
  end

end
