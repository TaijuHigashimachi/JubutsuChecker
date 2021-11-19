# Schema Information
#
# Table name: label_names
#
# name           :string
#

class LabelName < ApplicationRecord
  has_many :labelings, dependent: :destroy
  has_many :cursed_items, through: :labelings

  validates :name, presence: true
end
