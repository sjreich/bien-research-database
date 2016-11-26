class Work < ActiveRecord::Base
  has_many :authorings, dependent: :destroy
  has_many :authors, through: :authorings

  def author_string
    authors.map(&:to_s).join(', ')
  end
end
