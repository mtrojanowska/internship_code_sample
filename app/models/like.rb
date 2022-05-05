class Like < ApplicationRecord
  belongs_to :likeable, polymorphic: true
  validates :writer_id, uniqueness: {scope: [:likeable_id, :likeable_type]}
end
