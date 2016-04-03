class Link < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  validates_formatting_of :url, using: :url
  acts_as_votable 

  def to_s
  "#{link_name}"
  end

  def score
   self.get_upvotes.size - self.get_downvotes.size
  end

end
