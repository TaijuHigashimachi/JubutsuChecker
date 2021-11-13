# Schema Information
#
# Table name: cursed_item_objective_names
#
# cursed_item_id     :integer
# object_name_id     :integer
#

class CursedItemObjectiveName < ApplicationRecord
  belongs_to :cursed_item
  belongs_to :object_name

  validates :cursed_item_id, presence: :true
  validates :object_name_id, presence: :true
end
