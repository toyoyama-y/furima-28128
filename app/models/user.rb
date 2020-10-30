class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  PASSWORD_REGIX =/\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,100}+\z/i
  validates_format_of :password, with: PASSWORD_REGIX,
            message: "に半角英字と半角数字の両方を含めて設定してください"

  validates :nick_name, presence: true
  validates :email, presence: true

  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: 'は全角文字を使用してください' } do
  validates :family_name
  validates :first_name
  end

with_options presence: true, format: { with: /\A[ァ-ン]+\z/, message: 'はカタカナを使用してください' } do
  validates :family_name_kana
  validates :first_name_kana
end

  validates :birth_day, presence: true

end
