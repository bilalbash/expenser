class Category < ApplicationRecord
  has_many :children, class_name: 'Category', foreign_key: 'parent_id'
  has_many :items
  belongs_to :parent, class_name: 'Category', required: false

  validates :name, presence: true
end
