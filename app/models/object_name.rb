# Schema Information
#
# Table name: object_names
#
# name           :string
#

class ObjectName < ApplicationRecord
  has_many :cursed_item_objective_names, dependent: :destroy

  validates :name, presence: :true
end
