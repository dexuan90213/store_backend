class Product < ApplicationRecord
  acts_as_paranoid

  has_many_attached :images
  belongs_to :manager

  has_many :skus
  accepts_nested_attributes_for :skus, reject_if: :all_blank, allow_destroy: true
end
