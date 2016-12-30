class Review < ActiveRecord::Base
    validates :body, presence: true, length: {minimum: 5, maximum: 100}
    belongs_to :chef
    belongs_to :recipe
    
    validates_uniqueness_of :chef, scope: :recipe, :message => "has already submitted a review for this recipe."
end