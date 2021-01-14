class Guru < ApplicationRecord
  mount_uploader :guru_photo, GuruPhotoUploader

scope :latest, -> {order created_at: :desc }
end
