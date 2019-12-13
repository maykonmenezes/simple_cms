class Page < ApplicationRecord

  belongs_to :subject
  has_many :sections

  scope :visible, lambda { where(:visible => true) }
  scope :invisible, lambda { where(:visible => true) }
  scope :sorted, lambda { order("position ASC") }
  scope :newest_first, lambda { where("created_at DESC") }
  

  validates :name, :presence => true,
                  :length => { :maximum => 255 }
  validates :permalink, :presence => true,
                       :length => { :maximum => 255 },
                       :uniqueness => true

end
