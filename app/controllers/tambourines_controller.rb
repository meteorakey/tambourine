# -*- coding: utf-8 -*-
class TambourinesController < ApplicationController

  def index
    # @ はインスタンス変数
    @illust = Illust.new
    @illusts = Illust.all
  end

  def create
    Illust.create(illust_params)
    redirect_to :action => :index
  end

  def destroy
    illust = Illust.find(params[:id])
    Illust.destroy
    redirect_to :action => :index
  end

  private
  def illust_params
    params.require(:illust).permit(:title, :date)
  end


end
