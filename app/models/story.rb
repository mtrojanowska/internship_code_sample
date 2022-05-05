class Story < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :writer
  has_and_belongs_to_many :categories
  has_many :comments
  has_many :likes, as: :likeable

  validates :title, presence: true
  validates :content, presence: true, length: {minimum: 2000}

  has_attached_file :image, styles: { large: "600x600", medium: "300x300>", thumb: "150x150>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/


end
