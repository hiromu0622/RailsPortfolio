class Topic < ApplicationRecord
    validates :user_id,     presence: true
    validates :description, presence: true
    validates :image,       presence: true
    validates :prefecture,  presence: true
    validates :title,       presence: true

    belongs_to :user
    has_many :favorites
    has_many :favorite_users, through: :favorites, source: 'user'
    has_many :comments

    mount_uploader :image, ImageUploader
end
