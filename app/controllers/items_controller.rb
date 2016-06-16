class ItemsController < ApplicationController
  before_action :logged_in_user , except: [:show]
  before_action :set_item, only: [:show]

  def new
# 検索中処理
    if params[:q]
      response = RakutenWebService::Ichiba::Item.search(
        keyword: params[:q],
        imageFlag: 1,
      )
      p response.count
      p response.first

# データと一致するものをとってくる
      @items = response.first(20)
    end
    
  end

  def show
# 商品詳細を表示する動作
　  
  end

  private
  
  def set_item
    @item = Item.find(params[:id])
  end
  
end
