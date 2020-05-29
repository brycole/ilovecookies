class Category < ApplicationRecord
  has_many :subcategories, class_name: "Category", foreign_key: "category_id"
  belongs_to :category, class_name: "Category", optional: true

  validates :name, presence: true
end
