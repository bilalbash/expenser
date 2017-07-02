FactoryGirl.define do
  factory :line_item do
    price 1
    item_name "MyString"
    category_name "MyString"
    category nil
    item nil
    quantity_type "MyString"
    quantity_count "MyString"
  end
end
