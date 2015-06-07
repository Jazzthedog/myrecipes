class Like < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :chef
  
  validates_uniqueness_of :chef , scope: :recipe
end