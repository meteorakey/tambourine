# -*- coding: utf-8 -*-
require 'tumblr_client'
require 'json'

class TambourinesController < ApplicationController
  
  def index
    # @ はインスタンス変数
    @illust = Illust.new
    @illusts = Illust.all
  end

  def create
    client = Tumblr::Client.new({
                                  :consumer_key => 'cSmyS3pGfKslbJksRu7gM0IaxUWzkpUh9grFRpDuivRfW87AwV',
                                  :consumer_secret => '0TfaHWWt8Gw9xaXXhSPw2ad0sjUTDE382g3Lh4IypdjMg3SJIU',
                                  :oauth_token => 'GGrRgDMdtQedlVzJxREpta0ZSY2tVYvdQqr6ArgBVZHGTG90l6',
                                  :oauth_token_secret => 'Cjm0lDgGH51jnbi1NBI7JeDj33MgLHWdHaIDN2xuTII03okQIH'
                                })
    json_resp = client.tagged params[:illust][:title]
    render :text => json_resp
  end

  def destroy
    illust = Illust.find(params[:id])
    illust.destroy
    redirect_to :action => :index
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
  module_function:parse_json
end
