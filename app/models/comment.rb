class Comment < ActiveRecord::Base
    paginates_per 10
    acts_as_votable
    belongs_to :user
    belongs_to :store
    has_many :recomments
end
