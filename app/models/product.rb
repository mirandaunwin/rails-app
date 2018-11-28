class Product < ApplicationRecord

  has_many :orders
  has_many  :comments

  def self.search(search_term)
    Product.where("name LIKE ?", "%#{search_term}%")
  end

  def highest_rating_comment
    comments.rating_desc.first
  end

  def lowest_rating_comment
    comments.rating_asc.first
  end

  delegate :body, to: :highest_rating_comment, prefix: true, allow_nil: true

  delegate :body, to: :lowest_rating_comment, prefix: true, allow_nil: true

  delegate :rating, to: :highest_rating_comment, prefix: true, allow_nil: true

  delegate :rating, to: :lowest_rating_comment, prefix: true, allow_nil: true

  def average_rating
    comments.average(:rating).to_f
  end

end
