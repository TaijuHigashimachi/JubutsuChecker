# Schema Information
#
# Table name: labelings
#
# cursed_item_id     :integer
# label_name_id     :integer
#

class Labeling < ApplicationRecord
  belongs_to :cursed_item
  belongs_to :label_name

  validates :label_name_id, presence: true
end
