class Order < ActiveRecord::Base
  #belongs_to :question, :polymorphic => true
  belongs_to :finder
  belongs_to :mc_question

  validates_uniqueness_of :orderable
end
