class Author < ActiveRecord::Base
  has_many :authorings, dependent: :destroy
  has_many :works, through: :authorings
end
