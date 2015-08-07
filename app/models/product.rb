class Product < ActiveRecord::Base
  validates :title, presence: true
  validates :description, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0, less_than: 1_000_000 }
end
