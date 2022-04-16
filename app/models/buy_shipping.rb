class BuyShipping
  include ActiveModel::Module
  attr_accessor :user_id, :item_id, :postcode, :prefecture_id, :city,
                :block, :building, :tel, :buy_id, :token

  with_options presence: true do
    validates :prefecture_id
    validates :city
    validates :block
    validates :building
    validates :tel, numericality: { only_integer: true, }, length: { minimum: 10, maximum: 11 }
    validates :token
  end

  VALID_POSTCODE_REGEX = /\A\d{3}[-]\d{4}\z/
  validates :postcode, presence: true, format: { with: VALID_POSTCODE_REGEX }

  def save
    buy_shipping = BuyShipping.create(user_id: user_id, item_id: item_id)
    Shipping.create(postcode: postcode, prefecture_id: prefecture_id, city: city, block: block, building: building, tel: tel, buy_shipping_id: buy_shipping.id)
  end

end