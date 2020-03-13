class Topic < ApplicationRecord
    validates :user_id,     presence: true
    validates :description, presence: true
    validates :image,       presence: true
    validates :prefecture,  presence: true

    belongs_to :user
    mount_uploader :image, ImageUploader
end
