class Review < ApplicationRecord
  belongs_to :item

  validates :first_name, presence: true
  validates :email, presence: true,
            format: { with: URI::MailTo::EMAIL_REGEXP, message: "is invalid" }

  def user_name
    return "#{first_name} #{last_name[0]}." if last_name.present?

    first_name
  end
end
