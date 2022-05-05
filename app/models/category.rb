class Category < ApplicationRecord
  has_and_belongs_to_many :stories, dependent: :destroy
  validates :name, presence: true, uniqueness: true
end
