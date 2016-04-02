class Category < ActiveRecord::Base
  has_many :links

  def to_s
  "#{category_name}"
  end
end
