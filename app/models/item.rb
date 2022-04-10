class Item < ApplicationRecord
  belongs_to :user
  has_one :buy
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :delivery_cahrge
  belongs_to :delivery_date
  belongs_to :prefecture
  belongs_to :product_condition

  with_options numericality: { other_than: 1 , message: "can't be blank" } do
    validates :category_id
    validates :delivery_charge_id
    validates :delivery_date_id
    validates :prefecture_id
    validates :product_condition_id
  end 

  with_options format: { with: /\A[0-9]+\z/ } do
    validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
               presence: { message: "can't be blank" }
  end
end
