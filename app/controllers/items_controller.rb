class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def create
    item = Item.new(item_params)
    if item.save
      flash[:success] = 'Item Successfully created'
      redirect_to items_path
    else
      render 'new'
    end
  end

  def item_params
    params.require(:item).permit(:name, :item_type, :price, :discount)
  end
end
