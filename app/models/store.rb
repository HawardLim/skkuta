class Store < ActiveRecord::Base
    has_many :ad
    has_many :menus
    has_many :reviews
    has_many :adpics
    belongs_to :foodtype
end
