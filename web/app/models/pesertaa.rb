class Pesertaa < ApplicationRecord
  include BCrypt

  def valid_password?(password)
      BCrypt::Password.new(self.pesertaa_password) == password.to_s
  end

  mount_uploader :pesertaa_photo, PhotopesertaUploader
end
