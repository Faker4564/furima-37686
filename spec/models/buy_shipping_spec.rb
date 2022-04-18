require 'rails_helper'

RSpec.describe BuyShipping, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @buy_shipping = FactoryBot.build(:buy_shipping, user_id: user.id, item_id: item.id)
  end
  describe '配送先情報登録'
    context '配送先情報を登録できるとき' do
      it 'postcodeとprefecture_idとcityとblockとtelとtokenがあれば登録できる' do
        expect(@buy_shipping).to be_valid
      end
      it 'buildingがなくても登録できる' do
        @buy_shipping.building = ''
        expect(@buy_shipping).to be_valid
      end
    end

    context '配送先情報を登録できないとき' do
      it 'postcodeが空では登録できない' do
        @buy_shipping.postcode = ''
        @buy_shipping.valid?
        expect(@buy_shipping.errors.full_messages).to include("Postcode can't be blank", "Postcode is invalid")
      end
      it 'prefecture_idが---では登録できない' do
        @buy_shipping.prefecture_id = 1
        @buy_shipping.valid?
        expect(@buy_shipping.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空では登録できない' do
        @buy_shipping.city = ''
        @buy_shipping.valid?
        expect(@buy_shipping.errors.full_messages).to include("City can't be blank")
      end
      it 'blockが空では登録できない' do
        @buy_shipping.block = ''
        @buy_shipping.valid?
        expect(@buy_shipping.errors.full_messages).to include("Block can't be blank")
      end
      it 'telが空では登録できない' do
        @buy_shipping.tel = ''
        @buy_shipping.valid?
        expect(@buy_shipping.errors.full_messages).to include("Tel can't be blank")
      end
      it 'postcodeは「3桁-4桁」の半角文字列以外は登録できない' do
        @buy_shipping.postcode = 1234567
        @buy_shipping.valid?
        expect(@buy_shipping.errors.full_messages).to include("Postcode is invalid")
      end
      it 'telは10桁か11桁以外は登録できない' do
        @buy_shipping.tel = '090123456'
        @buy_shipping.valid?
        expect(@buy_shipping.errors.full_messages).to include("Tel is too short (minimum is 10 characters)")
      end
      it 'telは半角数値以外は登録できない' do
        @buy_shipping.tel = '090-1234-5678'
        @buy_shipping.valid?
        expect(@buy_shipping.errors.full_messages).to include("Tel is not a number", "Tel is too long (maximum is 11 characters)")
      end
      it 'userが紐づいていなければ購入できない' do
        @buy_shipping.user_id = ''
        @buy_shipping.valid?
        expect(@buy_shipping.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐づいていなければ購入できない' do
        @buy_shipping.item_id = ''
        @buy_shipping.valid?
        expect(@buy_shipping.errors.full_messages).to include("Item can't be blank")
      end
      it 'tokenが空では登録できない' do
        @buy_shipping.token = ''
        @buy_shipping.valid?
        expect(@buy_shipping.errors.full_messages).to include("Token can't be blank")
      end
    end


end