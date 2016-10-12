class HomeController < ApplicationController
  def index
  end

  def menu
    @sections = Section.all
    @markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
  end

  def contact_us
  end
end
