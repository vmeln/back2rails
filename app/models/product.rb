class Product < ActiveRecord::Base
  validates :title, :description, :image_url, :presence => true
  validates :price, :numericality => {:greater_than_or_equal_to => 0.01}
  validates :title, :uniqueness => true

  # TODO: add Image Url validation after image uploading

  default_scope -> { order('title') }

  has_many :line_items
  has_many :orders, through: :line_items

  before_destroy :enssure_not_referenced_by_any_line_item

  def enssure_not_referenced_by_any_line_item
    if (line_items.count.zero?)
      true
    else
      errors.add(:base, 'Line items present')
      false
    end
  end
end