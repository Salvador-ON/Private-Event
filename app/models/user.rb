class User < ApplicationRecord
  before_validation :record_signup, on: :create

  def authenticated?(remember_token)
    self.remember_token == remember_token
  end

  private

  def record_signup
    token = SecureRandom.urlsafe_base64
    crypt_token = Digest::SHA1.hexdigest token.to_s
    self.remember_token = crypt_token
  end
end

