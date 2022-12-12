class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :birth_day, presence: true
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true
  NAME_ZENKAKU = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/.freeze
  validates_format_of :last_name, with: NAME_ZENKAKU, message: 'は全角で入力して下さい。'
  validates_format_of :first_name, with: NAME_ZENKAKU, message: 'は全角で入力して下さい。'
  NAME_KATAKANA = /\A[ァ-ヶー－]+\z/.freeze
  validates_format_of :last_name_kana, with: NAME_KATAKANA, message: 'は全角カタカナで入力して下さい。'
  validates_format_of :first_name_kana, with: NAME_KATAKANA, message: 'は全角カタカナで入力して下さい。'
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'
end
