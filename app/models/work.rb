class Work < ActiveRecord::Base
  has_many :authorings, dependent: :destroy
  has_many :authors, through: :authorings
end
