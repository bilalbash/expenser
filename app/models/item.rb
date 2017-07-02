class Item < ApplicationRecord
  belongs_to :category
  has_many :line_items, dependent: :destroy

  validates :name, presence: true
end
