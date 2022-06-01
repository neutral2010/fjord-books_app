# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :icon
  validate :icon_type

  private

  def icon_type
    errors.add(:icon, :image_upload) unless icon.blob.content_type.in?(%('image/jpeg image/jpg image/png'))
  end
end
