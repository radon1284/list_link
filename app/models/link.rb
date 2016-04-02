class Link < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  validates_formatting_of :url, using: :url
  acts_as_votable 
end
