class Order < ActiveRecord::Base
  belongs_to :timeline, :polymorphic => true
  validates_uniqueness_of :order
end
