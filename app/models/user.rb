class User < ApplicationRecord
  before_update :validate_name

def validate_name
  self.name = name_was unless name.present?
  self.email = email_was unless email.present?
  self.profile = profile_was unless profile.present?
  self.profile_photo = profile_photo_was unless profile_photo.present?
  # self.password = password_was unless password.present?
  # self.password_confirmation = password_confirmation_was unless password_confirmation.present?
end
  mount_uploader :profile_photo, ImageUploader

  validates :name, presence: true, on: :create
  validates :email, presence: true, on: :create
  # ユーザー情報編集時のバリデーション
  validates :name, length:{maximum: 10}, allow_nil: true, on: :mypage_edit_update

  has_secure_password

  has_many :topics, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_topics, through: :favorites, source: 'topic'
  has_many :comments, dependent: :destroy
  has_many :user_prefectures
end
