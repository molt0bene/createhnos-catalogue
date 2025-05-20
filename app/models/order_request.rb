class OrderRequest < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true,
            format: { with: URI::MailTo::EMAIL_REGEXP, message: "is invalid" }
  validates :phone, presence: true,
            format: { with: /\A\d{10}\z/, message: "must be 10 digits" }
end
