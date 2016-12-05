class Store < ActiveRecord::Base
    has_many :ad
    has_many :menus
    has_many :reviews
    belongs_to :foodtype
end
