class Tag < ActiveRecord::Base
    has_and_belongs_to_many :stores
    
    def self.count
        Stores_tag.where(tag: self).count
    end
    def self.search(term)
        where('LOWER(name) LIKE :term', term: "%#{term.downcase}%")
    end
end
