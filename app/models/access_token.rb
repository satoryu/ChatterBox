class AccessToken < ApplicationRecord
  belongs_to :user

  validates :token, presence: true
  validates :secret, presence: true
  validates :provider, presence: true
end
