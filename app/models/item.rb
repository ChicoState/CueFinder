class Item < ActiveRecord::Base
  has_attached_file :image, styles => { :thumb => "200x150" }
  has_and_belongs_to_many :finders
end
