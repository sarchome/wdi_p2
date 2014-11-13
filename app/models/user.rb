class User
    include Mongoid::Document
    include ActiveModel::SecurePassword
    has_secure_password
    field :email, type: String
    field :first_name, type: String
    field :last_name, type: String
    field :phone, type: String
    field :password_digest, type: String
    field :is_admin, type: Boolean, default: false
    field :is_restaurant , type: Boolean, default: false

    has_many :orders, autosave: true
  end
