require 'rails_helper'

describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do

    context '新規登録がうまくいく時' do
      it "会員情報入力が全て存在すれば登録できる" do
        expect(@user).to be_valid
      end

    end

    context '新規登録がうまく行かない時' do
      it "nick_nameが空だと登録できない" do
        @user.nick_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nick name can't be blank")
      end
      it "emailが空だと登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "emailに@がない場合登録できない" do
        @user.email = 'kkk.gmail.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "passwordが空だと登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが半角英数字が混合でない場合登録できない" do
        @user.password = '000000'
        @user.password_confirmation = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password に半角英字と半角数字の両方を含めて設定してください")
      end
      it "passwordが半角英数字混合だが、字数が5文字以下であれば登録できない" do
        @user.password = 'a0000'
        @user.password_confirmation = 'a0000'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordに半角英数字がないと登録できない" do
        @user.password = 'ａ０００００'
        @user.password_confirmation = 'ａ０００００'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password に半角英字と半角数字の両方を含めて設定してください")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "family_nameが空だと登録できない" do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end
      it "family_nameが半角文字だと登録できない" do
        @user.family_name = 'tanaka'
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name は全角文字を使用してください")
      end
      it "first_nameが空だと登録できない" do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "first_nameが半角文字だと登録できない" do
        @user.first_name = 'tarou'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name は全角文字を使用してください")
      end
      it "famly_name_kanaが空だと登録できない" do
        @user.family_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana can't be blank")
      end
      it "family_name_kanaがカタカナ以外だと登録できない" do
        @user.family_name_kana = 'たなか'
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana はカタカナを使用してください")
      end
      it "first_name_kanaが空だと登録できない" do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it "first_name_kanaがカタカナ以外だと登録できない" do
        @user.first_name_kana = 'tarou'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana はカタカナを使用してください")
      end
      it "birth_dayが空だと登録できない" do
        @user.birth_day = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth day can't be blank")
      end
    end

  end
end
