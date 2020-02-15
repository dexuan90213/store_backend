class Product < ApplicationRecord
  acts_as_paranoid

  has_many_attached :images

  belongs_to :manager
end
