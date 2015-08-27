class Finder < ActiveRecord::Base
  has_many :orders, :as => :timeline
  has_and_belongs_to_many :items
end
