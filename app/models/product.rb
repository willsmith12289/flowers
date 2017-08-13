class Product < ActiveRecord::Base
  searchable do
    text :title, :default_boost => 2
    text :description
    boolean :available
  end
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  has_many :line_items
  has_many :orders, through: :line_items
  #...
  
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  before_destroy :ensure_not_referenced_by_any_line_item

  validates :title, :description, :image, presence: true
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
# 
  validates :title, uniqueness: true

  validates :title, length: {minimum: 3}

  def self.latest
    Product.order(:updated_at).last
  end

  private

    # ensure that there are no line items referencing this product
    def ensure_not_referenced_by_any_line_item
      unless line_items.empty?
        errors.add(:base, 'Line Items present')
        return false
      end
    end
end
