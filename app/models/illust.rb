class Illust < ActiveRecord::Base

validates :title, :presence => true, :uniqueness => true
validates :date, :presence => true

end
