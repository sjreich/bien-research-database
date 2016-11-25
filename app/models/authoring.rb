class Authoring < ActiveRecord::Base
  belongs_to :author
  belongs_to :work
end
