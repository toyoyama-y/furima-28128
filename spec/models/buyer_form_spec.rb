require 'rails_helper'

RSpec.describe BuyerForm, type: :model do
  describe '#buyer_form' do
    before do
      @buyer_form = FactoryBot.build(:buyer_form)
    end

    it '必須項目を全て入力して入れば保存できること' do
      expect(@buyer_form).to be_valid
    end

    it '郵便番号が必須であること' do
      @buyer_form.postal_code = nil
      @buyer_form.valid?
      expect(@buyer_form.errors.full_messages).to include("Postal code can't be blank", "Postal code is invalid. Include hyphen(-)")
    end

    it '郵便番号にはハイフンが必要であること' do
      @buyer_form.postal_code = '1234567'
      @buyer_form.valid?
      expect(@buyer_form.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
    end

    it '市区町村が必須であること' do
      @buyer_form.city = nil
      @buyer_form.valid?
      expect(@buyer_form.errors.full_messages).to include("City can't be blank")
    end

    it '番地が必須であること' do
      @buyer_form.address = nil
      @buyer_form.valid?
      expect(@buyer_form.errors.full_messages).to include("Address can't be blank")
    end

    it '建物名がなくても登録できること' do
      @buyer_form.building = nil
      expect(@buyer_form).to be_valid
    end

    it '電話番号が必須であること' do
      @buyer_form.telephone = nil
      @buyer_form.valid?
      expect(@buyer_form.errors.full_messages).to include("Telephone can't be blank", "Telephone is invalid. Do not include hyphen(-)")
    end

    it '電話番号にはハイフンは不要であること' do
      @buyer_form.telephone = '090-1234-5678'
      @buyer_form.valid?
      expect(@buyer_form.errors.full_messages).to include("Telephone is invalid. Do not include hyphen(-)")
    end

    it '電話番号は11桁以内であること' do
      @buyer_form.telephone = '090123456789'
      @buyer_form.valid?
      expect(@buyer_form.errors.full_messages).to include("Telephone is invalid. Do not include hyphen(-)")
    end

    it '電話番号は数字のみであること' do
      @buyer_form.telephone = 'a09012345678'
      @buyer_form.valid?
      expect(@buyer_form.errors.full_messages).to include("Telephone is invalid. Do not include hyphen(-)")
    end

    it '都道府県の選択肢が0なら登録できないこと' do
      @buyer_form.prefecture_id = 0
      @buyer_form.valid?
      expect(@buyer_form.errors.full_messages).to include("Prefecture 選択肢を選んでください")
    end

    it 'クレジットカード情報は必須であること' do

    end

  end
end
