class Selection < ActiveRecord::Base
  belongs_to :items
  belongs_to :finders
  belongs_to :users
end
