class User < ApplicationRecord

  has_secure_password

  validates :password_confirmation, presence: true, if: -> { password.present? }

end
