require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#item' do
    before do
      @item = FactoryBot.build(:item)
    end

    it '必須項目を全て入力して入れば保存できること' do
      expect(@item).to be_valid
    end

    it '画像(image)が空だと保存できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it '商品名(name)が空だと保存できない' do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it '商品名(name)が41文字以上だと保存できない' do
      @item.name = Faker::Name.initials(number: 41)
      @item.valid?
      expect(@item.errors.full_messages).to include("Name is too long (maximum is 40 characters)")
    end

    it '商品の説明(text)が空だと保存できない' do
      @item.text = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Text can't be blank")
    end

    it '商品の説明(text)が1001文字以上だと保存できない' do
      @item.text = Faker::Name.initials(number: 1001)
      @item.valid?
      expect(@item.errors.full_messages).to include("Text is too long (maximum is 1000 characters)")
    end

    it 'カテゴリー(category)が空だと保存できない' do
      @item.category = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end

    it '状態(status)が空だと保存できない' do
      @item.status = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Status can't be blank")
    end

    it '配送料(shipping_fee)が空だと保存できない' do
      @item.shipping_fee = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping fee can't be blank", "Shipping fee 選択肢を選んでください")
    end

    it '配送元の地域(area)が空だと保存できない' do
      @item.area = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Area can't be blank")
    end

    it '発送までに日数(day)が空だと保存できない' do
      @item.day = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Day can't be blank")
    end

    it '価格の範囲が¥300~¥9,999,999の間であること' do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
    end

    it '販売価格は半角英数字のみ保存可能であること' do
      @item.price = "１２３４５６"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end

  end

end
