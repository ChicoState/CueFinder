class McQuestion < ActiveRecord::Base
  has_and_belongs_to_many :mc_choices

  def item
    Item.find_by(id: item_id)
  end
end
