class HomeController < ApplicationController
  def index
  end

  def menu
    @sections = Section.all
    @markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
    # @fooditems = FoodItem.search(params[:section], params[:search])

    if params[:section]
      @section =  Section.where(name: params[:section]).first
      @food_items = FoodItem.where(section_id: @section.id.to_s)
    else
      @food_items = FoodItem.all
    end

    if params[:sort]
      if params[:dir]
        @dir = params[:dir]
      else
        @dir = 'asc'
      end

      @food_items = @food_items.order("#{params[:sort]} #{@dir}")
    end

    @order_item = current_order.order_items.new
  end

  def contact_us
  end
end
