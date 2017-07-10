class LineItem < ApplicationRecord
  belongs_to :category
  belongs_to :item

  validates :purchase_date, :price, presence: true

  before_create :save_purchase_info

  def save_purchase_info
    self.purchase_month = self.purchase_date.month
    self.purchase_week = self.week_number
  end

  def week_number
    day = self.purchase_date.day
    if (day >= 1 && day <= 7)
      return 1
    elsif (day >= 8 && day <= 14)
      return 2
    elsif (day >= 15 && day <= 21)
      return 3
    elsif (day >= 22 && day <= 28)
      return 4
    elsif (day >= 29)
      return 5
    end
    return 0 # means error
  end
end
