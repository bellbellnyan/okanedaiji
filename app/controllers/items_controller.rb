class ItemsController < ApplicationController
  before_action :set_item, only: [:update, :destroy, :show, :edit]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      # 保存に成功した場合
      redirect_to items_url, notice: "保存に成功しました"
    else
      flash.now[:error] = "保存に失敗しました"
      # 保存に失敗した場合
      render :new
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_url(@item), notice: "更新に成功しました"
    else
      flash.now[:error] = "更新に失敗しました"
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to items_url, notice: "削除しました"
  end

  def edit
  end

  def show

  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:title)
  end
end
