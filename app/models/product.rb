class Product < ApplicationRecord
  acts_as_paranoid

  validates :name, :desc, presence: true
  validates :original_price, :sell_price, numericality: { greater_than: 0 }

  has_many_attached :images
  has_many :skus
  belongs_to :manager
  accepts_nested_attributes_for :skus, reject_if: :all_blank, allow_destroy: true

  scope :available, -> { where(state: 'on_sale').or(where(state: 'restock')) }
end
