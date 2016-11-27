class User
  include Mongoid::Document
  include ActiveModel::SecurePassword

  field :email, type: String
  field :password, type: String
  field :password_digest, type: String
  field :created_at, type: DateTime, default: Time.now
  field :updated_at, type: DateTime, default: Time.now

  has_secure_password

  has_many :switches
end
