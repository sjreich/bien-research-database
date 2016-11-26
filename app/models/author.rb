class Author < ActiveRecord::Base
  has_many :authorings, dependent: :destroy
  has_many :works, through: :authorings

  def to_s
    "#{first_name} #{last_name}"
  end
end
