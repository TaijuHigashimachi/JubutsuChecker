# Schema Information
#
# Table name: cursed_items
#
# name           :string
# youtube_id     :string
#

class CursedItem < ApplicationRecord
  has_many :cursed_item_objective_names, dependent: :destroy
  accepts_nested_attributes_for :cursed_item_objective_names, allow_destroy: true
  has_many :object_names, through: :cursed_item_objective_names

  validates :name, presence: true
  validates :youtube_id, presence: true
end
