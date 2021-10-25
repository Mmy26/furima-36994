require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '新規作成できる場合' do
      it "全てを正しく入力すれば投稿できる" do
        expect(@item).to be_valid
      end
    end
    context '新規作成できない場合' do
      it "商品画像が空では作成できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "商品名が空では作成できない" do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end
      it "商品の説明が空では作成できない" do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it "カテゴリが空では作成できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "商品の状態が空では作成できない" do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      it "配送料が空では作成できない" do
        @item.fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Fee can't be blank")
      end
      it "発送元の地域情報が空では作成できない" do
        @item.region_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Region can't be blank")
      end
      it "発送までの日数が空では作成できない" do
        @item.shipped_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipped day can't be blank")
      end
      it "価格情報が空では作成できない" do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "価格情報が¥300から¥9,999,999まででなければ作成できない" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is Out of setting range")
      end
      it "価格情報が半角数値でなければ作成できない" do
        @item.price = '９９９９'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid. Input half-width characters")
      end
      it "価格が300円未満では作成できない" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is Out of setting range")
      end
      it "userが紐付いていなければ作成できない" do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
