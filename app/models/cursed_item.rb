# Schema Information
#
# Table name: cursed_items
#
# name           :string
# youtube_id     :string
#

class CursedItem < ApplicationRecord
  has_many :labelings, dependent: :destroy
  has_many :label_names, through: :labelings
  accepts_nested_attributes_for :labelings, allow_destroy: true

  validates :name, presence: true
  validates :youtube_id, presence: true
end
