class Book < ApplicationRecord
  belongs_to :user
  belongs_to :category
  default_scope -> { order('title ASC') }
  validates :user_id, presence: true
end
