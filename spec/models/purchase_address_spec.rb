require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe '住所情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @purchase_address = FactoryBot.build(:purchase_address, user_id: user.id, item_id: item.id)
      sleep 0.1
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@purchase_address).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @purchase_address.building = ''
        expect(@purchase_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'user_idが空だと保存できないこと' do
        @purchase_address.user_id = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空だと保存できないこと' do
        @purchase_address.item_id = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Item can't be blank")
      end
      it 'tokenが空だと保存できないこと' do
        @purchase_address.token = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'postalが空だと保存できないこと' do
        @purchase_address.postal = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal can't be blank")
      end
      it 'postalが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @purchase_address.postal = '1234567'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Postal is invalid. Include hyphen(-)')
      end
      it 'prefecture_idは1以外でないと保存できないこと' do
        @purchase_address.prefecture_id = 1
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空だと保存できないこと' do
        @purchase_address.city = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("City can't be blank")
      end
      it 'streetが空だと保存できないこと' do
        @purchase_address.street = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Street can't be blank")
      end
      it 'telephoneが空だと保存できないこと' do
        @purchase_address.telephone = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Telephone can't be blank")
      end
      it '電話番号は、9桁以下では保存できないこと' do
        @purchase_address.telephone = '123456789'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Telephone is invalid')
      end
      it '電話番号は、12桁以上ではないと保存できないこと' do
        @purchase_address.telephone = '123456789012'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Telephone is invalid')
      end
      it '電話番号は、半角数値でないと保存できないこと' do
        @purchase_address.telephone = '１２３４５６７８９０'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Telephone is invalid')
      end
    end
  end
end
