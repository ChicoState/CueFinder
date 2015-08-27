class Order < ActiveRecord::Base
  #belongs_to :questions, :polymorphic => true
  belongs_to :finders
  belongs_to :mc_questions

  validates_uniqueness_of :orderable
end
