class Item < ApplicationRecord
  belongs_to :user
  has_one :buy
  has_one_attached :image
end
