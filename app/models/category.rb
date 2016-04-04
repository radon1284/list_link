class Category < ActiveRecord::Base
  has_many :links
  validates :category_name, presence: true

  def to_s
  "#{category_name}"
  end
end
