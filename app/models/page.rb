class Page < ApplicationRecord

  belongs_to :subject
  has_many :sections
  scope :sorted, lambda { order("position ASC") }
  
end
