class Comment < ApplicationRecord
  belongs_to :writer
  belongs_to :story
  has_many :likes, as: :likeable, dependent: :destroy
  validates :content, presence: true
end
