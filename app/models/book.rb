class Book < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :reviews
  default_scope -> { order('title ASC') }
  validates :user_id, presence: true
  has_one_attached :image
end