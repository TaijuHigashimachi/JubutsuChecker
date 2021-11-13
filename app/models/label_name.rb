# Schema Information
#
# Table name: label_names
#
# name           :string
#

class LabelName < ApplicationRecord
  has_many :labelings, dependent: :destroy

  validates :name, presence: :true
end
