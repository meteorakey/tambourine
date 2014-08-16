class Illust < ActiveRecord::Base

validates :url, :presence => true, :uniqueness => true
validates :width, :presence => true
validates :height, :presence => true

end
