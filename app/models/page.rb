class Page < ApplicationRecord

  belongs_to :subject
  has_many :sections

  scope :visible, lambda { where(:visible => true) }
  scope :invisible, lambda { where(:visible => true) }
  scope :sorted, lambda { order("position ASC") }
  scope :newest_first, lambda { where("created_at DESC") }
  scope :visible, lambda { |query| where("name LIKE ?", "%#{query}%") }

  validates_presence_of :name
  validates_length_of :name, :maximum => 255
  validates_presence_of :permalink
  validates_length_of :permalink, :within => 3..255
  validade_uniqueness_of :permalink
  
end
