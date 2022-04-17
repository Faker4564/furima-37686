class BuyShipping
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postcode, :prefecture_id, :city, :block, :building, :tel

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :block
    validates :tel, numericality: { only_integer: true, }, length: { minimum: 10, maximum: 11 }
    #validates :token
  end

  VALID_POSTCODE_REGEX = /\A\d{3}[-]\d{4}\z/
  validates :postcode, presence: true, format: { with: VALID_POSTCODE_REGEX }

  def save
    buy = Buy.create(user_id: user_id, item_id: item_id)
    Shipping.create(postcode: postcode, prefecture_id: prefecture_id, city: city, block: block, building: building, tel: tel, buy_id: buy.id)
  end

end