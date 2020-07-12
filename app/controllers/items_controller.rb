class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
    # @image = @item.item_images.build
    @item.images.new
  end

  def create
    @item = Item.new(item_params)
    # binding.pry
    if params[:item][:images_attributes] && @item.save
    # if @item.save
      redirect_to root_path
    else
      @item.images.new
      render :new
    end
  end

  def show
  end

  private
  def item_params
    params.require(:item)
          .permit(:name,
                  :description,
                  :brand,
                  :category_id,
                  :condition,
                  :delivery_fee,
                  :delivery_regions,
                  :shipping_schedule,
                  :price,
                  images_attributes: [:image_url, :id, :_destroy])
          .merge(user_id: current_user.id)
  end
end
