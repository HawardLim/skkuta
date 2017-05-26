class Store < ActiveRecord::Base
    has_many :ad
    has_many :menus
    has_many :reviews
    has_many :adpics
    belongs_to :foodtype
    has_and_belongs_to_many :tags
end
