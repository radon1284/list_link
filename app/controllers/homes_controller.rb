class HomesController < ApplicationController
  def index
  	@link = Link.new
  end

  def links
  	@links = Link.all.order("created_at DESC")
  end
end
