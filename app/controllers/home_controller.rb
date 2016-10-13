class HomeController < ApplicationController
  def index
  end

  def menu
    @sections = Section.all
    @markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
    @fooditems = FoodItem.search(params[:section], params[:search])
  end

  def contact_us
  end
end
