class Product < ActiveRecord::Base
  ##
  # Associations
  #
  has_many :line_items
  before_destroy :ensure_not_referenced_by_any_line_item

  ##
  # Validations
  #
  validates :title, presence: true, length: { minimum: 3 }, uniqueness: true
  validates :description, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0.01, less_than: 1_000_000 }
  validates :image_url, allow_blank: true, format: {
    with: %r{\.(gif|jpg|png)\Z}i,
    message: 'must be a URL for GIF, JPG, or PNG image.'
  }

  # Return the most recently updated product
  def self.latest
    Product.order(:updated_at).last
  end

  private

  def ensure_not_referenced_by_any_line_item
    if line_items.empty?
      return true
    else
      errors.add(:base, "Line Items preent")
      return false
    end
  end
end
