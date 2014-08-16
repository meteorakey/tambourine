# -*- coding: utf-8 -*-
class TambourinesController < ApplicationController

  def index
    # @ はインスタンス変数
    @illust = Illust.find(1)
    @illusts = Illust.all
  end

  def create
    Illust.create(illust_params)
    redirect_to :action => :index
  end

  def destroy
    illust = Illust.find(params[:id])
    illust.destroy
    redirect_to :action => :index
  end

  private
  def illust_params
    params.require(:illust).permit(:title, :date)
  end

end

module Parser
  def parse_json(json)
    # json の型をチェック
    #puts json.class

    # json を hash にする
    hash = json.parse()

    # results に画像の hash データを格納
    results = []
    posts = hash['response']
    posts.each do |post|
      photos = post['photos']
      photos.each do |photo|
        results.push(photo['original_size'])
      end
    end
    return results
  end
end
