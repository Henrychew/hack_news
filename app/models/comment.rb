class Comment < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :parent_comment, class_name: "Comment", foreign_key: :parent_id
  belongs_to :user
  belongs_to :post

  # def parent_comment
  #   Comment.find(parent_id)
  # end
end
