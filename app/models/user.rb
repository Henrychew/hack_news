class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many :posts
  has_many :comments
  has_many :comment_votes
  has_many :post_votes

  def self.combine_birthdate(day,month,year)
    "#{day} #{month} #{year}"
  end
end
