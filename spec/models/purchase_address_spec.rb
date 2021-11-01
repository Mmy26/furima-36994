require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do

  before do
    @purchase_address = FactoryBot.build(:purchase_address)
  end

  describe '配送先情報' do
    context '内容に問題がない場合' do
      it '全ての配送先情報を正しく入力すれば購入できる' do
        expect(@purchase_address).to be_valid
      end
      it '建物が空でも購入できる' do
        @purchase_address.building = ''
        @purchase_address.valid?
        expect(@purchase_address).to be_valid
      end
     end
    context '内容に問題がある場合' do
      it '郵便番号が空では購入できない' do
        @purchase_address.zip_code = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Zip code can't be blank")
      end
      it '都道府県が空では購入できない' do
        @purchase_address.region_id = 1
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Region can't be blank")
      end
      it '市区町村が空では購入できない' do
        @purchase_address.city = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空では購入できない' do
        @purchase_address.street = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Street can't be blank")
      end
      it '電話番号が空では購入できない' do
        @purchase_address.phone_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it '郵便番号が前3桁-後4桁でなければ購入できない' do
        @purchase_address.zip_code = '1111-111'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Zip code is invalid. Enter it as follows (e.g. 123-4567)")
      end
      it '郵便番号が半角数字でなければ購入できない' do
        @purchase_address.zip_code = 'aaa-aaaa'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Zip code is invalid. Enter it as follows (e.g. 123-4567)")
      end
      it '電話番号が９桁以下では購入できない' do
        @purchase_address.phone_number = '111111111'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number is too short")
      end
      it '電話番号が半角数字でなければ購入できない' do
        @purchase_address.phone_number = 'aaaaaaaaaa'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number is invalid. Input only number")
      end
      it 'カード情報がなければなければ購入できない' do
        @purchase_address.token = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end