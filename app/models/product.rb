class Product < ApplicationRecord
  belongs_to :category, optional: true
  belongs_to :user, optional: true

  validates :name, presence: true

  has_one_attached :photo
end
