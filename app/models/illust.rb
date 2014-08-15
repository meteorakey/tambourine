# -*- coding: utf-8 -*-
class Illust < ActiveRecord::Base

# validation 設定
# presence は not null制約
# uniqueness は 重複禁止
validates :title, :presence => true, :uniqueness => true
validates :date, :presence => true

end
