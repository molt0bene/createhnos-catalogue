class Review < ApplicationRecord
  belongs_to :item

  def user_name
    return "#{first_name} #{last_name[0]}." if last_name.present?

    first_name
  end
end
